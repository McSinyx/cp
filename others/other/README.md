# Các bài tập khác

## Biểu diễn nhị phân

Cho số nguyên dương n, hãy chuyển đổi n về dạng nhị phân.

### Dữ liệu

Tệp `BIN.INP` gồm một dòng duy nhất ghi số n.

### Kết quả

Tệp `BIN.OUT` gồm một dòng ghi biểu diễn nhị phân của n.

### Ví dụ

| BIN.INP | BIN.OUT |
| :-----: | :-----: |
|   109   | 1101101 |

### Giới hạn

n ≤ 10<sup>18</sup>.

## Trò chơi với dãy số

Hai bạn học sinh trong lúc nhàn rỗi nghĩ ra trò chơi sau đây:

* Mỗi bạn chọn trước một dãy số gồm n số nguyên. Giả sử dãy số mà bạn thứ nhất
  chọn là (b<sub>1</sub>, b<sub>2</sub>, …, b<sub>n</sub>) còn dãy số bạn thứ
  hai chọn là (c<sub>1</sub>, c<sub>2</sub>, …, c<sub>n</sub>).
* Mỗi lượt chơi mỗi bạn đưa ra một số hạng trong dãy số của mình. Nếu bạn thứ
  nhất đưa ra số hạng b<sub>i</sub>, còn bạn thứ hai đưa ra số hạng
  c<sub>j</sub> thì giá của lượt chơi đó sẽ là |b<sub>i</sub> + c<sub>j</sub>|.

### Yêu cầu

Hãy xác định giá nhỏ nhất của một lượt chơi trong số các lượt chơi có thể.

### Dữ liệu

Tệp `GAME.INP` gồm ba dòng:

* Dòng đầu tiên chứa số nguyên dương n.
* Dòng thứ hai chứa dãy số nguyên b<sub>1</sub>, b<sub>2</sub>, …,
  b<sub>n</sub>.
* Dòng thứ ba chứa dãy số nguyên c<sub>1</sub>, c<sub>2</sub>, …,
  c<sub>n</sub>.

### Kết quả

Tệp `GAME.OUT` gồm một dòng ghi giá nhỏ nhất tìm được.

### Giới hạn

* n ≤ 10<sup>5</sup>.
* |b<sub>i</sub>|, |c<sub>j</sub>| < 2<sup>63</sup> ∀ 1 ≤ i, j ≤ n.

### Ví dụ

|     GAME.INP     | GAME.OUT |
| ---------------- | :------: |
| 2<br>1 -2<br>2 3 |     0    |

#### Giải thích

Dãy số bạn thứ nhất chọn là (1, −2) còn dãy số mà bạn thứ hai chọn là (2,3).

Khi đó các khả năng có thể của một lượt chơi là (1,2), (1,3), (−2,2), (−2,3).
Như vậy, giá nhỏ nhất của một lượt chơi trong số các lượt chơi có thể là 0
tương ứng với giá của lượt chơi (−2,2).

## Tìm đoạn thẳng v2

Trên 1 đoạn trục số [−c, c], cho N đoạn thẳng, đoạn thứ i là [a<sub>i</sub>,
b<sub>i</sub>].

### Yêu cầu

Cho một điểm M với toạ độ x. Hãy cho biết M thuộc bao nhiêu đoạn thẳng đã cho ở
trên, và cụ thể là những đoạn nào? Nếu M không thuộc đoạn nào trong các đoạn đã
cho, hãy chỉ ra 1 đoạn dài nhất chứa điểm M và không có điểm trong chung với
bất kì đoạn nào trong N đoạn đã cho (không có điểm chung ngoài hai điểm đầu
mút).

### Dữ liệu

Tệp `INTERVAL.INP`:

* Dòng thứ nhất ghi ba số nguyên N, c và x.
* N dòng tiếp theo, dòng thứ i + 1 ghi hai số nguyên a<sub>i</sub>,
  b<sub>i</sub>.

### Kết quả

Tệp `INTERVAL.OUT` gồm hai dòng:

* Dòng thứ nhất ghi số tự nhiên K là số đoạn chứa điểm M.
* Dòng thứ hai:
    * Nếu K dương, ghi K số là số thứ tự của K đoạn chứa M.
    * Nếu K = 0, ghi hai số nguyên là toạ độ hai đầu mút của đoạn thẳng dài
      nhất chứa M và không có điểm trong chung với N đoạn đã cho.

### Giới hạn

* 1 ≤ N ≤ 10<sup>5</sup>.
* |x| ≤ c ≤ 10<sup>9</sup>.
* |a<sub>i</sub>|, |b<sub>i</sub>| ≤ c ∀ 1 ≤ i ≤ N.

### Ví dụ

|             INTERVAL.INP            | INTERVAL.OUT |
| ----------------------------------- | ------------ |
| 4 20 2<br>1 3<br>2 4<br>7 10<br>0 1 |   2<br>1 2   |
| 3 10 5<br>1 2<br>-4 4<br>6 9        |   0<br>4 6   |

## Phân tích số

Cho hai số nguyên dương n và m.

Tìm số tự nhiên k lớn nhất sao cho n! chia hết cho m<sup>k</sup>.

### Dữ liệu

Tệp `FDP.INP` gồm một dòng ghi hai số nguyên dương n và m.

### Kết quả

Tệp `FDP.OUT` gồm một dòng duy nhất ghi số tự nhiên k.

### Giới hạn

* n ≤ 10<sup>18</sup>.
* 2 ≤ m ≤ 10<sup>12</sup>.

### Ví dụ

| FDP.INP | FDP.OUT |
| :-----: | :-----: |
|  10 10  |    2    |
| 100 15  |   24    |

## Từ điển

Cho một từ điển gồm n từ w. Với q truy vấn, mỗi truy vấn đưa ra một xâu s, đếm
xem có bao nhiêu từ có tiền tố là s.

### Dữ liệu

Tệp `DICT.INP` gồm n + q + 2 dòng:

* Dòng thứ nhất ghi một số nguyên n, số lượng từ của từ điển.
* Dòng 2 đến n + 1: Mỗi dòng gồm một xâu kí tự w là một từ thuộc từ điển.
* Dòng n + 2: Gồm một số nguyên là số q, số lượng truy vấn.
* Dòng n + 3 đến n + q + 2: Mỗi dòng gồm một xâu kí tự s mô tả một tiền tố cần
  đếm.

### Kết quả

Tệp `DICT.OUT` gồm q dòng, mỗi dòng gồm một số nguyên là câu trả lời cho truy
vấn tương ứng.

## Giới hạn

* 1 ≤ n, q ≤ 20000.
* 1 ≤ Độ dài w, s ≤ 20.
* Các xâu w, s gồm các chữ cái in thường (từ `a` đến `z`).

### Ví dụ

`DICT.INP`:

    4
    banana
    ban
    baconsoi
    alibaba
    4
    ban
    ba
    ali
    baba

`DICT.OUT`:

    2
    3
    1
    0

#### Giải thích:

* 2 từ có tiền tố `ban` là: `banana`, `ban`.
* 3 từ có tiền tố `ba` là: `banana`, `ban`, `baconsoi`.
* 2 từ có tiền tố `ali` là: `alibaba`.
