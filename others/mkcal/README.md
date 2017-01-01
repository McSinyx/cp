# Bài tập lập lịch

## Chương trình máy tính

Giả sử trong một phiên làm việc từ thời điểm 0 đến 8640000, một trung tâm tính
toán cần thực hiện n chương trình, chương trình i được thực hiện trong đoạn
thời gian [a<sub>i</sub>, b<sub>i</sub>].

### Yêu cầu

* Cho đoạn thời gian [p<sub>0</sub>, q<sub>0</sub>], kiểm tra xem mọi thời điểm
  của đoạn luôn có chương trình chạy hay không.
* Cho đoạn thời gian [r<sub>0</sub>, s<sub>0</sub>], kiểm tra xem mọi thời điểm
  của đoạn luôn không có chương trình chạy hay không.
* Tìm đoạn thời gian [p, q] dài nhất luôn có chương trình chạy.
* Tìm đoạn thời gian [r, s] dài nhất không có chương trình chạy.

### Dữ liệu vào

* Dòng đầu ghi số nguyên dương n.
* n dòng tiếp theo, với i từ 1 đến n, dòng thứ i + 1 ghi hai số tự nhiên
  a<sub>i</sub> và b<sub>i</sub>.
* Dòng thứ n + 2 ghi hai số tự nhiên p<sub>0</sub>, q<sub>0</sub>.
* Dòng thứ n + 3 ghi hai số tự nhiên r<sub>0</sub>, s<sub>0</sub>.

### Dữ liệu ra

* Dòng đầu ghi 1 nếu đoạn thời gian [p<sub>0</sub>, q<sub>0</sub>] luôn có
  chương trình chạy, ghi 0 nếu không phải.
* Dòng thứ hai ghi 1 nếu đoạn thời gian [r<sub>0</sub>, s<sub>0</sub>] không có
  chương trình nào chạy, ghi 0 nếu có.
* Dòng thứ ba ghi hai số p và q.
* Dòng thứ tư ghi hai số r và s.

### Giới hạn

* n ≤ 200
* 0 ≤ a<sub>i</sub> ≤ b<sub>i</sub> < 8640000
* 0 ≤ p<sub>0</sub> ≤ q<sub>0</sub> < 8640000
* 0 ≤ r<sub>0</sub> ≤ s<sub>0</sub> < 8640000

### Ví dụ

|     CTMT.OUT    |     CTMT.INP    |
| --------------- | --------------- |
| 5               | 1               |
| 1000 10000      | 0               |
| 2000 30000      | 8000000 8500000 |
| 20000 100000    | 500001 7999999  |
| 200000 500000   |                 |
| 8000000 8500000 |                 |
| 1000 100000     |                 |
| 0 1000          |                 |

## Xếp việc

Cho n công việc, mỗi công việc phải làm trước một số công việc nào đó khác.

Hãy xếp lịch thực hiện đủ n công việc.

### Dữ liệu vào

* Dòng đầu là số nguyên dương n.
* Các dòng tiếp, đầu dòng là số thứ tự i của một công việc, tiếp theo là số thứ
  tự của các công việc phải làm sau i.

### Dữ liệu ra

Thứ thự thực hiện của n công việc in trên một dòng.

### Giới hạn

* 2 ≤ n ≤ 200
* 1 ≤ i ≤ n


### Ví dụ

| XEPVIEC.INP |      XEPVIEC.OUT     |
| ----------- | -------------------- |
|    10       | 1 2 7 9 4 6 3 5 8 10 |
|    1 2 3    |                      |
|    2 4 10   |                      |
|    3 5      |                      |
|    4 6 8    |                      |
|    5 8      |                      |
|    6 3      |                      |
|    7 9 5    |                      |
|    9 4 10   |                      |

## Lập lịch gia công trên hai máy

Một sản phẩm gồm n chi tiết, mỗi chi tiết phải gia công lần lượt trên hai máy a
và b. Thời gian thực hiện chi tiết i trên máy a là a<sub>i</sub>, trên máy b là
b<sub>i</sub>.

Hãy xếp lịch hoàn thành sản phẩm với thời gian ngắn nhất.

### Dữ liệu vào

* Dòng đầu là số nguyên dương n.
* n dòng tiếp theo, dòng thứ i + 1 lần lượt là hai số nguyên dương
  a<sub>i</sub>, b<sub>i</sub>.

### Dữ liệu ra

* Dòng đầu là thời gian ngắn nhất để hoàn thành sản phẩm.
* Dòng thứ hai ghi thứ tự gia công các chi tiết để hoàn thành trong thời gian
  ngắn nhất này.

### Ví dụ

| LLGC2M.INP | LLGC2M.OUT |
| ---------- | ---------- |
|     5      |  26        |
|     3 3    |  1 4 2 5 3 |
|     4 3    |            |
|     6 2    |            |
|     5 7    |            |
|     6 3    |            |

## Lập lịch chia n việc cho m máy

Cho n công việc, công việc i hoàn thành trong thời gian t<sub>i</sub>. Các công
việc được thực hiện trên m máy có công suất như nhau.

Hãy phân chia công việc cho các máy sao cho thời gian hoàn thành ngắn nhất.

### Dữ liệu vào

* Dòng đầu lần lượt ghi hai số nguyên dương n và m.
* Dòng thứ hai là n số nguyên dương t<sub>1</sub>, t<sub>2</sub>, ...,
  t<sub>n</sub>.

### Dữ liệu ra

* Dòng đầu là thời gian ngắn nhất để hoàn thành công việc.
* m dòng tiếp theo, dòng thứ i + 1 ghi số thứ tự các công việc thực hiện trên
  máy i để hoàn thành công việc trong thời gian ngắn nhất này.

### Ví dụ

|  LLGCMM.INP | LLGCMM.OUT |
| ----------- | ---------- |
| 6 3         | 8          |
| 2 5 8 1 5 1 | 3          |
|             | 2 4 1      |
|             | 5 6        |
