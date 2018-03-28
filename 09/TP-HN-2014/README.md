# KỲ THI HỌC SINH GIỎI THÀNH PHỐ LỚP 9 NĂM HỌC 2013 - 2014

SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI

Môn thi: TIN HỌC

Ngày thi: 31/03/2014

Thời gian làm bài: 150 phút

## Tổng quan bài thi

|  Câu  | Tệp chương trình | Tệp dữ liệu | Tệp kết quả |  Điểm |
| :---: | :--------------: | :---------: | :---------: | :---: |
|   1   |     CAU1.PAS     |   CAU1.INP  |   CAU1.OUT  |   6   |
|   2   |     CAU2.PAS     |   CAU2.INP  |   CAU2.OUT  |   6   |
|   3   |     CAU3.PAS     |   CAU3.INP  |   CAU3.OUT  |   4   |
|   4   |     CAU4.PAS     |   CAU4.INP  |   CAU4.OUT  |   4   |

## Câu 1: Hiệu hai phân số

Cho bốn số nguyên dương a, b, c, d, mỗi số có giá trị không vượt quá
10<sup>5</sup>.

### Yêu cầu

Tìm hai số nguyên x, y để phân số tối giản <sup>x</sup>/<sub>y</sub> và bằng
hiệu của hai phân số <sup>a</sup>/<sub>b</sub> - <sup>c</sup>/<sub>d</sub>,
trong đó y > 0.

### Dữ liệu

* Dòng đầu chứ hai số a, b;
* Dòng thứ hai chứa hai số c, d.

### Kết quả

Hai số x và y trên cùng một dòng, cách nhau một dấu cách.

### Ví dụ

|   CAU1.INP  | CAU1.OUT |
| ----------- | :------: |
| 1 6<br>5 12 |   -1 4   |

#### Giải thích

<sup>1</sup>/<sub>6</sub> - <sup>5</sup>/<sub>12</sub> =
<sup>-1</sup>/<sub>4</sub>

## Câu 2: Đua Robot

Trong cuộc đua tốc độ có n Robot tham gia được đánh số từ 1 đến n. Đường đua
có độ dài d (mét). Robot thứ i (1 ≤ i ≤ n) có vận tốc đua không đổi là
v<sub>i</sub> (mét/phút). Các Robot xuất phát theo thứ tự từ 1 đến n và cách
nhau 1 phút. Robot i gọi là vượt Robot j (1 ≤ j ≤ n) nếu i xuất phát sau j và
về đích trước j.

### Yêu cầu

Xác định số lần vượt nhau của tất cả các Robot trong cuộc đua.

### Dữ liệu

* Dòng đầu chứa hai số nguyên dương n và d, n ≤ 10<sup>3</sup>,
  d ≤ 10<sup>9</sup>;
* Dòng tiếp theo chứa n số nguyên dương v<sub>i</sub>, 1 ≤ i ≤ n, mỗi số không
  vượt quá 1000.

### Kết quả

Số lần vượt nhau của tất cả các Robot trong cuộc đua.

### Ví dụ

|      CAU2.INP     | CAU2.OUT |
| ----------------- | :------: |
| 5 10<br>1 2 4 3 8 |     7    |

#### Giải thích

* Robot 2 vượt Robot 1;
* Robot 3 vượt Robot 1, 2;
* Robot 4 vượt Robot 1;
* Robot 5 vượt Robot 1, 2, 4.

Tổng số lần vượt là 7.

## Câu 3: Tìm kiếm trong xâu

Cho xâu s có độ dài tối đa 250 kí tự gồm chữ cái in hoa, in thường và chữ số.

### Yêu cầu

Đếm xem trong xâu s có bao nhiêu kí tự khác nhau và tìm độ dài đoạn kí tự liên
tiếp dài nhất trong xâu s tạo thành xâu x đối xứng. Xâu kí tự x được gọi là đối
xứng nếu đọc từ trái sang phải hoặc ngược lại ta đều thu được xâu như nhau.

### Dữ liệu

Một dòng duy nhất chứa xâu s.

### Kết quả

* Dòng thứ nhất ghi số lượng kí tự khác nhau trong s;
* Dòng thứ hai ghi độ dài xâu x tìm được.

### Ví dụ

|      CAU3.INP     | CAU3.OUT |
| :---------------: | :------: |
| AbcabA12321ABCcba |  9<br>7  |

#### Giải thích

Các kí tự khác nhau gồm: `1`, `2`, `3`, `A`, `B`, `C`, `a`, `b`, `c`.

Xâu X tìm được là: `A12321A`.

## Câu 4: Trồng cây

Dọc theo một tuyến phố thẳng có n vị trí kế tiếp nhau để trồng cây đánh số từ 1
đến n. Hiện tại chỉ có vị trí k (1 ≤ k ≤ n) đã trồng một cây có độ cao
a<sub>k</sub>, còn các vị trí khác để trống. Theo dự kiến, người ta sẽ trồng
cây có độ cao a<sub>i</sub> tại vị trí thứ i (1 ≤ i ≤ n, i ≠ k). Tuy nhiên, để
tăng vẻ đẹp cho hàng cây, người ta muốn tìm một phương án sắp xếp các cây cần
trồng vào các vị trí thích hợp (trừ vị trí k) sao cho tổng tất cả các độ chênh
lệch của hai cây trồng liền nhau là nhỏ nhất. Độ chênh lệch của hai cây là giá
trị tuyệt đối hiệu độ cao hai cây.

### Yêu cầu

Tìm giá trị nhỏ nhất t của tổng tất cả các độ chênh lệch của hai cây trồng liền
nhau.

### Dữ liệu

* Dòng đầu chứa hai số nguyên dương n và d, n ≤ 10<sup>3</sup>, 1 ≤ k ≤ n;
* Dòng sau chứa n số nguyên dương a<sub>i</sub>, 1 ≤ i ≤ n, là độ cao của cây
  thứ i theo dự kiến. Mỗi số đều không vượt quá 10<sup>6</sup>.

### Kết quả

Số t tìm được.

### Ví dụ

|     CAU4.INP     | CAU4.OUT |
| ---------------- | :------: |
| 5 2<br>7 3 4 2 6 |     5    |

#### Giải thích

* Vị trí 1 trồng cây có độ cao 2;
* Vị trí 3 trồng cây có độ cao 4;
* Vị trí 4 trồng cây có độ cao 6;
* Vị trí 5 trồng cây có độ cao 7.

Tổng độ chênh lệch nhỏ nhất là 5.
