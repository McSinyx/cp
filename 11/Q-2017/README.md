# KÌ THI CHỌN HỌC SINH GIỎI CẤP CỤM TRƯỜNG THPT NĂM HỌC 2016-2017

**Môn thi:** Tin học - Lớp 11    
**Ngày thi:** 01/03/2017    
**Thời gian làm bài:** 150 phút

## Tổng quan bài thi

|  Câu  |  Điểm | Tệp dữ liệu | Tệp kết quả |
| :---: | :---: | :---------: | :---------: |
|   1   |   5   |   CAU1.INP  |   CAU1.OUT  |
|   2   |   5   |   CAU2.INP  |   CAU2.OUT  |
|   3   |   5   |   CAU3.INP  |   CAU3.OUT  |
|   4   |   5   |   CAU4.INP  |   CAU4.OUT  |

## Câu 1: Ước số

Cho trước số nguyên dương n.

### Yêu cầu

Tìm số lượng các ước nguyên dương của n.

### Dữ liệu

Số nguyên dương n ≤ 10<sup>9</sup>.

### Kết quả

Số lượng các ước nguyên dương của n tìm được.

### Ví dụ

| CAU1.INP | CAU1.OUT |                    Giải thích                    |
| :------: | :------: | ------------------------------------------------ |
|    12    |     6    | 12 có 6 ước nguyên dương là 1, 2, 3, 4, 6 và 12. |

## Câu 2: Chi tiết máy

Tại phân xưởng sản xuất chi tiết máy có tổng số nguyên liệu là s (đơn vị khối
lượng). Quy trình sản xuất chi tiết máy được thực hiện như sau:

1. Từ nguyên liệu, người ta tạo ra các phôi, mỗi phôi có khối lượng là k (đơn
   vị khối lượng);
2. Từ mỗi phôi, người ta tạo ra *các* chi tiết máy, mỗi chi tiết có khối lượng
   m (đơn vị khối lượng).

Sau đó phần nguyên liệu dư khi sản xuất phôi và chi tiết máy sẽ được thu lại để
tiếp tục sản xuất theo quy trình trên.

### Yêu cầu

Tìm số chi tiết máy nhiều nhất có thể sản xuất được,

### Dữ liệu

3 số nguyên dương s, k và m, mỗi số ≤ 10<sup>9</sup>.

### Kết quả

Số chi tiết máy nhiều nhất có thể sản xuất được.

### Ví dụ

| CAU2.INP | CAU2.OUT |                       Giải thích                     |
| :------: | :------: | ---------------------------------------------------- |
|  13 5 3  |     3    | 13 nguyên liệu tạo 2 phôi, sản xuất được 2 chi tiết. |
|          |          | Dư 7 nguyên liệu, sản xuất thêm 1 chi tiết nữa.      |
|          |          | Tổng cộng có 3 chi tiết được sản xuất.               |

## Câu 3: Tích lớn nhất

Cho trước n số nguyên bất kì a<sub>1</sub>, a<sub>2</sub>, …, a<sub>n</sub>.

### Yêu cầu

Tìm 2 số trong n số đã cho có tích lớn nhất.

### Dữ liệu

* Dòng đầu chứa số nguyên dương n, 2 ≤ n ≤ 10<sup>4</sup>;
* Dòng sau chứa n số nguyên bất kì có giá trị tuyệt đối ≤ 10<sup>4</sup>.

### Kết quả

Tích hai số có giá trị lớn nhất.

### Ví dụ

|     CAU3.INP     | CAU3.OUT |                 Giải thích                |
| ---------------- | :------: | ----------------------------------------- |
| 4<br>-2 -7 -15 2 |    105   | Hai số -7 và -15 có tích lớn nhất là 105. |

## Câu 4: Xâu đối xứng

Xâu kí tự s gọi là xâu đối xứng nếu viết các kí tự của S theo thứ tự ngược lại
ta nhận được chính xâu S.

Cho trước xâu X gồm các chữ cái tiếng Anh in hoa.

### Yêu cầu

Tìm cách viết thêm ít kí tự nhất vào cuối xâu X để nhận được xâu đối xứng S.

### Dữ liệu

Xâu X có không quá 100 kí tự.

### Kết quả

* Dòng đầu ghi số kí tự ít nhất phải viết thêm vào cuối xâu X để nhận được xâu
  đối xứng S.
* Dòng thứ hai ghi xâu đối xứng S nhận được.

### Ví dụ

| CAU3.INP |  CAU3.OUT |                       Giải thích                      |
| :------: | --------- | ----------------------------------------------------- |
|    ABB   | 1<br>ABBA | Thêm `A` vào cuối xâu `ABB` được xâu đối xứng `ABBA`. |
