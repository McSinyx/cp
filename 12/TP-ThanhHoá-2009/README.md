# Kì thi học sinh giỏi tỉnh Thanh Hoá lớp 12 năm học 2008 - 2009

Sở Giáo dục và Đào tạo Thanh Hoá

Môn thi: Tin học

Ngày thi: 28/03/2009

Thời gian: 180 phút

## Tổng quan bài thi

|  Bài  | Tệp chương trình | Tệp dữ liệu vào | Tệp kết quả ra |  Điểm |
| :---: | :--------------: | :-------------: | :------------: | :---: |
|   1   |     BAI1.PAS     |     BAI1.INP    |    BAI1.OUT    |   5   |
|   2   |     BAI2.PAS     |     BAI2.INP    |    BAI2.OUT    |   5   |
|   3   |     BAI3.PAS     |     BAI3.INP    |    BAI3.OUT    |   4   |
|   4   |     BAI4.PAS     |     BAI4.INP    |    BAI4.OUT    |   3   |
|   4   |     BAI5.PAS     |     BAI5.INP    |    BAI5.OUT    |   3   |

Giới hạn thời gian cho mỗi test là 3 giây.

Dữ liệu vào là đúng đắn, không cần phải kiểm tra.

## Bài 1: Số nguyên tố

Cho dãy số gồm có N số nguyên dương a<sub>1</sub>, a<sub>2</sub>, …,
a<sub>N</sub> và một số nguyên dương K.

### Yêu cầu

Hãy cho biết số lượng các phần tử có giá trị nhỏ hơn K là số nguyên tố của dãy
số trên.

### Dữ liệu

* Dòng đầu tiên là hai số N và K.
* Dòng tiếp theo lần lượt là N số nguyên của dãy số.

### Kết quả

Số M là số lượng các phần tử của dãy số thoả mãn yêu cầu đề bài.

### Giới hạn

* 0 < N < 50000
* 0 < K, a<sub>i</sub> < 5000 với mọi i = 1, 2, …, N

### Ví dụ

|        BAI1.INP       | BAI1.OUT |
| --------------------- | :------: |
| 7 8<br>1 2 3 8 7 6 11 |     3    |

## Bài 2: Trung bình cộng

Cho dãy gồm n số nguyên a<sub>1</sub>, a<sub>2</sub>, …, a<sub>n</sub> và số
nguyên K. 

### Yêu cầu

Cho biết trong dãy số đã cho có tồn tại hay không một cặp số mà trung bình cộng
của chúng là K.

### Dữ liệu

* Dòng đầu tiên ghi hai số n, K.
* Dòng tiếp theo lần lượt ghi n số a<sub>1</sub>, a<sub>2</sub>, …,
  a<sub>n</sub>. Các số trên cùng một dòng được ghi cách nhau ít nhất một dấu
  cách trống. 

### Kết quả

* Số 1 nếu tồn tại một cặp số thoả mãn yêu cầu bài toán.
* Số 0 nếu không tồn tại cặp số nào thoả mãn yêu cầu bài toán.

### Giới hạn

* 0 < N < 50000
* |K|, |ai| < 1000 với mọi i = 1, 2, …, n

### Ví dụ

|    BAI2.INP    | BAI2.OUT |
| -------------- | :------: |
| 4 5<br>0 2 6 4 |     1    |
| 3 3<br>1 2 3   |     0    |

## Bài 3: Xâu đối xứng

Xâu đối xứng là xâu đọc giống nhau nếu ta bắt đầu đọc từ trái qua phải hoặc từ
phải qua trái. Ví dụ, xâu `RADAR` là xâu đối xứng, xâu `TOMATO` không phải là
xâu đối xứng.

### Yêu cầu

Cho một xâu S gồm không quá 200 kí tự. Cho biết S có phải là xâu đối xứng hay
không? Nếu không, cho biết số kí tự ít nhất cần thêm vào S để S trở thành xâu
đối xứng.

### Dữ liệu

Gồm duy nhất 1 dòng ghi xâu S.

### Kết quả

Số k là số kí tự ít nhất cần thêm vào S để S trở thành xâu đối xứng. Nếu xâu S
đã cho là đối xứng thì ghi k = 0.

### Ví dụ

| BAI3.INP | BAI3.OUT |
| :------: | :------: |
|   RADAR  |     0    |
|  TOMATO  |     3    |

## Bài 4: Biểu thức Zero

Cuội viết liên tiếp các số tự nhiên từ 1 đến N thành dãy: 1 2 3 … N. Cuội đố
Bờm điền các dấu phép toán + hoặc - vào giữa 2 số tự nhiên liên tiếp sao cho
biểu thức thu được có kết quả bằng 0.

### Yêu cầu

Bạn hãy giúp Bờm viết chương trình liệt kê tất cả các cách điền dấu phép toán
thích hợp.

### Dữ liệu

Gồm 1 dòng duy nhất ghi số N (N < 10).

### Kết quả

* Dòng đầu tiên ghi số M là số cách điền dấu vào biểu thức.
* M dòng tiếp theo, mỗi dòng ghi một kết quả tìm được.

### Ví dụ

| BAI4.INP |   BAI4.OUT   |
| :------: | ------------ |
|     2    | 0            |
|     3    | 1<br>1+2-3=0 |

## Bài 5: Miền 0

Cho một hình chữ nhật gồm M hàng, N cột, được chia thành MxN ô vuông. Mỗi ô
vuông được ghi một trong hai số nguyên 0 hoặc 1. 

Miền 0 là một miền liên tục các số 0 thuộc các ô chung cạnh với nhau. Diện tích
miền là số lượng các ô vuông cùng giá trị thuộc miền đó.

### Yêu cầu

Tính diện tích miền 0 lớn nhất của hình chữ nhật đã cho.

### Dữ liệu

* Dòng đầu tiên ghi hai số M, N.
* M dòng tiếp theo, mỗi dòng ghi N số lần lượt là giá trị các ô trong bảng số.

### Kết quả

Số nguyên duy nhất là diện tích miền 0 lớn nhất.

### Giới hạn

1 < M, N < 100.

### Ví dụ

|               BAI5.INP               | BAI5.OUT |
| ------------------------------------ | :------: |
| 3 4<br>0 0 0 1<br>1 1 0 1<br>0 0 1 0 |     4    |
