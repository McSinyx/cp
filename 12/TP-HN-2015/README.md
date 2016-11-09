# KÌ THI CHỌN HỌC SINH GIỎI CẤP THÀNH PHỐ LỚP 12 NĂM HỌC 2015 - 2016

SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI

Môn thi: TIN HỌC

Ngày thi: 02/10/2015

Thời gian làm bài: 180 phút

## Tổng quan bài thi

|  Bài  | Tệp chương trình | Tệp dữ liệu vào | Tệp kết quả ra | Thời gian |
| :---: | :--------------: | :-------------: | :------------: | :-------: |
|   1   |     BAI1.PAS     |     BAI1.INP    |    BAI1.OUT    |   2 giây  |
|   2   |     BAI2.PAS     |     BAI2.INP    |    BAI2.OUT    |   2 giây  |
|   3   |     BAI3.PAS     |     BAI3.INP    |    BAI3.OUT    |   2 giây  |
|   4   |     BAI4.PAS     |     BAI4.INP    |    BAI4.OUT    |   2 giây  |

## Bài 1. Đếm nghiệm (6 điểm)

Cho phuơng trình: ax + by = c (x, y là ẩn; a, b, c là số nguyên dương nhỏ hơn
10<sup>5</sup>).

### Yêu cầu

Hãy đếm số nghiệm nguyên dương (x, y) của phương trình đã cho thoả mãn x, y
nguyên tố cùng nhau.

### Dữ liệu vào

Một dòng duy nhất chứa ba số a, b, c cách nhau bởi một dấu cách.

### Dữ liệu ra

Số nghiệm (x, y) thoả mãn yêu cầu trên.

### Ví dụ

| BAI1.INP | BAI2.OUT |         Giải thích        |
| -------- | -------- | ------------------------- |
| 1 2 10   | 2        | (x, y) ∈ {(4, 3), (8, 1)} |

## Bài 2. Điều hoà (5 điểm)

Một trường THPT có n lớp học được đánh số thứ tự từ 1 đến n cần trang bị điều
hoà. Mỗi lớp một điều hoà với công suất phụ thuộc vào diện tích của từng lớp.
Lớp thứ i cần lắp điều hoà với công suất không bé hơn a<sub>i</sub> (W). Nhà
trường đã tham khảo các cửa hàng điện lạnh và lập được bảng danh mục các loại
điều hoà kèm theo công suất và giá tương ứng.

### Yêu cầu

Cho trước yêu cầu điều hoà với công suất tương ứng nhỏ nhất của từng lớp học
cũng như danh mục các loại điều hoà. Hãy giúp nhà trường tính số tiền nhỏ nhất
cần bỏ ra để trang bị điều hoà cho tất cả n lớp học.

### Dữ liệu vào

* Dòng đầu là số tự nhiên n (1 ≤ n ≤ 50000) là số lượng lớp học,
* Dòng thứ hai chứ n số nguyên a<sub>i</sub> (1 ≤ a<sub>i</sub> ≤ 1000) là công
  suất nhỏ nhất của điều hoà cần trang bị cho lớp i.
* Dòng thứ 3 chứa số nguyên m (1 ≤ m ≤ 50000) là số lượng các model điều hoà
  khác nhau (mỗi model có số lượng điều hoà không hạn chế).
* m dòng tiếp theo, mỗi dòng chứa 2 số nguyên b<sub>j</sub>, c<sub>j</sub> (1 ≤
  b<sub>j</sub>, c<sub>j</sub> ≤ 1000) lần lượt là công suất và giá tương ứng
  của loại điều hoà model j.

### Kết quả ra

Tổng số tiền nhỏ nhất để mua đủ n điều hoà cho các lớp của trường.

### Ví dụ

| BAI2.INP | BAI2.OUT |               Giải thích               |
| -------- | -------- | -------------------------------------- |
| 3        | 13       | Lớp 1 mua điều hoà công suất 2, giá 3  |
| 1 2 3    |          | Lớp 2 mua điều hoà công suất 2, giá 3  |
| 4        |          | Lớp 3 mua điều hoà công suất 10, giá 7 |
| 1 10     |          |                                        |
| 1 5      |          |                                        |
| 10 7     |          |                                        |
| 2 3      |          |                                        |
