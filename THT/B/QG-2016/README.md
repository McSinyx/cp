# ĐỀ THI BẢNG B – TRUNG HỌC CƠ SỞ

HỘI THI TIN HỌC TRẺ TOÀN QUỐC LẦN THỨ XXII – 2016

Thời gian làm bài 180 phút, không kể thời gian phát đề

## Bài 1: LƯỚI TAM GIÁC (30 điểm)

Đề thi năng lực của trường mầm non SuperKids có một bài toán rất đơn giản: Trên
mặt phẳng cho một tam giác đều độ dài cạnh là `a` (`a` là một số nguyên), người
ta đặt `a` − 1 điểm trên mỗi cạnh để chia đều các cạnh ra thành các đoạn thẳng
dài 1 đơn vị. Với mỗi cặp hai điểm trên hai cạnh khác nhau, người ta vẽ một
đoạn thẳng nối chúng nếu đoạn thẳng này song song với cạnh thứ ba. Sau khi vẽ
hết các đoạn thẳng như vậy, ta thu được một lưới các tam giác đều cạnh 1 đơn vị
mà những điểm trên mặt phẳng ở vị trí đỉnh của các tam giác đều đó được gọi là
**nút lưới**.

Hình vẽ dưới đây thể hiện lưới tam giác đều được xây dựng với `a` = 4

