(defconstant fail nil "Indicates pat-match failure.")
(defconstant no-bindings '((t . t))
  "Indicates pat-match success with no variables.")

(defun variable? (x)
  "Is x a variable (a symbol beginning with '?')?"
  (and (symbolp x) (equal (char (symbol-name x) 0) #\?)))

(defun get-binding (var bindings)
  "Find a (var . val) pair in a binding list."
  (assoc var bindings))

(defun binding-val (binding)
  "Get the value part of a single binding."
  (cdr binding))

(defun lookup (var bindings)
  "Get the value part (for var) from a binding list."
  (binding-val (get-binding var bindings)))

(defun extend-bindings (var val bindings)
  "Add a (var . val) pair to a binding list."
  (cons (cons var val) (unless (eq bindings no-bindings) bindings)))

(defun match-variable (var input bindings)
  "Does VAR match input? Update and return bindings."
  (let ((binding (get-binding var bindings)))
    (cond ((not binding) (extend-bindings var input bindings))
          ((equal (binding-val binding) input) bindings)
          (t fail))))

(defun first-match-pos (pat input start)
  "Find the first position that pat could possibly match input,
  starting at position start. If pat is non-constant, simply return start."
  (cond ((and (atom pat) (not (variable? pat)))
         (position pat input :start start :test #'equal))
        ((< start (length input)) start)
        (t nil)))

(defun segment-match (pattern input bindings &optional (start 0))
  "Match the segment pattern ((:* var) . pat) against input."
  (let ((var (cadar pattern))
        (pat (rest pattern)))
    (if (null pat)
        (match-variable var input bindings)
        ; Assume that a pattern cannot have 2 consecutive vars
        (let ((binding (get-binding var bindings))
              (pos (first-match-pos (first pat) input start)))
          (cond ((null pos) fail)
                ((null binding)
                 (let ((b2 (pat-match pat (subseq input pos)
                                      (extend-bindings var (subseq input 0 pos)
                                                       bindings))))
                   (if (eq b2 fail)
                       (segment-match pattern input bindings (1+ pos))
                       b2)))
                ((eq (binding-val binding) (subseq input 0 pos))
                 (pat-match pat (subseq input pos) bindings))
                (t fail))))))
(setf (get :* 'segment-match) 'segment-match)

(defun segment-match-+ (pattern input bindings)
  "Match one or more elements of input."
  (segment-match pattern input bindings 1))
(setf (get :+ 'segment-match) 'segment-match-+)

(defun segment-match-? (pattern input bindings)
  "Match zero or one element of input."
  (let ((var (cadar pattern))
        (pat (rest pattern)))
    (or (pat-match (cons var pat) input bindings)
        (pat-match pat input bindings))))
(setf (get :? 'segment-match) 'segment-match-?)

(defun match-if (pattern input bindings)
  "Test an arbitrary expression involving variables.
  The pattern looks like ((:if code) . rest)."
  (and (eval (sublis bindings (cadar pattern)))
       (pat-match (rest pattern) input bindings)))
(setf (get :if 'segment-match) 'match-if)

(defun segment-match-fn (x)
  "Get the segment-match function for x."
  (when (keywordp x) (get x 'segment-match)))

(defun segment-pattern? (pattern)
  "Is this a segment matching pattern: ((:* var) . pat) ?"
  (and (consp pattern) (consp (first pattern)) (symbolp (caar pattern))
       (segment-match-fn (caar pattern))))

(defun segment-matcher (pattern input bindings)
  "Calls the right function for this king of segment pattern."
  (funcall (segment-match-fn (caar pattern)) pattern input bindings))

(defun match-is (var-and-pred input bindings)
  "Succeed and bind var if the input satisfies pred,
  where var-and-pred is the list (var pred)."
  (let* ((var (first var-and-pred))
         (pred (second var-and-pred))
         (new-bindings (pat-match var input bindings)))
    (if (or (eq new-bindings fail)
            (not (funcall pred input)))
        fail
        new-bindings)))
(setf (get :is 'single-match) 'match-is)

(defun match-and (patterns input bindings)
  "Succeed if all the patterns match the input."
  (cond ((eq bindings fail) fail)
        ((null patterns) bindings)
        (t (match-and (rest patterns) input
                      (pat-match (first patterns) input bindings)))))
(setf (get :and 'single-match) 'match-and)

(defun match-or (patterns input bindings)
  "Succeed if any one of the patterns match the input."
  (if (null patterns)
      fail
      (let ((new-bindings (pat-match (first patterns) input bindings)))
        (if (eq new-bindings fail)
            (match-or (rest patterns) input bindings)
            new-bindings))))
(setf (get :or 'single-match) 'match-or)

(defun match-not (patterns input bindings)
  "Succeed of none of the patterns match the input.
  This will never bind any variable."
  (if (match-or patterns input bindings)
      fail
      bindings))
(setf (get :not 'single-match) 'match-not)

(defun single-match-fn (x)
  "Get the single-match function for x."
  (when (keywordp x) (get x 'single-match)))

(defun single-pattern? (pattern)
  "Is this a single-matching pattern?"
  (and (consp pattern) (single-match-fn (first pattern))))

(defun single-matcher (pattern input bindings)
  "Call the right function for this kind of single pattern."
  (funcall (single-match-fn (first pattern)) (rest pattern) input bindings))

(defun pat-match (pattern input &optional (bindings no-bindings))
  "Match pattern against input in the context of the bindings."
  (cond ((eq bindings fail) fail)
        ((variable? pattern) (match-variable pattern input bindings))
        ((eql pattern input) bindings)
        ((segment-pattern? pattern) (segment-matcher pattern input bindings))
        ((single-pattern? pattern) (single-matcher pattern input bindings))
        ((and (consp pattern) (consp input))
         (pat-match (rest pattern) (rest input)
                    (pat-match (first pattern) (first input) bindings)))
        (t fail)))

(defparameter *eliza-rules*
 '(((?x* hello ?y*)
    (How do you do? Please state your problem.))
   ((?x* computer ?y*)
    (Do computers worry you?) (What do you think about machines?)
    (Why do you mention computers?)
    (What do you think machines have to do with your problem?))
   ((?x* name ?y*)
    (I am not interested in names.))
   ((?x* sorry ?y*)
    (Please don't apnologize.) (Apologies are not necessary.)
    (What feelings do you have when you apologize?))
   ((?x* I remember ?y*)
    (Do you often think of ?y ?)
    (Does thinking of ?y bring anything else to mind?)
    (What else do you remember?) (Why do you recall ?y right now?)
    (What in the present situation reminds you of ?y ?)
    (What is the connection between you and ?y ?))
   ((?x* do you remember ?y*)
    (Did you think I would forget ?y ?)
    (Why do you think I should recall ?y now ?)
    (What about ?y ?) (You mentioned ?y))
   ((?x* if ?y*)
    (Do you really think its likely that ?y ?) (Do you wish that ?y ?)
    (What do you think about ?y ?) (Really-- if ?y))

   ((?x* I dreamt ?y*)
    (Really-- ?y) (Have you ever fantasized ?y while you were awake?)
    (Have you dreamt ?y before?))
   ((?x* dream about ?y*)
    (How do you feel about ?y in reality?))
   ((?x* dream ?y*)
    (What does this dream suggest to you?) (Do you dream often?)
    (What persons appear in your dreams?)
    (Don't you believe that dream has to do with your problem?))
   ((?x* my mother ?y*)
    (Who else in your family ?y ?) (Tell me more about your family.))
   ((?x* my father ?y*)
    (Your father) (Does he influence you strongly?)
    (What else comes to mind when you think of your father?))

   ((?x* I want ?y*)
    (What would it mean if you got ?y)
    (Why do you want ?y) (Suppose you got ?y soon))
   ((?x* I am glad ?y*)
    (How have I helped you to be ?y) (What makes you happy just now)
    (Can you explain why you are suddenly ?y))
   ((?x* I am sad ?y*)
    (I am sorry to hear you are depressed)
    (I'm sure its not pleasant to be sad))
   ((?x* are like ?y*)
    (What resemblance do you see between ?x and ?y))
   ((?x* is like ?y*)
    (In what way is it that ?x is like ?y)
    (What resemblance do you see?)
    (Could there really be some connection?) (How?))
   ((?x* alike ?y*)
    (In what way?) (What similarities are there?))
   ((?x* same ?y*)
    (What other connections do you see?))

   ((?x* I was ?y*)
    (Were you really?) (Perhaps I already knew you were ?y)
    (Why do you tell me you were ?y now?))
   ((?x* was I ?y*)
    (What if you were ?y ?) (Do you think you were ?y ?)
    (What would it mean if you were ?y))
   ((?x* I am ?y*)
    (In what way are you ?y ?) (Do you want to be ?y ?))
   ((?x* am I ?y*)
    (Do you believe you are ?y) (Would you want to be ?y)
    (You wish I would tell you you are ?y)
    (What would it mean if you were ?y))
   ((?x* am ?y*)
    (Why do you say "AM?") (I don't understand that))
   ((?x* are you ?y*)
    (Why are you interested in whether I am ?y or not?)
    (Would you prefer if I weren't ?y)
    (Perhaps I am ?y in your fantasies))
   ((?x* you are ?y*)
    (What makes you think I am ?y ?))

   ((?x* because ?y*)
    (Is that the real reason?) (What other reasons might there be?)
    (Does that reason seem to explain anything else?))
   ((?x* were you ?y*)
    (Perhaps I was ?y) (What do you think?) (What if I had been ?y))
   ((?x* I can't ?y*)
    (Maybe you could ?y now) (What if you could ?y ?))
   ((?x* I feel ?y*)
    (Do you often feel ?y ?))
   ((?x* I felt ?y*)
    (What other feelings do you have?))
   ((?x* I ?y* you (:* ?z))
    (Perhaps in your fantasy we ?y each other))
   ((?x* why don't you ?y*)
    (Should you ?y yourself?)
    (Do you believe I don't ?y) (Perhaps I will ?y in good time))
   ((?x* yes ?y*)
    (You seem quite positive) (You are sure) (I understand))
   ((?x* no ?y*)
    (Why not?) (You are being a bit negative)
    (Are you saying "NO" just to be negative?))

   ((?x* someone ?y*)
    (Can you be more specific?))
   ((?x* everyone ?y*)
    (surely not everyone) (Can you think of anyone in particular?)
    (Who for example?) (You are thinking of a special person))
   ((?x* always ?y*)
    (Can you think of a specific example) (When?)
    (What incident are you thinking of?) (Really-- always))
   ((?x* what ?y*)
    (Why do you ask?) (Does that question interest you?)
    (What is it you really want to know?) (What do you think?)
    (What comes to your mind when you ask that?))
   ((?x* perhaps ?y*)
    (You do not seem quite certain))
   ((?x* are ?y*)
    (Did you think they might not be ?y)
    (Possibly they are ?y))
   ((?x*)
    (Tell me more about you) ; to be replaced with info from dialog
    (Very interesting) (I am not sure if I understand you fully.)
    (What does that suggest to you?) (Please continue) (Go on)
    (Do you feel strongly about discussing such things?))))

(defun expand-pat-match-abbrev (pattern)
  "Expand out all pattern matching abbreviations in pattern."
  (cond ((and (symbolp pattern) (get pattern 'expand-pat-match-abbrev)))
        ((atom pattern) pattern)
        (t (mapcar #'expand-pat-match-abbrev pattern))))

(defun pat-match-abbrev (symbol expansion)
  "Define symbol as a macro standing for a pat-match pattern."
  (setf (get symbol 'expand-pat-match-abbrev)
        (expand-pat-match-abbrev expansion)))

(pat-match-abbrev '?x* '(:* ?x))
(pat-match-abbrev '?y* '(:* ?y))

(defun rule-pattern (rule) (expand-pat-match-abbrev (first rule)))
(defun rule-responses (rule) (rest rule))

(defun random-elt (seq)
  "Pick a random element out of a sequence."
  (elt seq (random (length seq))))

(defun use-eliza-rules (input)
  "Find some rule with which to transform the input."
  (some (lambda (rule)
          (let ((result (pat-match (rule-pattern rule) input)))
            (unless (eq result fail)
              (let* ((response (random-elt (rule-responses rule)))
                     (var (find-if #'variable? response))
                     (pats (sublis '((I . you) (you . I) (me . you) (am . are))
                                   result)))
                (unless (null var)
                  (let ((memory (lookup var pats)))
                    (unless (null memory)
                      (setf (cadar (last *eliza-rules*))
                            `(Tell me more about ,memory)))))
                (sublis pats response)))))
        *eliza-rules*))

(defun flatten (the-list)
  "Append together elements (or lists) in the list."
  (unless (null the-list)
    (let ((a (first the-list)))
      (if (and (listp a) (not (eq (first a) 'quote)))
          (append a (flatten (rest the-list)))
          (cons a (flatten (rest the-list)))))))

(defun split (string)
  "Split string into symbols that can be inserted anywhere in a sentence."
  (read-from-string
   (format nil "(~a)"
           (substitute-if #\space (lambda (c) (find c ".!?")) string))))

(defun eliza ()
  "Respond to user input using pattern matching rules."
  (loop
     (print 'eliza>)
     (let ((input (split (read-line))))
       (if (equal input '(bye))
           (return)
           (mapc (lambda (x) (if (and (listp x) (eq (first x) 'quote))
                                 (write x :pretty t)
                                 (format t " ~a" x)))
                 (flatten (use-eliza-rules input)))))))
