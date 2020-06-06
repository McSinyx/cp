# ĐỀ THI HSG LỚP 12 HUYỆN VĨNH TƯỜNG NĂM HỌC 2006-2007

Môn: Tin học
Thời gian: 150 phút (không kể thời gian giao đề).

## Câu 1 (5 điểm)

Nhập vào một số nhị phân có `n` chữ số (`n` < 100). Hãy in ra số dư khi chia số
đó cho 3.

Ví dụ:

|  n   |   Số nhị phân   | Kết quả |
| ---: | --------------: | :-----: |
|   3  |             101 |    2    |
|   8  |        10100111 |    2    |
|  12  |    100000001101 |    0    |
|  14  |  11001111101110 |    1    |
|   6  |          111111 |    0    |
|  15  | 111111111111110 |    0    |

## Câu 2 (4 điểm)

Nhập vào số nguyên dương `n`. Hãy in ra số nguyên tố nhỏ nhất lớn hơn `n`.

Ví dụ:

|  n   | Kết quả |
| ---: | ------: |
|   10 |    11   |
|    7 |    11   |
|   44 |    47   |
|  992 |   997   |
| 2332 |  2333   |

## Câu 3 (8 điểm)

Nhập vào từ số tự nhiên `n` (`n` < 1000).

1. Phân tích `n` thành tích các thừa số nguyên tố.
2. Tìm các số tự nhiên nhỏ hơn hoặc bằng `n` mà sau khi làm phép phân tích ở
   phần 1 có nhiều nhân tử nhất.

Ví dụ:

|  n   |    Kết quả     |
| ---: | -------------- |
|   9  | 3 3<br>8       |
|  15  | 3 5<br>8 12    |
|  21  | 3 7<br>16      |
|  70  | 2 5 7<br>64    |
| 150  | 2 3 5 5<br>128 |

## Câu 4 (3 điểm)

Nhập vào một mảng gồm `n` (`n` < 20) số nguyên dương. Hãy đếm xem trong mảng có
bao nhiêu số bậc thang. Biết một số được gọi là số bậc thang nếu biểu diễn thập
phân của nó có nhiều hơn một chữ số đồng thời theo chiều từ trái qua phải, chữ
số đứng sau không nhỏ hơn chữ số đứng trước.

Ví dụ:

|   n   |          Dãy số          | Kết quả |
| :---: | ------------------------ | :-----: |
|   7   | 1 4 7 5 8 9 3            |    0    |
|   5   | 123 102 10023 9 21       |    1    |
|   6   | 115 110 11112 31 14 1109 |    3    |
