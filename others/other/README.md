# Các bài tập khác

## Biểu diễn nhị phân

Cho số nguyên dương n, hãy chuyển đổi n về dạng nhị phân.

### Dữ liệu

Tệp `BIN.INP` gồm một dòng duy nhất ghi số n.

### Kết quả

Tệp `BIN.OUT` gồm một dòng ghi biểu diễn nhị phân của n.

### Giới hạn

n ≤ 10<sup>18</sup>.

### Ví dụ

| BIN.INP | BIN.OUT |
| :-----: | :-----: |
|   109   | 1101101 |

## DiffSum

Lập chương trình phân tích số nguyên dương n thành tổng của các số nguyên dương
khác nhau sao cho tích của các số hạng này là lớn nhất có thể.

### Dữ liệu

Tệp `DIFFSUM.INP` gồm một dòng duy nhất ghi số n.

### Kết quả

Tệp `DIFFSUM.OUT` ghi các số hạng của cách phân tích tìm được theo thứ tự tăng
dần trên một dòng.

### Giới hạn

n ≤ 10<sup>5</sup>.

### Ví dụ

| DIFFSUM.INP | DIFFSUM.OUT |
| :---------: | :---------: |
|      5      |     2 3     |
|     10      |    2 3 5    |

## Tìm dãy số nguyên liên tiếp

Cho dãy gồm n số tự nhiên đôi một khác nhau a<sub>1</sub>, a<sub>2</sub>, …,
a<sub>n</sub>. Nếu trong dãy đã cho có chứa số 0, bạn được phép thay số 0 bằng
một số nguyên dương bất kì khác.

### Yêu cầu

Hãy chọn trong dãy gồm nhiều nhất các số sao cho các số đã chọn tạo thành một
dãy số tự nhiên liên tiếp.

### Dữ liệu

Tệp `LSEQ.INP`:

* Dòng thứ nhất chứa số nguyên dương n.
* Dòng thứ hai dãy số tự nhiên a<sub>1</sub>, a<sub>2</sub>, …, a<sub>n</sub>.

### Kết quả

Tệp `LSEQ.OUT` gồm một dòng duy nhất ghi độ dài lớn nhất của dãy số tự nhiên
liên tiếp chọn được.

### Giới hạn

* n ≤ 10<sup>6</sup>.
* a<sub>i</sub> ≤ 10<sup>6</sup> ∀ 1 ≤ i ≤ n.

### Ví dụ

|      LSEQ.INP      | LSEQ.OUT |              Giải thích              |
| ------------------ | :------: | ------------------------------------ |
| 5<br>2 9 3 7 4     |     3    | Chọn dãy 2, 3, 4                     |
| 7<br>1 2 4 7 6 0 8 |     5    | Thay 0 bởi 5, chọn dãy 4, 5, 6, 7, 8 |

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

## Vòng xoắn số nguyên

Cho số nguyên dương n. Viết các số từ 1 đến n theo hình xoắn trôn ốc chữ nhật
nằm ngang vuông nhất có thể.

### Dữ liệu

Tệp `SPIRAL.INP` gồm một dòng duy nhất ghi số nguyên dương n.

### Kết quả

Tệp `SPIRAL.OUT` ghi vòng xoắn trôn ốc.

### Giới hạn

n ≤ 10<sup>6</sup>.

### Ví dụ

| SPIRAL.INP |            SPIRAL.OUT            |
| ---------- | -------------------------------- |
|     12     | 1 2 3 4<br>10 11 12 5<br>9 8 7 6 |

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

### Giới hạn

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

## Hình chữ nhật

Cho tọa độ 3 điểm trên mặt phẳng, tìm 1 điểm còn lại để 4 điểm tạo thành 1 hình
chữ nhật.

### Dữ liệu

Gồm 3 dòng, mỗi dòng gồm 2 số nguyên x, y (-100 ≤ x, y ≤ 100) là là toạ độ của
1 điểm.

### Kết quả

2 số nguyên là toạ độ hai điểm còn lại của hình chữ nhật.

### Ví dụ

|      hcn.inp      | hcn.out |
| :---------------: | :-----: |
| 2 1<br>2 4<br>3 1 |   3 4   |
| 2 5<br>5 1<br>1 3 |   6 3   |

## Lấy bi

Cho 3 lọ đựng bi, mỗi lọ đựng 1 số viên bi. Có quy tắc lấy bi là: lấy ở 2 lọ
bất kì, mỗi lọ 1 viên bi, và cho vào lọ còn lại. Hỏi cách lấy bi nào sao cho
tất cả bi đều ở trong 1 lọ, 2 lọ còn lại không có viên bi nào.

