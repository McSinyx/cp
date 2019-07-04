(defvar *dbg-ids* nil "Identifiers used by dbg.")

(defun debug-pseudo (&rest ids)
  "Start dbg output on the given ids."
  (setf *dbg-ids* (union ids *dbg-ids*)))

(defun undebug-pseudo (&rest ids)
  "Stop dbg on the ids. With no ids, stop dbg altogether."
  (setf *dbg-ids* (unless (null ids) (set-difference *dbg-ids* ids))))

(defun dbg (id indent format-string &rest args)
  "Print debugging info if (DEBUG ID) has been specified."
  (when (member id *dbg-ids*)
    (format *debug-io* "~&~V@T~?" (* 2 indent) format-string args)))

(defvar *ops* nil "A list of available operators.")

(defstruct op
  "An operation"
  (action nil)
  (preconds nil)
  (add-list nil)
  (del-list nil))

(defun starts-with? (list x)
  "Is this a list whose first element is x?"
  (and (consp list) (eql (first list) x)))

(defun executing? (x)
  "Is x of the form: (executing ...) ?"
  (starts-with? x 'executing))
(defun action? (state)
  "Is state an action?"
  (or (equal state '(start)) (executing? x)))

(defun convert-op! (op)
  "Make op conform to the (EXECUTING op) convention."
  (unless (some #'executing? (op-add-list op))
    (push (list 'executing (op-action op)) (op-add-list op)))
  op)

(defun op (action &key preconds add-list del-list)
  (convert-op! (make-op :action action
                        :preconds preconds
                        :add-list add-list
                        :del-list del-list)))

(defun appropriate? (goal op)
  "An op is appropriate to a goal if it's in its add-list."
  (member goal (op-add-list op) :test #'equal))

(defun apply-op (state goal op goal-stack)
  "Return a new, transformed state if op is applicable."
  (dbg 'gps (length goal-stack) "; Consider: ~a" (op-action op))
  (let ((state2 (achieve-all state (op-preconds op) (cons goal goal-stack))))
    (unless (null state2)
      (dbg 'gps (length goal-stack) "; Action: ~a" (op-action op))
      (append (remove-if (lambda (x) (member x (op-del-list op) :test #'equal))
                         state2)
              (op-add-list op)))))

(defun appropriate-ops (goal state)
  "Return a list of appropriate operators,
  sorted by the number of unfulfulled preconditions."
  (sort (copy-list (remove-if-not (lambda (op) (appropriate? goal op)) *ops*))
        #'< :key (lambda (op)
                   (count-if (lambda (precond)
                               (not (member precond state :test #'equal)))
                             (op-preconds op)))))

(defun achieve (state goal goal-stack)
  "A goal is achieved if it already holds,
  or if there is an appropriate op for it that is applicable."
  (dbg 'gps (length goal-stack) "; Goal: ~a" goal)
  (cond ((member goal state :test #'equal) state)
        ((member goal goal-stack :test #'equal) nil) ; in case of infinite loop
        (t (some (lambda (op) (apply-op state goal op goal-stack))
                 (appropriate-ops goal state)))))

(defun achieve-all (state goals goal-stack)
  "Try to achieve each goal, then make sure they still hold."
  (let ((current-state state))
    (if (and (every (lambda (g) (setf current-state
                                      (achieve current-state g goal-stack)))
                    goals)
             (subsetp goals current-state :test #'equal))
        current-state)))

(defun GPS (state goals &optional (*ops* *ops*))
  "General Problem Solver: achieve all goals from current *state* using *ops*."
  (remove-if-not #'action? (achieve-all (cons '(start) state) goals nil)))

(defun use! (oplist)
  "Use oplist as the default list of operators."
  (length (setf *ops* oplist)))

; Drive son to school
(defparameter *school-ops*
  (list
   (make-op :action 'drive-son-to-school
            :preconds '(son-at-home car-works)
            :add-list '(son-at-school)
            :del-list '(son-at-home))
   (make-op :action 'shop-installs-battery
            :preconds '(car-needs-battery shop-knows-problem shop-has-money)
            :add-list '(car-works))
   (make-op :action 'tell-shop-problem
            :preconds '(in-comunication-with-shop)
            :add-list '(shop-knows-problem))
   (make-op :action 'telephone-shop
            :preconds '(know-phone-number)
            :add-list '(in-comunication-with-shop))
   (make-op :action 'ask-phone-number
            :preconds '(in-comunication-with-shop)
            :add-list '(know-phone-number))
   (make-op :action 'look-up-number
            :preconds '(have-phone-book)
            :add-list '(know-phone-number))
   (make-op :action 'give-shop-money
            :preconds '(have-money)
            :add-list '(shop-has-money)
            :del-list '(have-money))))
(mapc #'convert-op! *school-ops*)

; Monkey and Bananas
(defparameter *banana-ops*
  (list (op 'climb-on-chair
            :preconds '(chair-at-middle-room at-middle-room on-floor)
            :add-list '(at-bananas on-chair)
            :del-list '(at-middle-room on-chair))
        (op 'push-chair-from-door-to-middle-room
            :preconds '(chair-at-door at-door)
            :add-list '(chair-at-middle-room at-middle-room)
            :del-list '(chair-at-door at-door))
        (op 'walk-from-door-to-middle-room
            :preconds '(at-door on-floor)
            :add-list '(at-middle-room)
            :del-list '(at-door))
        (op 'grasp-bananas
            :preconds '(at-bananas empty-handed)
            :add-list '(has-bananas)
            :del-list '(empty-handed))
        (op 'drop-ball
            :preconds '(has-ball)
            :add-list '(empty-handed)
            :del-list '(has-ball))
        (op 'eat-bananas
            :preconds '(has-bananas)
            :add-list '(empty-handed not-hungry)
            :del-list '(has-bananas hungry))))

; Maze searching
(defun make-maze-op (src dest)
  "Make an operator to more between two places."
  (op `(move from ,src to ,dest)
      :preconds `((at ,src))
      :add-list `((at ,dest))
      :del-list `((at ,src))))

(defun make-maze-ops (pairs)
  "Make maze ops from list of directions."
  (unless (null pairs)
    (let ((pair (first pairs)))
      (list* (make-maze-op (car pair) (cdr pair))
             (make-maze-op (cdr pair) (car pair))
             (make-maze-ops (rest pairs))))))

(defparameter *maze-ops*
  (make-maze-ops
   '((1 . 2) (2 . 3) (3 . 4) (4 . 9) (9 . 14) (9 . 8) (8 . 7)
     (7 . 12) (12 . 13) (12 . 11) (11 . 6) (11 . 16) (16 . 17)
     (17 . 22) (21 . 22) (22 . 23) (23 . 18) (23 . 24) (24 . 19)
     (19 . 20) (20 . 15) (15 . 10) (10 . 5) (20 . 25))))

(defun find-path (start end)
  "Search the maze for a path from start to end."
  (let ((result (GPS `((at ,start)) `((at ,end)) *maze-ops*)))
    (unless (null result)
      (cons start (mapcar (lambda (action) (fifth (second action)))
                          (rest result))))))

; Blocks World
(defun move-op (a b c)
  "Make an operator to move a from b to c."
  (labels ((move-ons (a b c)
             (if (eq b 'table)
                 `((,a on ,c))
                 `((,a on ,c) (space on ,b)))))
    (op `(move ,a from ,b to ,c)
        :preconds `((space on ,a) (space on ,c) (,a on ,b))
        :add-list (move-ons a b c)
        :del-list (move-ons a c b))))

(defun make-block-ops (blocks)
  "Create an operator for each possible block move."
  (let ((ops nil))
    (dolist (a blocks)
      (dolist (b blocks)
        (unless (equal b a)
          (push (move-op a 'table b) ops)
          (push (move-op a b 'table) ops)
          (dolist (c blocks)
            (unless (or (equal c a) (equal b c))
              (push (move-op a b c) ops))))))
    ops))

(defun range (start stop &optional (step 1))
  "Return a list of numbers from start (inclusive) to stop (exclusive) by step."
  (let (result)
    (do ((a start (+ a step)))
        ((>= (* (- a stop) step) 0) (reverse result))
      (push a result))))
(defun permutations (list &optional r)
  "Return successive r-length permutations of elements in the list."
  (let* ((n (length list))
         (r (or r n)))
    (unless (> r n)
      (let ((indices (range 0 n))
            (cycles (range n (- n r) -1))
            (rrr (range (1- r) -1 -1))
            (result (list (subseq list 0 r))))
        (do ((going nil (dolist (i rrr t)
                          (mapc #'print `(,i ,indices ,cycles ,result))
                          (decf (elt cycles i))
                          (let ((j (elt cycles i)))
                            (cond ((= j 0)
                                   (setf (elt cycles i) (- n i))
                                   (let ((tail (elt indices i)))
                                     (nconc (delete tail indices) (list tail))))
                                  (t (rotatef (elt indices (- n j))
                                              (elt indices i))
                                     (push (mapcar (lambda (k) (elt list k))
                                                   (subseq indices 0 r))
                                           result)
                                     (return)))))))
            (going (reverse result)))))))

; Searching tools
(defconstant fail nil "Indication of search failure.")
(defun tree-search (states goal? successors combiner)
  "Find a state that satisfies goal?. Start with states,
  and search according to successors and combiner."
  (dbg 'search 0 ";; Search: ~a" states)
  (cond ((null states) fail)
        ((funcall goal? (first states)) (first states))
        (t (tree-search (funcall combiner
                                 (funcall successors (first states))
                                 (rest states))
                        goal? successors combiner))))
(defun tree-do-search (states goal? successors combiner)
  "Find a state that satisfies goal?. Start with states, and search according to
  successors and combiner. Use an explicit loop rather than recursion."
  (if (null states)
      fail
      (do ((current-states states
                           (funcall combiner
                                    (funcall successors (first current-states))
                                    (rest current-states))))
          ((null current-states) fail)
        (dbg 'search 0 ";; Search: ~a" current-states)
        (when (funcall goal? (first current-states))
          (return (first current-states))))))

(defun prepend (new old) (append old new))
(defun is (value &key (key #'identity) (test #'eql))
  (lambda (x) (funcall test (funcall key x) value)))

(defun dfs (start goal? successors)
  "Search new states first until goal is reached."
  (tree-search (list start) goal? successors #'append))
(defun bfs (start goal? successors)
  "Search old states first until goal is reached."
  (tree-search (list start) goal? successors #'prepend))

(defun binary-tree (x) (list (* x 2) (+ x x 1)))
(defun finite-binary-tree (n)
  "Return a successor function that generates a binary tree with n nodes."
  (lambda (x) (remove-if (lambda (child) (> child n))
                         (binary-tree x))))
(defun next2 (x) (list (+ x 1) (+ x 2)))

(defun sorter (cost-fn)
  "Return a combiner function that sorts according to cost-fn."
  (lambda (new old)
    (merge 'list (sort new #'< :key cost-fn) old #'< :key cost-fn)))
(defun best-1st-search (start goal? successors cost-fn)
  "Search the lowest cost states first until goal is reached."
  (tree-search (list start) goal? successors (sorter cost-fn)))

(defun diff (num)
  "Return the function that finds the difference from num."
  (lambda (x) (abs (- x num))))
(defun price-is-right (price)
  "Return a function that measures the difference from price,
  but give a penalty for going over the price."
  (lambda (x) (if (> x price)
                  most-positive-fixnum
                  (- price x))))

(defun beam-search (start goal? successors cost-fn beam-width)
  "Search highest scoring states first until goal is reached,
  but never consider more than beam-width states at a time."
  (tree-search (list start) goal? successors
               (lambda (new old)
                 (let ((sorted (funcall (sorter cost-fn) new old)))
                   (if (<= (length sorted) beam-width)
                       sorted
                       (subseq sorted 0 beam-width))))))
(defun iter-wide-search (start goal? successors cost-fn
                         &key (width 1) (max 100))
  "Search, increasing beam width from width to max.
  Return the first solution found at any width."
  (dbg 'search 0 "; Width: ~d" width)
  (unless (> width max)
    (or (beam-search start goal? successors cost-fn width)
        (iter-wide-search start goal? successors cost-fn
                          :width (1+ width) :max max))))
(defun search-all (start goal? successors cost-fn beam-width)
  "Find all solutions to a search problem, using beam search."
  (let ((solutions nil))
    (beam-search start
                 (lambda (x) (when (funcall goal? x) (push x solutions)) nil)
                 successors cost-fn beam-width)
    solutions))

(defstruct (city (:type list)) name long lat)
(defparameter *cities*
  '((Atlanta 84.23 33.45)
    (Boston 71.05 42.21)
    (Chicago 87.37 41.50)
    (Denver 105.00 39.45)
    (Eugene 123.05 44.03)
    (Flagstaff 111.41 35.13)
    (Grand-Jet 108.37 39.05)
    (Houston 105.00 34.00)
    (Indianapolis 86.10 39.46)
    (Jacksonville 81.40 30.22)
    (Kansas-City 94.35 39.06)
    (Los-Angeles 118.15 34.03)
    (Memphis 90.03 35.09)
    (New-York 73.58 40.47)
    (Oklahoma-City 97.28 35.26)
    (Pittsburgh 79.57 40.27)
    (Quebec 71.11 46.49)
    (Reno 119.49 39.30)
    (San-Francisco 122.26 37.47)
    (Tampa 82.27 27.57)
    (Victoria 123.21 48.25)
    (Wilmington 77.57 34.14)))

(defconstant earth-diameter 12765.0 "Diameter of planet Earth in kilometers.")
(defun distance (point1 point2)
  "The Euclidean distance between two points.
  The points are coordinates in n-dimensional space."
  (sqrt (reduce #'+ (mapcar (lambda (a b) (expt (- a b) 2)) point1 point2))))
(defun deg->rad (deg)
  "Convert degrees and minutes to radians."
  (* (+ (truncate deg) (* (rem deg 1) 100/60)) pi 1/180))
(defun xyz-coords (city)
  "Return the (x y z) coordinates of a point on a sphere.
  The center is (0 0 0) and the north pole is (0 0 1)."
  (let ((psi (deg->rad (city-lat city)))
        (phi (deg->rad (city-long city))))
    (list (* (cos psi) (cos phi))
          (* (cos psi) (sin phi))
          (sin psi))))
(defun air-distance (city1 city2)
  "The great circle distance between two cities."
  (let ((d (distance (xyz-coords city1) (xyz-coords city2))))
    (* earth-diameter (asin (/ d 2)))))

(defun neighbor-cities (city)
  "Find all cities within 1000 kilometers."
  (remove-if (lambda (c) (or (eq c city) (> (air-distance c city) 1000.0)))
             *cities*))
(defun city (name) "Find the city with this name." (assoc name *cities*))

(defstruct (path (:print-function print-path))
  state (previous nil) (cost-so-far 0) (total-cost 0))
(defun print-path (path &optional (stream t) depth)
  (declare (ignore depth))
  (format stream "#<Path to ~a costs ~,1f>"
          (path-state path) (path-total-cost path)))
(defun map-path (fn path)
  "Call fn on each state in the path, collecting the results."
  (unless (null path)
    (cons (funcall fn (path-state path))
          (map-path fn (path-previous path)))))
(defun show-city-path (path &optional (stream t))
  "Show the length of a path, and the cities along it."
  (format stream "#<Path ~,1f km: ~{~:(~a~)~^ - ~}>"
          (path-total-cost path) (reverse (map-path #'city-name path)))
  (values))

(defun path-saver (successors cost-fn cost-left-fn)
  (lambda (old-path)
    (let ((old-state (path-state old-path)))
      (mapcar (lambda (new-state)
                (let ((old-cost (+ (path-cost-so-far old-path)
                                   (funcall cost-fn old-state new-state))))
                  (make-path :state new-state
                             :previous old-path
                             :cost-so-far old-cost
                             :total-cost (+ (funcall cost-left-fn new-state)
                                            old-cost))))
              (funcall successors old-state)))))
(defun trip (start dest &optional (beam-width 1))
  "Search for a way from the start to dest."
  (beam-search (make-path :state start)
               (is dest :key #'path-state)
               (path-saver #'neighbor-cities #'air-distance
                           (lambda (c) (air-distance c dest)))
               #'path-total-cost
               beam-width))

(defun new-states (states successors state= old-states)
  "Generate successor states that have not been seen before."
  (remove-if (lambda (state) (or (member state old-states :test state=)
                                 (member state states :test state=)))
             (funcall successors (first states))))
(defun graph-search (states goal? successors combiner
                     &optional (state= #'eql) old-states)
  "Find a state that satisfies goal?. Start with states and search
  according to successors and combiner. Don't try the same state twice."
  (dbg 'search 0 ";; Search: ~a" states)
  (cond ((null states) fail)
        ((funcall goal? (first states)) (first states))
        (t (graph-search (funcall combiner
                                  (new-states states successors state= old-states)
                                  (rest states))
                         goal? successors combiner state=
                         (adjoin (first states) old-states :test state=)))))
(defun hash-graph-search (states goal? successors combiner
                          &optional (state= #'eql)
                            (old-states
                             (let ((os (make-hash-table :test state=)))
                               (mapcar (lambda (state)
                                         (setf (gethash state os) t))
                                       states)
                               os)))
  "Find a state that satisfies goal?. Start with states and search according to
  successors and combiner. Use hash-table to test and avoid states that
  has been seen before."
  (dbg 'search 0 ";; Search: ~a" states)
  (cond ((null states) fail)
        ((funcall goal? (first states)) (first states))
        (t (setf (gethash (first states) old-states) t)
           (hash-graph-search
            (funcall combiner
                     (remove-if-not
                      (lambda (state) (unless (gethash state old-states)
                                        (setf (gethash state old-states) t)))
                      (funcall successors (first states)))
                     (rest states))
            goal? successors combiner state= old-states))))

(defun path-states (path)
  "Collect the states along this path."
  (map-path #'identity path))
(defun find-path (state paths state=)
  "Find the path with this state among a list of paths."
  (find state paths :key #'path-state :test state=))
(defun better-path? (path1 path2)
  "Is path1 cheaper than path2?"
  (< (path-total-cost path1) (path-total-cost path2)))
(defun insert-path (path paths)
  "Put path into the right position, sorted by total cost."
  (merge 'list (list path) paths #'< :key #'path-total-cost))
(defun a*-search (paths goal? successors cost-fn cost-left-fn
                  &optional (state= #'eql) old-paths)
  "Find a path whose state satisfies goal?. Start with paths,
  and expand successors, exploring least cost first.
  When there are duplicate states, keep the one with the lower cost
  and discard the other."
  (dbg 'search 0 ";; Search: ~a" paths)
  (cond ((null paths) fail)
        ((funcall goal? (path-state (first paths)))
         (values (first paths) paths))
        (t (let* ((path (pop paths))
                  (state (path-state path)))
             (setf old-paths (insert-path path old-paths))
             (dolist (state2 (funcall successors state))
               (let* ((cost (+ (path-cost-so-far path)
                               (funcall cost-fn state2)))
                      (cost2 (funcall cost-left-fn state2))
                      (path2 (make-path :state state2 :previous path
                                        :cost-so-far cost
                                        :total-cost (+ cost cost2)))
                      old)
                 (cond ((setf old (find-path state2 paths state=))
                        (when (better-path path2 old)
                          (setf paths (insert-path path2 (delete old paths)))))
                       ((setf old (find-path state2 old-paths state=))
                        (when (better-path path2 old)
                          (setf paths (insert-path path2 paths))
                          (setf old-paths (delete old old-paths))))
                       (t (setf paths (insert-path path2 paths))))))
             (a*-search paths goal? successors cost-fn cost-left-fn
                        state= old-paths)))))
(defun hash-a*-search (paths goal? successors cost-fn cost-left-fn
                       &optional (state= #'eql) old-paths)
  "Find a path whose state satisfies goal?. Start with paths, and expand
  successors, exploring least cost first. When there are duplicate states,
  which are logged in a hash-table, keep the one with the lower cost
  and discard the other."
  (dbg 'search 0 ";; Search: ~a" paths)
  (cond ((null paths) fail)
        ((funcall goal? (path-state (first paths)))
         (values (first paths) paths))
        (t (let* ((path (pop paths))
                  (state (path-state path)))
             (setf old-paths (insert-path path old-paths))
             (dolist (state2 (funcall successors state))
               (let* ((cost (+ (path-cost-so-far path)
                               (funcall cost-fn state2)))
                      (cost2 (funcall cost-left-fn state2))
                      (path2 (make-path :state state2 :previous path
                                        :cost-so-far cost
                                        :total-cost (+ cost cost2)))
                      old)
                 (cond ((setf old (find-path state2 paths state=))
                        (when (better-path path2 old)
                          (setf paths (insert-path paths (delete old paths)))))
                       ((setf old (find-path state2 old-paths state=))
                        (when (better-path path2 old)
                          (setf paths (insert-path path2 paths))
                          (setf old-paths (delete old old-paths))))
                       (t (setf paths (insert-path path2 paths))))))
             (hash-a*-search paths goal? successors cost-fn cost-left-fn
                             state= old-paths)))))

(defun applicable-ops (state)
  "Return a list of all ops that are applicable now."
  (remove-if-not (lambda (op) (subsetp (op-preconds op) state :test #'equal))
                 *ops*))
(defun gps-successors (state)
  "Return a list of states reachable from this one using ops."
  (mapcar (lambda (op)
            (append (remove-if (lambda (x)
                                 (member x (op-del-list op) :test #'equal))
                               state)
                    (op-add-list op)))
          (applicable-ops state)))
(defun search-gps (start goal &optional (beam-width 10))
  "Search for a sequence of operators leading to goal."
  (remove-if-not
   #'action?
   (beam-search (cons '(start) start)
                (lambda (state) (subsetp goal state :test #'equal))
                #'gps-successors
                (lambda (state)
                  (+ (cound-if #'action? state)
                     (count-if (lambda (con)
                                 (not (member con state :test #'equal))))))
                beam-width)))

(defun compose (&rest functions)
  "Return the function that except one argument and nestedly call functions."
  (lambda (x) (reduce #'funcall functions :from-end t :initial-value x)))