![](http://i.stack.imgur.com/c8X1c.jpg)

Nhiệm vụ của các bé thí sinh là đếm số tam giác đều có trong hình vẽ. Nói một
cách chính xác, các bé cần đưa ra **số bộ ba nút lưới** là ba đỉnh của một tam
giác đều có ba cạnh song song với ba cạnh của tam giác ban đầu. Như ví dụ trên,
có thể đếm được có 27 tam giác đều bao gồm: 16 tam giác đều cạnh 1 đơn vị, 7
tam giác đều cạnh 2 đơn vị, 3 tam giác đều cạnh 3 đơn vị và 1 tam giác đều cạnh
4 đơn vị.

Tuy bài toán không khó với các bé thí sinh trường SuperKids nhưng lại là thách
thức lớn cho ban giám khảo trong việc làm đáp án chấm điểm. Hãy giúp ban giảm
khảo đưa ra đáp số. Chú ý là vì đáp số rất lớn nên chỉ cần đưa ra số dư của đáp
số khi chia cho 2016.

Em cần tạo file kết quả có tên là `TRIGRID.TXT` gồm 15 dòng, mỗi dòng ghi một số
nguyên duy nhất là số dư của số tam giác đếm được khi chia cho 2016 ứng với một
giá trị `a` trong bảng dưới đây:

         a          | TRIGRID.TXT
--------------------|------------
4                   | 27
3                   |
5                   |
6                   |
111                 |
222                 |
3333                |
4444                |
55555               |
666666              |
7777777             |
88888888            |
999999999           |
123456789123456789  |
1000000000000000000 |

Chú ý: Kết quả tương ứng với giá trị `n` nào cần ghi ĐÚNG trên dòng tương ứng
với giá trị `a` đó.

## Bài 2. SỐ DƯ (30 điểm)

Giờ học về phép chia có dư tỏ ra quá dễ dàng cho các bé trường mầm non
SuperKids, để tăng tính hấp dẫn cho giờ học, cô giáo muốn đặt ra một thách thức
mới.

Cho ba số nguyên dương `x`, `n`, `m`. Cô giáo xét dãy chữ số là biểu diễn thập
phân của `x` và viết lặp đi lặp lại dãy chữ số này `n` lần để được biểu diễn
thập phân của một số `y`. Nhiệm vụ của các bé là phải cho biết số
dư của `y` khi chia cho `m`.

Ví dụ với `x` = 12, `n` = 3, `m` = 8. số `y` = 121212, số dư của `y` khi chia
cho 8 là 4.

Các bé làm việc rất hào hứng và nhanh chóng đưa ra kết quả, vấn đề của cô giáo
là cần biết kết quả đúng để phát phiếu bé ngoan cho các bé làm đúng và nhanh
nhất. Em hãy giúp cô giáo tính toán kết quả.

Em cần tạo file kết quả có tên là `REMAINDER.TXT` gồm 15 dòng, mỗi dòng ghi một
số nguyên duy nhất là kết quả tìm được ứng một bộ giá trị `x`, `n`, `m` dưới
đây:

         x         |         n          |         m          | REMAINDER.TXT
-------------------|--------------------|--------------------|--------------
12                 | 3                  | 8                  | 4
2                  | 15                 | 17                 |
456                | 6                  | 1296               |
1234               | 100                | 9                  |
11223344           | 1000000            | 142857             |
55667788           | 10000000           | 1000000007         |
1357               | 24682468           | 999999999          |
24680              | 1357913579         | 777777777          |
998                | 1000000000000      | 999                |
1234               | 11111111111111     | 30                 |
1                  | 222222222222222    | 123456789          |
2016               | 666666666666666    | 8888888888         |
11223344           | 555666777888999    | 1357924680         |
999999999999999967 | 999999999999999877 | 999999999999999989 |
123456789123456789 | 123456789123456789 | 987654321123456789 |

Chú ý: Kết quả tương ứng bộ dữ liệu nào cần ghi ĐÚNG trên dòng tương ứng với bộ
dữ liệu đó.

## Bài 3. NÔNG TRẠI VUI VẺ (40 điểm)

Bản đồ trang trại của ông Đông có thể mô tả như một bảng kích thước `n` × `n`
được chia thành lưới ô vuông đơn vị. Các hàng của bảng được đánh số từ 1 đến
`n` từ trên xuống dưới, các cột của bảng được đánh số từ 1 đến `n` từ trái sang
phải. Ô nằm ở hàng `i`, cột `j` được gọi là ô (`i`, `j`).

Ông Đông là người rất trật tự vì vậy ông đã bố trí xem kẽ những chuồng trâu và
chuồng bò trong trang trại của mình. Cụ thể là: nếu ô (`i`, `j`) có `i` + `j`
chẵn thì ông sẽ đặt một chuồng trâu; nếu ô (`i`, `j`) có `i` + `j` lẻ thì ông
sẽ đặt chuồng bò. Có thể thấy rằng, theo cách thức như vậy sẽ không có hai
chuồng giáp cạnh nhau cùng nuôi trâu hoặc cùng nuôi bò.

Vì số lượng chuồng rất lớn, nên ông Đông thiết kế một máy đếm tự động. Cách
thức làm việc của máy là mỗi khi ông Đông đưa vào một phạm vi hình chữ nhật
được giới hạn bởi ô ở góc trái trên (`r1` , `c1` ) và góc phải dưới (`r2` ,
`c2` ) thì máy đếm sẽ tự động đếm số chuồng trâu trong các ô thuộc phạm vi này
(Những ô (`i`, `j`) có `r1` ≤ `i` ≤ `r2` và `c1` ≤ `j` ≤ `c2` ). Dĩ nhiên từ
con số máy trả về cũng có thể suy ra số chuồng bò trong phạm vi đó.

Lũ trâu bò của ông Đông rất tinh nghịch và thông minh, chúng phát hiện ra rằng
máy đếm số chuồng trâu dựa vào màu lông của chúng. Vì vậy để “lừa" máy đếm tự
động, những con bò có thể nhuộm đen lông của chúng để trông giống như trâu và
những con trâu cũng có thể nhuộm vàng lông của chúng để trông giống như bò. Vào
ngày tổ chức kì thi tin học trẻ, ông Đông được mật báo rằng lũ trâu bò ở hai
chuồng tại hai ô khác nhau đã tiến hành nhuộm lông chúng theo cách trên, điều
này khiến cho máy đếm trâu bò của ông hoạt động không được chính xác. Ông Đông
muốn nhờ các bạn, dựa vào hoạt động của máy và quy tắc phân bố các chuồng ban
đầu, phát hiện vị trí hai chuồng mà lũ gia súc đã tự ý nhuộm đổi màu lông.

### Thư viện

Chương trình của bạn phải đặt tên là `FARM.pas`/`FARM.cpp` tùy theo ngôn ngữ
lập trình bạn sử dụng.

Chương trình phải khai báo sử dụng một thư viện đặc biệt được ban giám khảo
cung cấp để làm bài toán này. Thư viện gồm có các file `detect.pp` (dành cho
Pascal); `detect.cpp` và `detect.h` (dành cho C++).

Cách khai báo:

    Pascal: uses detect;
    C++: include "detect.h"

Thư viện detect cung cấp các hàm và thủ tục sau đây mà bạn có thể dùng trong
chương trình `FARM.pas`/`FARM.cpp`.

    Pascal: function get_n: longint
    C++: int get_n()

Chương trình của bạn cần phải gọi hàm này để nhận được giá trị `n`. Giá trị `n`
trả về đảm bảo 2 ≤ `n` ≤ 100000. **Hàm `get_n` này cần phải được gọi trước khi
gọi bất cứ hàm nào khác của thư viện.**

    Pascal: function buffalo(r1, c1, r2, c2: longint): int64
    C++: long long buffalo(int r1, int c1, int r2, int c2)

Hàm này trả về số chuồng trâu ở các ô (`i`, `j`) mà `r1` ≤ `i` ≤ `r2` và `c1` ≤
`j` ≤ `c2`. Bạn cần đảm bảo hàm này được gọi với các giá trị thoả mãn 1 ≤ `r1`
≤ `r2` ≤ `n` và 1 ≤ `c1` ≤ `c2` ≤ `n`. Nếu các tham số không thoả mãn hàm sẽ
trả về giá trị -1. Nếu hàm này được gọi quá 1000000 lần, thư viện sẽ tự động
ngắt chương trình và bạn bị ghi nhận 0 điểm.

    Pascal: procedure answer(x1, y1, x2, y2: longint)
    C++: void answer(int x1, int y1, int x2, int y2)

Bạn cần gọi hàm này để kết thúc chương trình. Các tham số (`x1` , `y1` ) và
(`x2` , `y2` ) chỉ ra hai ô mà trâu/bò trong hai chuồng đó tự ý nhuộm đổi màu
lông.

### Biên dịch

Nếu bạn viết chương trình bằng Pascal, bạn phải khai báo sử dụng thư viện `uses
detect;` ngay sau dòng tiêu đề chương trình (xem ví dụ cuối bài).

Nếu bạn viết chương trình bằng C/C++, bạn phải khai báo sử dụng thư viện
`#include "detect.h"` (xem ví dụ cuối bài). Nếu bạn sử dụng Code Blocks hoặc
DevCpp, bạn nên tạo một Project có chứa cả file bài làm và các files thư viện
cho tiện lợi trong việc dịch chương trình.

### Thử nghiệm chương trình

Trong quá trình làm bài, bạn được cung cấp:

* Các file thư viện: `detect.pas`, `detect.h` và `detect.cpp`.
* Các file chương trình mẫu: `sample_FARM.pas` và `sample_FARM.cpp` Các bạn có
  thể dựa vào hai file chương trình mẫu này để hiểu cách sử dụng thư viện. Lưu
  ý rằng hai chương trình mẫu này không phải là chương trình tốt.

Ví dụ với `n` = 4, sơ đồ bố trí các chuồng trâu bò của ông Đông như sau (ô đen
là chuồng trâu):

![](sample_FARM.png)

Chương trình `FARM.pas` có thể như sau:

```pascal
program FARM;

uses detect;

var
  n: LongInt;

begin
  n := get_n;

  if (n = 4) and
     (buffalo(1, 2, 2, 3) = 1) and
     (buffalo(2, 1, 3, 2) = 1) and
     (buffalo(1, 1, 3, 1) = 2) and
     (buffalo(3, 4, 3, 4) = 1) then
    answer(2, 2, 3, 4);
end.
```

Chương trình `FARM.cpp` có thể như sau:

```cpp
#include "detect.h"

int 
main()
{
  int n = get_n();

  if (n == 4
      && buffalo(1, 2, 2, 3) == 1 && buffalo(2, 1, 3, 2) == 1
      && buffalo(1, 1, 3, 1) == 2 && buffalo(3, 4, 3, 4) == 1)
    answer(2, 2, 3, 4);

  return 0;
}