### Dữ liệu

1 dòng duy nhất gồm 3 số a, b, c (0 ≤ a, b, c ≤ 10<sup>9</sup>).

### Kết quả

`YES` nếu có cách chuyển bi để tất cả bi đều ở trong 1 lọ, nếu không `NO`.

### Ví dụ

| laybi.inp | laybi.out |
| :-------: | :-------: |
|   2 3 3   |    YES    |
|   2 4 6   |    NO     |

## Biến đổi số

Cho 2 số nguyên x, y và 2 phép biến đổi là phép tăng lên a đơn vị b đơn vị. Hỏi
có thể biến đổi x thành y được không?

### Dữ liệu

1 dòng duy nhất gồm 4 số x, y, a, b (0 ≤ x < y ≤ 2x10<sup>9</sup>; 0 ≤ a, b ≤
10<sup>9</sup>).

### Kết quả

1 số duy nhất là số phép biến đổi ít nhất để x thành y. Nếu không biến đổi
được thì in ra `-1`.

| biendoiso.inp | biendoiso.inp |
| :-----------: | :-----------: |
|   3 20 2 3    |       6       |
|   5 30 6 4    |      -1       |

## Số cách đi của thỏ

Một con thỏ cần băng qua một đoạn đường dài n mét, thỏ có ba cách nhảy với các
độ dài bước nhảy là 3 mét, 2 mét, 1 mét. Một cách đi đúng của thỏ là dãy các
bước nhảy của nó có tổng độ dài bằng n và bước nhảy liền sau không dài hơn bước
nhảy liền trước trong dãy bước nhảy của nó.

### Yêu cầu

Cho biết số nguyên dương n, hãy tính số cách đi đúng khác nhau của thỏ để đi
hết đoạn đường n mét. Số cách đi có thể rất lớn nên kết quả in ra được viết
dưới dạng số dư của phép chia kết quả cho 1000000.

### Dữ liệu

Gồm một dòng chứa số nguyên n.

### Kết quả

In ra số nguyên duy nhất là số cách đi đúng của thỏ viết dưới dạng số dư của
kết quả chia cho 1000000.

### Hạn chế

* 40% test đầu tiên có n ≤ 1000.
* 30% test tiếp theo có 1000 < n ≤ 10<sup>9</sup>.
* 30% test cuối cùng có 10<sup>9</sup> < n ≤ 10<sup>15</sup>.

### Ví dụ

| bunny.inp | bunny.out |
| :-------: | :-------: |
|     6     |     7     |

#### Giải thích

Với n = 6, thỏ có 7 cách đi như sau: 3+3, 3+2+1, 3+1+1+1, 2+2+2, 2+2+1+1,
2+1+1+1+1, 1+1+1+1+1+1.

## Biểu thức nhân, cộng

Cho n số nguyên dương a<sub>i</sub>, i=1..n. Bạn phải đặt giữa n số này 2 phép
nhân và n - 3 phép cộng sao cho kết quả biểu thức là lớn nhất.

Chú ý: Không được thay đổi thứ tự xuất hiện các số nguyên dương của trong biểu
thức thu được.

### Dữ liệu

* Dòng 1 chứa số nguyên dương n (4 ≤ n ≤ 1000).
* n dòng tiếp theo, dòng thứ i + 1 chứa số nguyên dương a<sub>i</sub> ≤ 10000.

### Kết quả

Số nguyên dương lớn nhất là giá trị biểu thức thu được.

### Ví dụ

|  express.inp   | express.out |    Giải thích     |
| -------------- | :---------: | ----------------- |
| 5<br>4 7 1 5 3 |     44      | 4 * 7 + 1 + 5 * 3 |

## Ước số

Cho đoạn [a; b] \(a, b là số nguyên dương), tính các giá trị:

* min: Số nhỏ nhất và có nhiều ước số nhất trong đoạn này.
* cmin: Số lượng ước của min.
* count: Số lượng số trong đoạn có số ước là cmin.

### Dữ liệu

Hai số nguyên dương a và b (a ≤ b ≤ 10<sup>9</sup>; b - a ≤ 10000).

### Kết quả

Ba số nguyên dương theo thứ tự min, cmin, count

### Ví dụ

| uocso.inp | uocso.out |
| --------- | --------- |
|  2 10     | 6 4 3     |
|  200 200  | 200 12 1  |

## Qua cầu

