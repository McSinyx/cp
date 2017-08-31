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

Cho một dãy số nguyên a<sub>1</sub>, a<sub>2</sub>, …, a<sub>n</sub>.

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

## Thả diều

Trong một cuộc thi thả diều, ban giám khảo căn cứ vào độ cao của mỗi chiếc
diều đạt được khi thả lên trời và xếp hạng cho chiếc diều đó theo một cách đặc
biệt: Những chiếc diều không được thả cùng một lúc, mà theo trình tự từng
chiếc một. Khi một chiếc diều được thả lên trời, ban giám khảo sẽ căn cứ vào
độ cao của chiếc diều và xếp hạng cho chiếc diều đó bằng cách so độ cao của nó
với độ cao của những chiếc diều đã thả trước đó: hạng của một chiếc diều bằng
số diễu đã thả cao hơn nó cộng thêm 1.

### Yêu cầu

Có *n* chiếc diều lần lượt được thả lên trời, em hãy cho biết dãy số biểu diễn
giá trị xếp hạng của *n* chiếc diều đó.

### Dữ liệu

* Dòng đầu là số nguyên *n* ≤ 100000 cho biết số chiếc diều tham gia dự thi.
* *n* dòng tiếp theo, mỗi dòng ghi một số nguyên dương ≤ 10<sup>9</sup> mô tả
  độ cao của một chiếc diều, theo thứ tự mà nó được thả lên.

### Kết quả

Gồm *n* dòng: dòng thứ *i* ghi số nguyên biểu diễn giá trị xếp hạng của chiếc
diều thứ *i* tại thời điểm nó được thả lên.

### Ví dụ

|               KITE.INP                |          KITE.OUT          |
| :-----------------------------------: | :------------------------: |
| 6<br>78<br>24<br>68<br>40<br>39<br>89 | 1<br>2<br>2<br>3<br>4<br>1 |

#### Giải thích

* Chiếc đầu tiên xếp hạng 1 vì trước nó chưa có chiếc diều nào được thả.
* Chiếc thứ hai xếp hạng 2 vì 24 < 78.
* Chiếc thứ ba cũng xếp hạng 2 vì 24 < 68 < 78.
* Chiếc thứ tư xếp hạng 3 vì 24 < 40 < 68 < 78.
* Chiếc thứ năm xếp hạng 4 vì 24 < 39 < 40 < 68 < 78.
* Chiếc cuối cùng xếp hạng 1 vì 24 < 39 < 40 < 68 < 78 < 89.

## Khối lập phương

Cho 3 khối hình hộp chữ nhật có kích thước lần lượt là: (a<sub>1</sub>,
b<sub>1</sub>, c<sub>1</sub>), (a<sub>2</sub>, b<sub>2</sub>, c<sub>2</sub>),
(a<sub>3</sub>, b<sub>3</sub>, c<sub>3</sub>). Hãy xác định xem có thể xếp 3
khối hình hộp chữ nhật này thành một khối lập phương hay không.

### Dữ liệu vào

* Dòng đầu tiên ghi số test T.
* Tiếp theo là T test. Mỗi test được ghi trên 3 dòng, dòng i ghi 3 số nguyên
  dương a<sub>i</sub>, b<sub>i</sub>, c<sub>i</sub>.

### Kết quả

Ứng với mỗi test, ghi ra `TRUE` hoặc `FALSE` tương ứng với có thể hoặc không
thể xếp thành khối lập phương.

### Giới hạn

Các số trong input không vượt quá 100.

### Ví dụ:

|                          Input                          |    Output     |
| :-----------------------------------------------------: | :-----------: |
| 2<br>3 3 1<br>3 3 1<br>3 3 1<br>3 3 1<br>3 3 1<br>3 2 2 | TRUE<br>FALSE |

## Đếm gà và chó

Hiện nay dịch cúm gia cầm đang lây lan nhưng ý thức những người buôn gia cầm
rất yếu kém. Để qua mắt các trạm kiểm dịch, họ chở gà lẫn với chó. Một trạm
kiểm dịch bắt được một xe chở gà và chó. Họ đếm được tất cả C chân gà và chó.

### Yêu cầu

Hãy cho biết số lượng từng con vật.

### Dữ liệu

* Gồm một dòng ghi số nguyên dương C là một số chẵn, C ≤ 100000.

### Kết quả

