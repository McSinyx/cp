# Đề thi bảng C Hội thi Tin học trẻ Thành phố Hà Nọi lần thứ XXIII

Thời gian làm bài 150 phút, klhông kể thời gian phát đề

## Tổng quan đề thi

|     Tên bài     | File nguồn | File dữ liệu | File kết quả | Điểm  |
| --------------- | ---------- | ------------ | ------------ | :---: |
| Đoán kết quả    |  GUESS.\*  |  GUESS.INP   |  GUESS.OUT   |  20   |
| Phần tử cực trị |  MAB.\*    |  MAB.INP     |  MAB.OUT     |  30   |
| Tính hàm        |  FUNC.\*   |  FUNC.INP    |  FUNC.OUT    |  30   |
| Đèn trang trí   |  LAMPS.\*  |  LAMPS.INP   |  LAMPS.OUT   |  20   |

* Dấu \* được thay thế bởi PAS hoặc CPP của ngôn ngữ lập trình được sử dụng
  tương ứng là Pascal hoặc C++.
* Với mỗi bài, thí sinh có thể nộp nhiều lần. Điểm số là điểm của lần nộp cuối
  cùng.

*Hãy lập trình giải các bài toán sau:*

## Đoán kết quả

Tôi đang nghĩ một phép toán là một trong các phép toán cộng (+), trừ (-) và
nhân (\*). Kí hiệu phép toán mà tôi nghĩ là #. Bạn được cho hai số nguyên *a*,
*b*, bạn hãy đoán xem kết quả *a* # *b* bằng bao nhiêu.

### Dữ liệu

Gồm một dòng chứ hai số nguyên *a*, *b* (|*a*|, |*b*| ≤ 2 x 10<sup>9</sup>).

### Kết quả

Một số là giá trị mà bạn đoán cho kết quả *a* # *b*.

## Phần tử cực trị

Cho bảng số nguyên *A* gồm *m* dòng và *n* cột. Các dòng của lưới được đánh số
từ 1 đến *m*, từ trên xuống dưới. Các cột của lưới được đánh số từ 1 đến *n*,
từ trái sang phải. Phần tử nằm trong ô giao của dòng *i* và cột *j* của lưới
gọi là phần từ *a*<sub>*ij*</sub>.

Phần tử *a*<sub>*ij*</sub> được gọi là phần tử cự trị mức (*x*, *y*) nếu trên
hàng *i* không có quá *x* phần tử nhỏ hơn nó đồng thời trên cột *j* không có
quá *y* phần tử lớn hơn nó.

### Yêu cầu

Cho bảng số *A* và *k* cặp số nguyên không âm. Với mỗi cặp số *x*<sub>*s*</sub>,
*y*<sub>*s*</sub>, đếm số lượng phần tử cực trị mức (*x*<sub>*s*</sub>,
*y*<sub>*s*</sub>).

### Dữ liệu

* Dòng đầu chứ ba số nguyên dương *m*, *n*, *k*;
* Dòng thứ *i* trong *m* dòng thiếu theo, mỗi dòng chứa *n* số nguyên mô tả
  bảng *A*. Các số trong bảng có giá trị tuyệt đối không vượt quá
  10<sup>9</sup>.
* Dòng thứ *s* trong *k* dòng tiếp theo chứa hai số nguyên *x*<sub>*s*</sub>,
  *y*<sub>*s*</sub> (0 ≤ *x*<sub>*s*</sub> ≤ *n*, 0 ≤ *y*<sub>*s*</sub> ≤ *m*).

### Kết quả

Gồm *k* dòng, dòng thứ *s* ghi một số là số phần tử cực trị mức
(*x*<sub>*s*</sub>, *y*<sub>*s*</sub>) trong bảng số *A*.

### Ví dụ

|                      MAB.INP                      | MAB.OUT |                       Giải thích                       |
| ------------------------------------------------- | :-----: | ------------------------------------------------------ |
| 3 3 2<br>15 3 9<br>55 4 6<br>76 1 2<br>0 0<br>1 0 | 1<br>2  | *a*<sub>22</sub><br>*a*<sub>22</sub>, *a*<sub>13</sub> |

### Ràng buộc

* Các test ứng với 50% số điểm có *m*, *n* ≤ 100, *k* = 1;
* Các test khác ứng với 30% số điểm có *m*, *n* ≤ 1000; *k* = 1, *x* = *y* = 0;
* Các test còn lại ứng với 20% số điểm có *m*, *n* ≤ 1000, *k* ≤ 10000.

## Tính hàm

Cho hàm số *f*(*k*, *r*, *p*, *q*) =

* <sup>p</sup>/<sub>q</sub> nếu *k* = 1
* <sup>1</sup>/<sub>*f*(*k* - 1, *r*, *p*, *q*)</sub> nếu k > 1

