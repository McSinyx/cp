# KÌ THI CHỌN HỌC SINH GIỎI CẤP THÀNH PHỐ LỚP 12 NĂM HỌC 2015 - 2016

SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI

Môn thi: TIN HỌC

Ngày thi: 10/12/2008

Thời gian làm bài: 180 phút

## Tổng quan bài thi

|  Bài  | Tệp chương trình | Tệp dữ liệu vào | Tệp kết quả ra | Thời gian |
| :---: | :--------------: | :-------------: | :------------: | :-------: |
|   1   |     TBC.PAS      |     TBC.INP     |    TBC.OUT     |  2 giây   |
|   2   |      HC.PAS      |      HC.INP     |     HC.OUT     |  2 giây   |
|   3   |      DG.PAS      |      DG.INP     |     DG.OUT     |  2 giây   |

## Bài 1: Số trung bình cộng

Cho dãy số nguyên a<sub>1</sub>, a<sub>2</sub>, …, a<sub>n</sub>. Số
a<sub>p</sub> (1 ≤ p ≤ n) được gọi là một số trung bình cộng trong dãy nếu tồn
tại 3 chỉ số i, j, k (1 ≤ i, j, k ≤ n) đôi một khác nhau, sao cho a<sub>p</sub>
= (a<sub>i</sub> + a<sub>j</sub> + a<sub>k</sub>) / 3.

### Yêu cầu

Hãy tìm số lượng các số trung bình cộng trong dãy.

### Dữ liệu

* Dòng đầu ghi số nguyên dương n (3 ≤ n ≤ 1000);
* Dòng thứ i trong n dòng tiếp theo ghi số nguyên a<sub>i</sub>
  (|a<sub>i</sub>| < 10<sup>8</sup>).

### Kết quả

Một số duy nhất là đáp án của bài toán.

### Ví dụ

|          TBC.INP           | TBC.OUT |
| :------------------------: | :-----: |
| 5<br>4<br>3<br>6<br>3<br>5 |    2    |
|      3<br>1<br>2<br>5      |    0    |

*Chú ý: 50% số test có n ≤ 300.*

### Bài 2: Hội chợ

Một khu hội chợ có m × n gian hàng được bố trí trong một khu hình chữ nhật kích
thước m × n. Các hàng của hình chữ nhật được đánh số từ trên xuống dưới bắt đầu
từ 1 đến m, còn các cột – đánh số từ trái sang phải, bắt đầu từ 1 đến n, ô nằm
giao của hàng i và cột j là gian hàng (i, j). Mỗi gian hàng trưng bày một sản
phẩm và đều có cửa thông với các gian hàng chung cạnh với nó. Khách tham quan
đi vào khu hội chợ từ một gian hàng bất kỳ bên trái (i bất kỳ, j = 1) và không
nhất thiết phải thăm quan tất cả các gian hàng. Khách chỉ có thể đi ra khỏi khu
hội chợ từ các gian hàng bên phải (i bất kỳ, j = n), tại mỗi gian hàng khách có
thể di chuyển qua các gian hàng có cửa thông với nó. Khi đi vào gian hàng (i,
j) thì khách tham quan phải mua vé giá là a<sub>i, j</sub>.

### Yêu cầu

Tính chi phí ít nhất mà khách tham quan phải trả khi tham quan khu hội chợ.

### Dữ liệu

* Dòng đầu tiên ghi số m, n (2 ≤ m, n ≤ 200).
* m dòng sau, mỗi dòng n số nguyên không âm, cho biết giá vé các gian hàng của
  khu hội chợ. Giá vé tại gian hàng (i, j) là a<sub>i, j</sub> ≤ 30000.

### Kết quả

Một số duy nhất là chi phí ít nhất tìm được.

### Ví dụ

|                HC.INP                | HC.OUT |
| ------------------------------------ | :----: |
| 3 4<br>2 1 9 1<br>5 0 3 4<br>2 1 9 1 |   10   |

*Chú ý: 50% số test có m, n ≤ 20.*

## Bài 3: Đa giác

Trên mặt phẳng tọa độ, xét đa giác lồi n đỉnh, các đỉnh đều có tọa độ nguyên và
có giá trị tuyệt đối không vượt quá 10<sup>5</sup>. Các đỉnh của đa giác được
liệt kê theo chiều kim đồng hồ. 

### Yêu cầu

Cho đoạn thẳng xác định bởi hai điểm có tọa độ là (x<sub>1</sub>,
y<sub>1</sub>) và (x<sub>2</sub>, y<sub>2</sub>) trong đó x<sub>1</sub>,
y<sub>1</sub>, x<sub>2</sub>, y<sub>2</sub> là các số nguyên và có giá trị
tuyệt đối không vượt quá 10<sup>6</sup>. Hãy xác định độ dài L là phần của đoạn
thẳng nằm trong đa giác hay trên cạnh của đa giác và đưa ra số nguyên là phần
nguyên của tích L * 100.

### Dữ liệu

* Dòng đầu tiên chứa số nguyên n (3 ≤ n ≤ 100);
* Dòng thứ i trong n dòng sau chứa 2 số nguyên xác định tọa độ đỉnh i của đa
  giác;
* Dòng cuối cùng chứa 4 số nguyên x<sub>1</sub>, y<sub>1</sub>, x<sub>2</sub>,
  y<sub>2</sub>.

### Kết quả

Một số nguyên là phần nguyên của tích L * 100.

### Ví dụ

|                   DG.INP                    | DG.OUT |
| ------------------------------------------- | :----: |
| 4<br>0 1<br>1 0<br>0 -1<br>-1 0<br>-2 0 0 0 |   100  |