* Dòng thứ nhất ghi số S là số lời giải.
* trong S dòng tiếp theo, mỗi dòng ghi một lời giải gồm hai số P, Q có nghĩa là
  có P gà và Q chó.

### Ví dụ

| Input |         Output         |
| :---: | ---------------------- |
|   10  | 3<br>5 0<br>3 1<br>1 2 |

## Tích các chữ số

Gọi P(a) là hàm tính tích các chữ số của a. Cho một số nguyên không âm N, hãy
tìm số nguyên dương a nhỏ nhất sao cho P(a) = N.

### Dữ liệu

* Dòng đầu tiên gồm một số nguyên T, số lượng test.
* T dòng tiếp theo, mỗi dòng gồm một số nguyên N.

### Kết quả

In ra T dòng, mỗi dòng gồm một số nguyên là kết quả của mỗi test.

### Giới hạn

* 1 ≤ T ≤ 1000.
* 0 ≤ P ≤ 10<sup>15</sup>.

### Ví dụ

| Sample Input | Sample Output |
| ------------ | ------------- |
| 2<br>1<br>10 |    1<br>25    |

## Dọn dẹp bộ nhớ

Bộ nhớ của máy tính có dung lượng V byte được đánh số từ 0 đến V-1. Các khối bộ
nhớ đã được phân phối được xác định bởi dãy các địa chỉ (a<sub>1 ,
b<sub>1</sub>), (a<sub>2</sub>, b<sub>2</sub>), …, (a<sub>N</sub>,
b<sub>N</sub>).  Các khối này được sắp xếp theo địa chỉ và không giao nhau,
nghĩa là 0 ≤ a<sub>j</sub> ≤ b<sub>j</sub> < a<sub>j+1</sub> < V. Hệ điều hành
cần cung cấp một khối gồm M byte cho một yêu cầu mới xuất hiện. Nếu như không
gian nhớ tự do với dung lượng như vậy không còn, thì hệ điều hành cần dịch
chuyển một khối nào đó để giải phóng được một đoạn nhớ liên tục có độ dài đòi
hỏi.

### Yêu cầu

Tìm cách chọn khối bộ nhớ với dung lượng nhỏ nhất cần dịch chuyển để đáp ứng
yêu cầu đặt ra. Trong trường hợp có nhiều cách lựa chọn, hãy đưa ra khối với
địa chỉ đầu nhỏ nhất.

### Dữ liệu

* Dòng đầu là các số nguyên V N M.
* Dòng tiếp theo là 2N cặp số nguyên (a<sub>1 , b<sub>1</sub>), (a<sub>2</sub>,
  b<sub>2</sub>), …, (a<sub>N</sub>, b<sub>N</sub>).

### Kết quả

Một dòng chứa một số nguyên là:

* -1, nếu không có cách di chuyển (không thể giải phóng không gian nhớ yêu
  cầu), hoặc
* 0 nếu không cần di chuyển, hoặc
* chỉ số của khối cần di chuyển.

### Giới hạn

* 0 ≤ N ≤ 100000.
* 1 ≤ V ≤ 2<sup>30</sup>.

### Ví dụ

|    DEFRAC.INP     | DEFRAC.OUT |
| ----------------- | :--------: |
| 10 2 4<br>1 5 7 7 |      2     |

## Phân tích chương trình

Trong việc phân tích chương trình, cần phát hiện xem đoạn mã nguồn của chương
trình có chứa các câu lệnh mà không khi nào được thực hiện hay không (những
lệnh như vậy để ngắn gọn ta gọi là lệnh thừa). Sự có mặt của các câu lệnh thừa
thường mách bảo là chương trình còn lỗi. Do đó trong chương trình dịch của tất
cả các ngôn ngữ lập trình luôn có môđun kiểm tra sự có mặt của các câu lệnh
thừa.

### Yêu cầu

Bạn cần viết chương trình thực hiện công việc của môđun này.

### Dữ liệu

Gồm không quá 10000 dòng chứa dãy lệnh là kết quả của việc phân tích ngữ nghĩa
của một đoạn mã nguồn. Mỗi dòng chứa một câu lệnh có một trong ba dạng sau:

* `NEXT`: thực hiện câu lệnh kế tiếp nó;
* `JUMP n` với n là số nguyên dương: thực hiện câu lệnh với chỉ số n (các câu
  lệnh trong dãy lệnh được đánh số bắt đầu từ 1);