Cho một chiếc cầu ngang có chiều dài n+1 được tạo bởi các ô vuông kích thước
1×1 được đánh số từ 0 đến n, bạn đứng tại vị trí 0 lúc bắt đầu, và một chiếc
giầy đăc biệt có thể nhảy xa tối đa m ô, tối thiểu 1 ô.

### Yêu cầu

Bạn hãy chỉ ra có bao nhiêu cách có thể đi đến vị trí thứ n của cây cầu này với
đôi giầy đặc biệt kia. Được biết trên cây cầu có k vị tri bị hỏng và bạn không
thể bước vào đó.

### Dữ liệu

* Dòng đầu tiên chứa 3 số n, m, k.
* Dòng 2 chứa k số là vị trí các ô bị hỏng.

### Kết quả

1 dòng chứa số cách đi qua cầu mod 1000000007.

### Giới hạn

* Subtask1: 0 ≤ n, m ≤ 1000 (80% số điểm).
* Subtask2: 0 ≤ n, m ≤ 10<sup>6</sup> (20% số điểm).

### Ví dụ

|  quacau.inp  | quacau.out |
| ------------ | :--------: |
| 8 3 2<br>3 4 |      8     |

## Đếm dãy chia hết

Cho một dãy số nguyên dương, đếm số lượng dãy con liên tiếp có tổng chia hết
cho *d*. Hai dãy con được gọi là khác nhau nếu ít nhất một trong hai điểm đầu
hoặc điểm cuối hai dãy con đó trong dãy đã cho là khác nhau. Ví dụ

* Với *d* = 4, dãy (2, 1, 2, 1, 4, 1) có 4 dãy con thoả mãn là (1, 2, 1), (1,
  2, 1, 4), (4) và (2, 1, 4, 1).
* Với *d* = 2, dãy (1, 1, 1, 1) có 4 dãy con thỏa mãn.

### Dữ liệu

* Dòng đầu tiên là số *T* - số lượng test.
* T nhóm dòng tiếp theo, mỗi dòng tương ứng một yêu cầu:
    * Dòng đầu là 2 số nguyên dương *d* và *N*.
    * Dòng thứ 2 chứa *N* số nguyên biểu diễn dãy số.

### Kết quả

*T* dòng là kết quả các test tương ứng theo thứ tự.

### Ví dụ

|       DIVSEQ.INP        | DIVSEQ.OUT |
| ----------------------- | :--------: |
| 1<br>4 6<br>2 1 2 1 4 1 |     4      |

### Giới hạn

* *T* ≤ 100.
* *d* ≤ 1000000, *N* ≤ 50000, 50% số test có *N* ≤ 1000.

## Hình vuông

Cho 4 điểm trên hệ trục tọa độ chuẩn Oxy. Hãy kiểm tra xem bốn điểm này có phải
là bốn đỉnh của một hình vuông có các cạnh song song với các trục toạ độ hay
không?

### Dữ liệu

Gồm 4 dòng, mỗi dòng ghi 2 số nguyên là tọa độ của một điểm. Mỗi số nguyên có
giá trị tuyệt đối không quá 10<sup>9</sup>.

### Kết quả

Diện tích hình vuông nếu bốn điểm thoả mãn yêu cầu đề bài, ngược lại ghi `-1`.

### Ví dụ

|        HINHVUONG.INP         | HINHVUONG.OUT |
| :--------------------------: | :-----------: |
| -3 -1<br>-3 3<br>1 3<br>1 -1 |      16       |

## Chọn số

Cho một dãy số nguyên a<sub>1</sub>, a<sub>2</sub>, ..., a<sub>n</sub>.

### Yêu cầu: 

Đếm số cách chọn ra dãy số khác nhau gồm m phần tử. Hai dãy số được gọi là khác
nhau nếu tồn tại ít nhất một vị trí mà ở đó giá trị 2 phần tử của 2 dãy là khác
nhau.

### Dữ liệu

* Dòng đầu ghi 2 số n, m.
* Dòng tiếp theo ghi các số nguyên a<sub>i</sub> (các số cách nhau ít nhất một
  dấu cách).

### Kết quả

Ghi ra số lượng cách chọn dãy. Vì kết quả có thể rất lớn nên chỉ cần ghi phần
dư của kết quả khi chia (10<sup>12</sup> + 7).

### Giới hạn

* 3 ≤ n ≤ 1000.
* 1 ≤ m < n.
* a<sub>i</sub> ≤ 10<sup>9</sup> ∀ 1 ≤ i ≤ n.

### Ví dụ

|  chonso.inp  | chonso.out |
| ------------ | :--------: |
| 3 2<br>1 3 1 |      3     |