### Yêu cầu

Cho 5 số nguyên dương *k*, *r*, *p*, *q*, *M*. Gọi phân số tối giản
<sup>*a*</sup>/<sub>*b*</sub> = *f*(*k*, *r*, *p*, *q*), hãy tính *a* % *M*,
*b* % *M* (với *x* % *M* là phần dư phép chia *x* cho *M*).

### Dữ liệu

Gồm nhiều dòng, mỗi dòng chứa 5 số nguyên dương *k*, *r*, *p*, *q*, *M*
(*r*, *p*, *q* ≤ 100).

### Kết quả

Gồm nhiều dòng, mỗi dòng chứa hai số *a* % *M*, *b* % *M* là kết quả tương ứng
với bộ dữ liệu vào

### Ví dụ

|  FUNC.INP   | FUNC.OUT |
| ----------- | :------: |
| 1 1 5 10 10 |   1 2    |
| 4 1 1 1 10  |   3 5    |

### Ràng buộc

* Các test ứng với 20% số điểm có *k* = 1, *M* ≤ 10;
* Các test khác ứng với 20% số điểm có *k* = 1, *M* ≤ 10;
* Các test khác ứng với 20% số điểm có *k* = 5, *M* ≤ 10;
* Các test khác ứng với 10% số điểm có *k* ≤ 10<sup>6</sup>,
  *M* ≤ 10<sup>6</sup>;
* Các test khác ứng với 10% số điểm có *k* ≤ 10<sup>9</sup>,
  *M* ≤ 10<sup>6</sup>;
* Các test còn lại ứng với 20% số điểm có *k* ≤ 10<sup>15</sup>,
  *M* ≤ 10<sup>15</sup>.

## Đèn trang trí

Một hệ thống đèn trang trí gồm *n* đèn được đánh số từ 1 đến *n* và *n* - 1
đoạn dây nối các cặp đèn. Hệ thống dây nối thoả mãn mãn tính chất sau:

* Không có đoạn dây nào nối một đèn với chính nó;
* Không có hai đoạn dây nào nối cùng một cặp đèn;
* Không tìm được dãy đèn *v*<sub>1</sub>, *v*<sub>2</sub>, …,
  *v*<sub>*k*</sub>, *v*<sub>1</sub> mà trong đó mỗi cặp hai đèn liên tiếp đều
  có đoạn dây nối.

Tại mỗi thời điểm, mỗi đèn sẽ sáng màu xanh hoặc đỏ. Bộ điều khiển hệ thống đèn
có thể thực hiện tác động nhiều lần việc thay đổi trạng thái các đèn, mỗi lần
tác động là đổi màu của một đèn cùng tất cả các đèn nối với nó. Vì lí do kĩ
thuật, giữa hai đèn *i*, *j* (chưa có dây nối) được bổ sung thêm một đoạn dây
nối.

### Yêu cầu

Cho biết màu ban đầu của *n* đèn và thông tin về các dây nối, hãy tìm các điều
khiển để tất cả các đèn sáng màu xanh.

### Dữ liệu

* Dòng đầu chứa 2 số nguyên dương *n*, *T* lần lượt là số đèn và số trường hợp
  thử nghiệm;
* Dòng thứ *k* trong *n* - 1 dòng tiếp chứa hai số nguyên dương
  *u*<sub>*k*</sub>, *v*<sub>*k*</sub> là chỉ số của cặp đèn thứ *k* được nối
  với nhau;
* Dòng tiếp theo chứa hai số nguyên dương *i*, *j*;
* Dòng thứ *s* trong *T* dòng cuối chứa *n* số *c*<sub>*s*1</sub>,
  *c*<sub>*s*2</sub>, …, *c*<sub>*sn*</sub>, trong đó *c*<sub>*sr*</sub> là màu
  của đèn thứ *r* trong trường hợp thử nghiệm thứ *s* (1 chỉ màu xanh, 0 chỉ
  màu đỏ).

### Kết quả

Gồm *T* dòng, mỗi dòng là phương án điều khiển tương ứng với dữ liệu vào theo
dạng sau:

* Số đầu tiên của dòng là số nguyên *m* là số lần điều khiển, nếu không có cách
  điều khiển thoả mãn ghi -1;
* *m* số tiếp theo *l*<sub>1</sub>, *l*<sub>2</sub>, …, *l*<sub>*m*</sub>,
  trong đó *l*<sub>*h*</sub> là chỉ số của đèn được đổi màu trực tiếp trong lần
  tác động thứ *h*.

### Ví dụ

|                 LAMPS.INP                  | LAMPS.OUT |
|                                            | :-------: |
| 4 1<br>1 2<br>2 3<br>3 4<br>1 4<br>0 1 0 0 |    1 4    |