* `JUMP n OR m` với n và m là các số nguyên dương: thực hiện một trong hai câu
  lệnh với chỉ số n hoặc m.

### Kết quả

* Dòng đầu tiên ghi số nguyên k là số lượng câu lệnh thừa trong dãy lệnh đã cho.
* Nếu k > 0 thì mỗi dòng trong số k dòng tiếp theo chứa chỉ số của một câu lệnh
  thừa. Các chỉ số được đưa ra theo thứ tự tăng dần.

### Ví dụ

|                                LANG.INP                                 |  LANG.OUT   |
| ----------------------------------------------------------------------- | :---------: |
| NEXT<br>JUMP 4 or 6<br>NEXT<br>JUMP 3<br>NEXT<br>JUMP 8<br>NEXT<br>NEXT | 2<br>5<br>7 |

## Tìm số

Cho hai số tự nhiên *n* và *p*. Tìm số *m* lớn nhất để *p<sup>m</sup>* là ước
số của *n*!.

### Dữ liệu

Gồm hai số *n* và *p*.

### Kết quả

Số *m* tìm được.

### Giới hạn

*n*, *p* ≤ 30000, đảm bảo *m* > 0.

### Ví dụ

| MAXNUM.INP | MAXNUM.OUT |
| :--------: | :--------: |
|    7 3     |     2      |

## Chữ số

Cho xâu M lập thành từ tập H = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F}
và không bắt đầu bằng ký tự 0; xâu S giá trị ban đầu là xâu M.

Người ta thực hiện L lần biến đổi theo các bước sau:

* Đếm số lần xuất hiện các ký tự i thuộc tập H, đặt là K<sub>i</sub>.
* Nếu K<sub>i</sub> > 0 người ta viết liên tiếp xâu biểu diễn K<sub>i</sub>
  trong cơ số 16 và ký tự i, thu được giá trị mới của M.
* Viết tiếp M vào cuối xâu S.

### Yêu cầu

Cho xâu M, số lần biến đổi L và X là một ký tự từ tập H. Hãy đếm số lần xuất
hiện X trong S thu được sau L lần biến đổi.

### Dữ liệu

* Dòng thứ nhất chứa xâu M;
* Dòng thứ hai chứa số tự nhiên L;
* Dòng thứ ba chứa kí tự X.

### Kết quả

Một số nguyên là số lần xuất hiện của X trong S sau L lần biến đổi.

### Giới hạn

* M có độ dài không vượt quá 127 kí tự;
* L ≤ 10<sup>7</sup>.

### Ví dụ

|   DIGIT.INP    | DIGIT.OUT |
| -------------- | :-------: |
| 150A<br>3<br>2 |     1     |

#### Giải thích

| Lần biến đổi |    M     |              S               |
| :----------: | -------- | ---------------------------- |
|       0      | 150A     | 150A                         |
|       1      | 1011151A | 150A1011151A                 |
|       2      | 1051151A | 150A1011151A1051151A         |
|       3      | 1041251A | 150A1011151A1051151A1041251A |

## Nguyên tố tương đương

Hai số tự nhiên được gọi là *Nguyên tố tương đương* nếu chúng có chung các ước
số nguyên tố. Ví dụ các số 75 và 15 là nguyên tố tương đương vì cùng có các
ước nguyên tố là 3 và 5.

### Yêu cầu

Xét các số từ *a* đến *b*, hãy đếm xem có bao nhiêu cặp số (*x*, *y*) mà *x* <
*y* và *x*, *y* là nguyên tố tương đương.

### Dữ liệu

* Dòng đầu chứa số nguyên *T* là số bộ dữ liệu;
* *T* dòng sau, mỗi dòng chứa hai số nguyên dương *a*, *b*.

### Kết quả

Gồm *T* dòng, mỗi dòng là số cặp số nguyên tố tương đương tương ứng với bộ dữ
liệu.

### Giới hạn

* *T* ≤ 10;
* *a* ≤ *b* ≤ 10<sub>6</sub>.

### Ví dụ

|      EP.INP      | EP.OUT |
| ---------------- | :----: |
| 2<br>1 5<br>1 10 | 1<br>4 |

## Số dư

