# KÌ THI THỬ DUYÊN HẢI

Bộ môn TIN HỌC

TRƯỜNG THPT CHUYÊN KHTN

## BIGNUM

Trên đường đến Núi Cốc tham gia thi Duyên Hải, Ming nhặt được một dãy số, vốn
là người thích số 11, Ming quyết định sắp xếp lại các chữ số để tạo thành một
số chia hết cho 11.

Hãy xác định số lớn nhất mà Ming có thể tạo ra?

### INPUT

Dòng đầu ghi số N ≤ 1000, là số các chữ số trong dãy số của Ming. Dòng sau ghi
N chữ số.

### OUTPUT

In ra số lớn nhất Ming có thể tạo ra, hoặc -1 nếu không thể sắp xếp.

### GIỚI HẠN

50% số test có N ≤ 20.

|  Sample Input  | Sample Output |
| -------------- | ------------- |
| 9<br>112233456 |   645231312   |
| 2<br>12        |   -1          |

## GRID

Cho một bảng, mỗi ô chỉ chứa một trong hai loại ký tự: dấu chấm `.` hoặc dấu
sao `*`.

Hãy thay thế một số lượng tối thiểu (có thể = 0) ký tự `.` bằng ký tự `*`, sao
cho tất cả các ký tự `*` tạo thành một hình chữ nhật.

Bên trong hình chữ nhật chỉ có `*` và không có ký tự `.`.

### INPUT

Dòng đầu tiên ghi hai số nguyên H và W - số hàng và số cột của bảng. H dòng
tiếp theo, mỗi dòng chứa W kí tự `*` hoặc `.`. Đảm bảo có ít nhất một ký tự
`*`. Các ký tự viết liền nhau, không có dấu cách ở giữa.

### OUTPUT

In ra bảng đã thay đổi. Giữa các ký tự không có khoảng trống.

### GIỚI HẠN

2 < W, H < 50

|           Sample Input           |      Sample Output      |
| -------------------------------- | ----------------------- |
| `2 3`<br>`*..`<br>`.*.`          | `**.`<br>`**.`          |
| `3 3`<br>`*.*`<br>`.*.`<br>`...` | `***`<br>`***`<br>`...` |

## DIGITSUM

Xét các số nguyên dương liên tiếp: a, a + 1, a + 2, a + 3, ..., b. Số đầu tiên
là a và số cuối cùng là b. Chọn k số liên tiếp từ các số này và tìm ra tổng các
chữ số của chúng. Hãy tìm tổng lớn nhất có thể được?

Ví dụ: a = 11, b = 48, k = 7.

Ta có: trong chuỗi các số nguyên {11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,
22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35 36; 37, 38, 39, 40, 41,
42, 43, 44, 45, 46, 47, 48} sẽ có các bộ với 7 số sau (11, 12, 13, 14, 15, 16,
17), (12, 13, 14, 15, 16, 17, 18), (13, 14, 15, 16, 17, 18, 19), ..., (42, 43,
44, 45, 46, 47, 48).

Bộ đầu tiên sẽ nhận được 1 + 1 + 1 + 2 + 1 + 3 + 1 + 4 + 1 + 5 + 1 + 6 + 1 + 7
= 35, bộ thứ 2 được 42, rồi 49, 47, 45, 43, 41, 39, 37, 35, 42, 49, 56, 54, 52,
50, 48, 46, 44, 42, 49, 56, 63, 61, 59, 57, 55, 53, 51, 49, 56 và cuối cùng là
63. Như vậy tổng lớn nhất là 63, được lấy từ 2 bộ bảy (33, 34, 35, 36,37, 38,
39) và (42, 43, 44, 45, 46, 47, 48). Số cần tìm trong trường hợp này là 63.

Viết chương trình, đọc a, b và k rồi tính ra kết quả.

### INPUT

1 dòng duy nhất ghi các số nguyên dương a, b và k, cách nhau một dấu cách.

### OUTPUT

In ra giá trị lớn nhất có thể được.

### GIỚI HẠN

* 1 ≤ a < b ≤ 50 000 000.
* 2 ≤ k ≤ 10 000
* k ≤ b - a + 1.
* Trong 30% test : k × (b-a) ≤ 1 000 000.
* Trong 70% các test : b ≤ 5 000 000.

| Sample Input | Sample Output |
| ------------ | ------------- |
| 11 48 7      | 63            |

## DIG

Cho một số nguyên dương N. Hãy viết chương trình tìm số có k chữ số nhỏ nhất (0
< k < 30), trong đó mỗi chữ số (0-9) xuất hiện ít nhất một lần và không có chữ
số nào của N.

### INPUT

Gồm 2 số nguyên k và N, cách nhau một dấu cách.

### OUTPUT

In ra đáp số của đề bài, nếu không có in ra số "0".

| Sample Input | Sample Output |
| ------------ | ------------- |
| 4 201345     | 6789          |
