# mHoang

## THỪA SỐ NGUYÊN TỐ (PFACTOR.*)

Cho số nguyên dương n, tìm số nguyên tố p lớn nhất là ước số của n.

### Dữ liệu

Vào từ thiết bị nhập chuẩn số nguyên n, (2 ≤ n ≤ 10<sup>14</sup>).

### Kết quả

Ghi ra thiết bị xuất chuẩn một số nguyên duy nhất là ước số nguyên tố lớn nhất
của n.

### Ví dụ

| Sample Input | Sample Output |
| :----------: | :-----------: |
|      10      |       5       |

## TAM GIÁC (TRIANGLE.*)

Cho ba số nguyên a, b, c là độ dài ba cạnh của một tam giác, hãy cho biết tam
giác đó là tam giác vuông, nhọn, hay tù.

### Dữ liệu

Vào từ thiết bị nhập chuẩn ba số nguyên dương a, b, c cách nhau bởi dấu cách.

### Kết quả

Ghi ra thiết bị xuất chuẩn số 0, 1, hay 2 tùy theo tam giác đó là vuông, nhọn,
hay tù.

### Ví dụ

| Sample Input | Sample Output |
| :----------: | :-----------: |
|     3 4 5    |       0       |
|     3 3 3    |       1       |
|     3 4 6    |       2       |

## HỆ THỐNG ĐÈN MÀU (DECOR.*)

Để trang trí cho một lễ hội, ban tổ chức đã dùng một hệ thống đèn màu gồm n đèn
đánh số từ 1 đến n. Mỗi đèn có khả năng sáng màu xanh hoặc màu đỏ. Các đèn được
điều khiển theo quy tắc sau:

* Bấm công tắc lần 1, tất cả các đèn đều sáng màu xanh.
* Bấm công tắc lần 2, tất cả các đèn có số thứ tự chia hết cho 2 sẽ đổi màu
  (xanh thành đỏ và ngược lại).
* Bấm công tắc lần 3, tất cả các đèn có số thứ tự chia hết cho 3 sẽ đổi màu
  (xanh thành đỏ và ngược lại).
* ...
* Bấm công tắc lần n, tất cả các đèn có số thứ tự chia hết cho n sẽ đổi màu
  (xanh thành đỏ và ngược lại).

### Yêu cầu

Xác định số đèn sáng màu xanh sau n lần bấm công tắc.

### Dữ liệu

Vào từ thiết bị nhập chuẩn số nguyên dương n ≤ 10<sup>18</sup>.

### Kết quả

Ghi ra thiết bị xuất chuẩn số đèn xanh sau lần bấm công tắc thứ n.

### Ví dụ

| Sample Input | Sample Output |
| :----------: | :-----------: |
|       6      |       2       |

## Hình chữ nhật bốn màu

Trên mặt phẳng toạ độ Đề các vuông góc Oxy cho *n* điểm phân biệt
*A<sub>i</sub>*(*x<sub>i</sub>*, *y<sub>i</sub>*), *i* = 1, 2, …, *n*. Mỗi điểm
*A<sub>i</sub>* được tô bởi màu *c<sub>i</sub>* ∈ {1,2,3,4}. Ta gọi hình chữ
nhật bốn màu là hình chữ nhật thoả mãn hai điều kiện sau:

* Bốn đỉnh của hình chữ nhật là bốn điểm trong *n* điểm đã cho và được tô bởi
  bốn màu khác nhau.
* Các cạnh của hình chữ nhật song song với một trong hai trục toạ độ.

### Yêu cầu

Cho biết toạ độ và màu của *n* điểm, hãy đếm số lượng hình chữ nhật bốn màu.

### Dữ liệu

* Dòng đầu tiên chứa số nguyên dương *n* là số lượng điểm trên mặt phẳng.
* Dòng thứ *i* trong *n* dòng tiếp theo chứa ba số nguyên *x<sub>i</sub>*,
  *y<sub>i</sub>*, *c<sub>i</sub>* là thông tin về toạ độ và màu của điểm thứ 
  *i*, *i* = 1, 2, …, *n*.

*Các số trên cùng một dòng được ghi cách nhau ít nhất một dấu cách.*

### Kết quả

Một dòng chứa số lượng hình chữ nhật đếm được.

### Giới hạn

* 4 ≤ *n* ≤ 100000.
* |*x<sub>i</sub>*|, |*y<sub>i</sub>*| ≤ 200.

### Ví dụ

|                              COLOREC.INP                              | COLOREC.OUT |
| --------------------------------------------------------------------- | :---------: |
| 7<br>0 0 1<br>0 1 4<br>2 1 2<br>2 -1 3<br>0 -1 1<br>-1 -1 4<br>-1 1 1 |      2      |