Cho *n* số nguyên dương *a<sub>1</sub>*, *a<sub>2</sub>*, …, *a<sub>n</sub>*,
trong đó tồn tại ít nhất một cặp sô khác nhau. Hãy tìm số nguyên dương *d* lớn
nhất để *a<sub>1</sub>* mod *d* = *a<sub>2</sub>* mod *d* = … = *a<sub>n</sub>*.

### Dữ liệu

* Dòng đầu chứa số nguyên dương *n*;
* Dòng thứ hai chứa *n* số nguyên dương *a<sub>1</sub>*, *a<sub>2</sub>*, …,
  *a<sub>n</sub>*;

### Kết quả

Gồm một dòng chứa số nguyên dương *d* lớn nhất thỏa mãn điều kiện đề bài.

### Giới hạn

* *n* ≤ 100;
* *a<sub>i</sub>* ≤ 10<sup>16</sup>.

### Ví dụ

| remain.inp | remain.out |
| ---------- | :--------: |
| 3<br>3 7 9 |      2     |

## LCM

Trong số học, bội số chung nhỏ nhất (tiếng Anh: *Least Common Multiple* hoặc
*Lowest Common Multiple* (LCM)) của hai số nguyên *x* và *y* là số nguyên dương
nhỏ nhất chia hết cho cả x và y.

### Yêu cầu

Cho hai số nguyên dương *a* và *b* (*a* ≤ *b*), hãy đếm số cặp số nguyên dương
*x*, *y* sao cho LCM(*x*, *y*) = *a* × (*a*+1) × … × *b*.

### Dữ liệu

* Dòng đầu chứa số nguyên *T* là số bộ dữ liệu;
* *T* dòng sau, mỗi dòng chứa hai số nguyên dương *a*, *b*.

### Kết quả

Gồm *T* dòng, mỗi dòng tương ứng với *a*, *b* của bộ dữ liệu vào là số cặp số
nguyên dương thoả mãn yêu cầu đề bài. Vì kết quả có thể rất lớn, hãy đưa ra giá
trị là phần dư khi chia cho 111539786.

### Giới hạn

* *T* ≤ 10;
* *a* ≤ *b* ≤ 10<sup>6</sup>.

### Ví dụ

|     LCM.INP     | LCM.OUT |
| --------------- | :-----: |
| 2<br>2 3<br>5 5 | 9<br>3  |

## Khảo sát hang động ngầm

Một nhóm chuyên gia có nhiệm vụ khảo sát một hang động ngầm mới được phát hiện.
Nhiệm vụ của họ là vẽ sơ đồ hang, tìm hiểu về cấu trúc địa tầng, các hình thái
của sự sống ở sâu trong lòng hang… Để đánh dấu đường đi, người ta dùng công cụ
duy nhất là la bàn. Khi khởi hành và sau mỗi đơn vị khoảng cách, người phụ
trách nhật ký của đoàn ghi lại hướng đi bằng một trong các chữ cái E, W, S, N
tương ứng với việc đi theo các hướng Đông, Tây, Nam, Bắc (trong 1 đơn vị khoảng
cách hướng đi không thay đổi). Một đoạn đường có thể đi lại khảo sát nhiều lần.
Thông tin về đường đi được đưa vào máy tính sách tay để vẽ sơ đồ của hang đồng
thời được dùng để tìm đường ra ngắn nhất theo lộ trình đã ghi nhận.

### Yêu cầu

Tìm độ dài đường ra ngắn nhất cho đoàn ra khỏi hang dựa theo đường ghi trong
nhật ký.

### Dữ liệu

Gồm một số dòng các ký tự E, W, S, N, ghi liên tiếp nhau. Số ký tự không quá
5000.

### Kết quả

Độ dài đường đi ngắn nhất tìm được.

### Ví dụ

|   KHAOSAT.INP    | KHAOSAT.OUT |                Giải thích                 |
| ---------------- | :---------: | ----------------------------------------- |
| EEENNWSEENWSSSWW |      6      | Đường đi ra theo chỉ dẫn của xâu `EENWWW` |

## Chọn số

Cho mảng A có kích thước NxN gồm các số nguyên không âm. Hãy chọn ra k số sao
cho chọn một dòng có nhiều nhất 1 số được chọn, mỗi cột có nhiều nhất 1 số được
chọn để tổng K số là lớn nhất.

### Dữ liệu

* Dòng đầu gồm 2 số N và K (K ≤ N ≤ 10);
* N dòng tiếp theo là mảng A.

### Kết quả

Tổng lớn nhất chọn được và số cách chọn.

### Ví dụ

|          CHONSO1.INP           | CHONSO1.OUT |
| ------------------------------ | :---------: |
| 3 2<br>1 2 3<br>2 3 1<br>3 1 2 |     6 3     |

## Tính nước đọng

Nền phẳng của 1 công trình xây dựng được chia thành lưới ô vuông đơn vị kích
thước  MxN ô (*M*, *N* ≤ 100). Trên mỗi ô (*i*, *j*) của lưới, người ta dựng 1
cột bê tông hình hộp có đáy là ô (*i*, *j*) và chiều cao là *h*[*i*, *j*] đơn
vị (1 ≤ *H*[*i*,*j*] ≤ 1000). Sau khi dựng xong thì trời đổ mưa to và đủ lâu.
Nhà thầu xây dựng muốn tính lượng nước đọng lại giữa các cột để có kế hoạch thi
công tiếp theo. Giả thiết, nước ko thẩm thấu qua các cột bê tông cũng như không
rò rỉ qua các đường ghép giữa chúng.

### Yêu cầu

Bạn hãy giúp nhà thầu tính toán lượng nước đọng lại giữa các cột.

### Dữ liệu

* Dòng đầu tiên ghi 2 số nguyên dương *M* và *N*;
* Dòng thứ *i* trong *M* dòng tiếp theo, ghi *N* số nguyên dương *h*[*i*, 1],
  *h*[*i*, 2]…, *h*[*i*, *N*].

### Kết quả

Một dòng duy nhất chứa số đơn vị khối nước đọng lại.

### Ví dụ

|                               NUOC.INP                               | NUOC.OUT |
| -------------------------------------------------------------------- | :------: |
| 5 5<br>9 9 9 9 9<br>9 2 2 2 9<br>9 2 5 2 9<br>9 2 2 2 9<br>9 9 9 9 9 |    60    |

## Vượt đại dương

Bản đồ của một vùng biển được cho bởi một lưới các ô vuông đơn vị gồm N dòng, N
cột (N ≤ 100), trong đó vùng biển được đánh số 0 và các vùng khác được đánh số
1\. Giả sử rằng bên ngoài biên của lưới là đại dương mênh mông. Một hòn đảo là
một tập các ô vuông có giá trị 1 và có chung cạnh với nhau, số các ô vuông này
chính là diện tích của hòn đảo.

Một ngư dân sống trên một hòn đảo sẽ vượt biển tìm đến một hòn đảo mới rộng lớn
hơn để sinh sống. Từ một ô vuông trên bản đồ, anh ta chỉ được đến một ô khác
chung cạnh với ô vuông mà anh ta đang đứng (cả trên cạn lẫn dưới biển). Khi
vượt đại dương anh ta không muốn dừng chân trên một hòn đảo nào khác ngoài hòn
đảo mà anh ta muốn đến.

### Yêu cầu

Cho trước bản đồ của vùng biển và vị trí của anh ngư dân, hãy cho biết có một
hòn đảo nào khác có diện tích lớn hơn diện tích hòn đảo mà anh ngư dân đang
sinh sống. Nếu có hãy chỉ giúp anh ngư dân một hành trình vượt biển đến một hòn
đảo lớn hơn sao cho đoạn đường vượt biển là ngắn nhất. Nếu với cùng độ dài đoạn
đường đó mà có thể đến được các đảo khác nhau thì ưu tiên đến đảo có diện tích
lớn nhất.

### Dữ liệu

* Dòng đầu ghi số N cho biết kích thước bản đồ, hai số x, y là vị trí dòng và
  cột trên bản đồ nơi mà anh ngư dân đang sinh sống.
* N dòng tiếp theo, mỗi dòng ghi N số cho biết nội dung bản đồ các số trên cùng
  một dòng cách nhau ít nhất một khoảng trắng.

### Kết quả

* Nếu không tìm được một hòn đảo thích hợp thì ghi số 0.
* Nếu tìm được thì ghi độ dài của hành trình.

### Ví dụ

|                                VDD.INP                                 | VDD.OUT |
| ---------------------------------------------------------------------- | :-----: |
| 5 1 5<br>0 0 0 1 1<br>0 0 0 0 1<br>1 1 0 0 1<br>1 1 0 0 0<br>0 1 0 0 0 |    2    |
