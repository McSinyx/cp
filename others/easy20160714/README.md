# Eazy 2016-07-14

## Bài 01

Nhập số nguyên x có giá trị tuyệt đối không vượt quá 1000.

Tìm số nguyên âm chẵn lớn nhất nhỏ hơn x.

### Ví dụ

| INP.TXT | OUT.TXT |
| :-----: | :-----: |
|   -1    |   -2    |

## Bài 02

Cho một dãy số nguyên, đưa ra số chẵn lớn nhất.

### Dữ liệu vào

* Dòng đầu chứa số nguyên dương n là số lượng phần tử của dãy (n ≤ 100).
* Dòng thứ hai chứa n số nguyên a<sub>1</sub>, a<sub>2</sub>, ...,
  a<sub>n</sub> (|a<sub>i</sub>| ≤ 1000).

### Dữ liệu ra

Một số duy nhất là số chẵn lớn nhất trong dãy. Nếu không tồn tại số nào, ghi ra
-1.

### Ví dụ

|    INP.TXT   | OUT.TXT |
| ------------ | ------- |
| 4<br>2 9 6 3 |    6    |

## Bài 03

Một cửa hàng mới khai trương được n ngày. Ban đầu cửa hàng bỏ ra k đồng để đầu
tư cơ sở hạ tầng. Ngày thứ i cửa hàng bỏ ra một số vốn là a<sub>i</sub> đồng và
cuối ngày thu về b<sub>i</sub> đồng.

Hỏi ngày bao nhiêu thì cửa hàng bắt đầu thu hồi được hết vốn bỏ ra?

### Dữ liệu vào

* Dòng đầu chứa hai số nguyên dương n và k (n ≤ 100, k ≤ 10<sup>6</sup>).
* Dòng thứ hai chứa n số nguyên dương a<sub>1</sub>, a<sub>2</sub>, ...,
  a<sub>n</sub> (|a<sub>i</sub>| ≤ 1000).
* Dòng thứ b chứa n số nguyên dương b<sub>1</sub>, b<sub>2</sub>, ...,
  b<sub>n</sub> (|b<sub>i</sub>| ≤ 1000).

### Dữ liệu ra

Một số nguyên chỉ ngày đầu tiên cửa hàng thu hồi vốn. Nếu sau n ngày vẫn chưa
thu hồi vốn, ghi ra số -1.

### Ví dụ

|          INP.TXT          | OUT.TXT |
| ------------------------- | :-----: |
| 4 8<br>3 2 3 4<br>4 5 9 2 |    3    |
| 3 6<br>1 2 3<br>2 3 4     |   -1    |

## Bài 04

Cho dãy n số a<sub>1</sub>, a<sub>2</sub>, ..., a<sub>n</sub> và số nguyên m.

Tìm hai số có tổng là m trong dãy a.

### Dữ liệu vào

* Dòng đầu chứa hai số nguyên n và k (0 ≤ n ≤ 100, m ≤ 2000).
* Dòng thứ hai chứa n số nguyên a<sub>1</sub>, a<sub>2</sub>, ...,
  a<sub>n</sub> (|a<sub>i</sub>| ≤ 1000).

### Dữ liệu ra:

Vị trí hai số có tổng là m trong dãy a. Nếu không tồn tại số nào, ghi ra -1.

### Ví dụ

|     INP.TXT    | OUT.TXT |
| -------------- | ------- |
| 4 8<br>2 9 6 3 |   1 3   |

## Bài 05

Giải bóng đá trường CHY có x đội tham gia. Luật chơi như sau. Tại mỗi vòng, các
đội sẽ tham gia bốc thăm chọn cặp đá loại trực tiếp. Đội chiến thắng sẽ vào
vòng sau. Nếu số đội là lẻ, có một đội bốc được lá thăm đặc biệt. Đội đó có thể
bị loại hoặc cũng có thể không cần phải tham gia thi đấu cũng được vào vòng
tiếp theo. Cứ như vậy cho tới khi tìm được nhà vô địch.

Hỏi số trận đấu của giải là bao nhiêu?

### Dữ liệu vào

Một số nguyên dương x duy nhất là số lượng đội tham gia.

### Dữ liệu ra

Hai số nguyên dương là tổng số trận đấu diễn ra:

* Trường hợp một là đội bốc được lá thăm đặc biệt sẽ được vào thẳng vòng tiếp.
* Trường hợp hai là đội bốc lá thăm đặc biệt sẽ bị loại.

### Ví dụ

| INP.TXT | OUT.TXT |
| :-----: | :-----: |
|    5    |   4 3   |

## Bài 06

Mỗi ngày đi học, Đạt xin tiền mẹ x đồng mua bánh mỳ ăn sáng. Mỗi tuần Đạt học 6
buổi. Nhưng cứ vào ngày thứ 2 đầu tuần, Đạt chở em đi học nên mẹ cho thêm k
đồng nữa. Tuy nhiên, thay vì ăn sang, Đạt đã tích tiền để mua quà tặng gấu. Giá
của món quà mà Đạt muốn mua là y đồng.

Hỏi buổi học thứ bao nhiêu Đạt đủ tiền mua quà, biết ngày đầu tiên đi học là
thứ Hai?

### Dữ liệu vào

Ba số nguyên dương x, y, k.

### Dữ liệu ra

Một số nguyên dương duy nhất là số buổi học.

### Ví dụ

| INP.TXT | OUT.TXT |
| :-----: | :-----: |
|  2 18 3 |    7    |

## Bài 07

Trong cuộc bỏ phiếu rời UE, đất nước LANDENG có tổ chức cuộc trưng cầu dân ý.
Đã có n người tham gia bỏ phiếu với số phiếu. Những người đồng ý việc rời UE sẽ
ký hiệu phiếu số 1. Những người không đồng ý sẽ ký hiệu trên là phiếu số 2.
Những người còn lại, có ý kiến khác đã ký hiệu trên phiếu số 3 và ghi thêm một
số ý kiến của mình.

Hãy lập trình cho biết kết quả kiểm phiếu, biết quốc hội sẽ phê duyệt việc rời
UE khi có trên 50% người ủng hộ việc rời UE.

### Dữ liệu vào

* Dòng đầu chứa số nguyên dương n là số người tham gia bỏ phiếu.
* Dòng thứ hai chứa n số nguyên a<sub>1</sub>, a<sub>2</sub>, ...,
  a<sub>n</sub> (1 ≤ a<sub>i</sub> ≤ 3) là ký hiệu của lá phiếu của n người.

### Dữ liệu ra

`YES` nếu nước LANDENG rời UE còn `NO` trong trường hợp ngược lại.

### Ví dụ

|      INP.TXT     | OUT.TXT |
| ---------------- | :-----: |
| 6<br>1 3 1 2 2 1 |    NO   |

## Bài 08

Hôm nay đi học bé Đạt được cô giáo dạy về hình tam giác vuông. Nhà bé Đạt có n
que diêm với độ dài lần lượt là a<sub>1</sub>, a<sub>2</sub>, ...,

a<sub>n</sub>. Vì mới học nên bé Đạt muốn xem có 3 que nào có thể ghép thành
hình tam giác vuông không? Bạn hãy lập trình giúp bé Đạt nhé!

### Dữ liệu vào

* Dòng đầu chứa số nguyên dương n (n ≤ 100) là số que diêm nhà bé Đạt.
* Dòng thứ hai  chứa n số nguyên dương a<sub>1</sub>, a<sub>2</sub>, ...,
  a<sub>n</sub> là độ dài của n que diêm nhà Đạt.

### Dữ liệu ra

`YES` nếu có cách xếp cho bé Đạt, `NO` nếu không có.

### Ví dụ

|     INP.TXT    | OUT.TXT |
| -------------- | :-----: |
| 5<br>1 2 3 4 5 |   YES   |

## Bài 09

Ở trường Đạt có quen rất nhiều bạn gái. Một hôm Đạt được các bạn gái hỏi bài.
Đề bài được đưa ra là: Cho 4 số l, r, a, b, hãy xác định số lượng số trong đoạn
từ [l, r] mà chia hết cho cả a và b. Do hôm đó không nghe thầy giáo giảng nên
Đạt đã không biết làm. Tuy nhiên vì không muốn mất mặt với các bạn gái nên Đạt
đã nhờ sự trợ giúp của bạn.

### Dữ liệu vào

4 số nguyên dương l, r, a, b (l ≤ r ≤ 10<sup>9</sup>; a, b ≤ 1000) lần lượt là
các số liệu của bài toán bạn gái Đạt.

### Dữ liệu ra

Một số tự nhiên duy nhất là kết quả bài toán bạn gái của Đạt.

### Ví dụ

|  INP.TXT  | OUT.TXT |
| :-------: | :-----: |
| 11 81 2 3 |    12   |

## Bài 10

Hôm nay lớp của Đạt lại học về dãy số cộng. Vì là người có giải quốc gia nên
Đạt được các bạn nam trong lớp tin tưởng giao cho làm hộ một bài toán khó: Cho
dãy n phần tử kiểm tra xem dãy có phải cấp số cộng hay không. Vì tối nay Đạt đã
bận nhắn tin cho bạn gái nhưng cũng không muốn phụ lòng các bạn trai nên Đạt
nhờ tới sự trợ giúp của bạn.

### Dữ liệu vào

* Dòng đầu chứa số nguyên n là số lượng số trong dãy số của bạn trai Đạt.
* Dòng thứ hai chứa n số nguyên a<sub>1</sub>, a<sub>2</sub>, ...,
  a<sub>n</sub> lần lượt là các số trong bài toán của bạn trai Đạt.

### Dữ liệu ra

`YES` nếu dãy là cấp số cộng, `NO` trong trường hợp không là cấp số cộng.

### Ví dụ

|     INP.TXT    | OUT.TXT |
| -------------- | :-----: |
| 5<br>1 3 5 7 9 |   YES   |

## Bài 11. Hoán vị (Permutation)

Kiểm tra dãy số a<sub>1</sub>, a<sub>2</sub>, ..., a<sub>n</sub> có phải là
hoán vị của dãy 1, 2, ..., n hay không?

### Dữ liệu vào

* Dòng đầu chứa số nguyên dương n (n ≤ 10<sup>5</sup>) là số là số lượng số
  trong dãy.
* Dòng thứ hai chứa n số nguyên a<sub>1</sub>, a<sub>2</sub>, ...,
  a<sub>n</sub> (a<sub>i</sub> ≤ 10<sup>5</sub>).

### Dữ liệu ra

`YES` nếu dãy là hoán vị, `NO` trong trường hợp không là hoán vị.

### Ví dụ

|     INP.TXT    | OUT.TXT |
| -------------- | :-----: |
| 5<br>1 3 5 4 2 |   YES   |
| 5<br>1 5 3 4 5 |    NO   |

## Bài 12. Điểm danh (Mark)

Một lớp có n học sinh. Hôm nay thầy giáo bắt các bạn điểm danh bằng cách đọc số
thứ tự của mình trong lớp. Số thứ tự bạn nào được đọc lên nghĩa là bạn đó đã có
mặt. Trong lớp có m bạn, mỗi bạn tới lượt mình tự nhớ và điểm danh số thứ tự
a<sub>i</sub>.

Hỏi những bạn có số thứ tự nào đã vắng mặt trong sổ điểm danh? 

### Dữ liệu vào

* Dòng đầu chứa hai số nguyên dương n, m (m ≤ n ≤ 10<sup>5</sup>).
* Dòng thứ hai chứa m số nguyên dương a<sub>1</sub>, a<sub>2</sub>, ...,
  a<sub>m</sub> (a<sub>i</sub> ≤ n).

### Dữ liệu ra

* Dòng đầu là số bạn vắng p trong sổ điểm danh.
* Dòng thứ hai chứa p số nguyên dương tăng dần là số thứ tự các bạn vắng.

### Ví dụ

|     INP.TXT    |  OUT.TXT |
| -------------- | -------- |
| 6 4<br>3 5 2 6 | 2<br>1 4 |

## Bài 13. Xếp hàng khám bệnh

Bệnh viện có m phòng khám. Có n bệnh nhân tới bệnh viện khám bệnh xếp hàng theo
thứ tự. Bệnh nhân thứ i muốn vào phòng khám a<sub>i</sub>.

Hãy cho biết số thứ tự của bệnh nhân thứ i tại phòng khám họ muốn vào, biết mỗi
bệnh nhân tới đều được cấp một số thứ tự khám tại phòng là số thứ tự của người
trước đó khám tại phòng đó cộng thêm 1 (người đầu tiên có số thứ tự là 1).

### Dữ liệu vào

* Dòng đầu chứa hai số nguyên dương n, m (m ≤ 100; n ≤ 10<sup>5</sup>).
* Dòng thứ hai chứa n số nguyên a<sub>1</sub>, a<sub>2</sub>, ...,
  a<sub>n</sub> (a<sub>i</sub> ≤ 10<sup>5</sup>).

### Dữ liệu ra

n số nguyên t<sub>1</sub>, t<sub>2</sub>, ..., t<sub>n</sub> với t<sub>i</sub>
là số thứ tự khám của người thứ i ghi trên một dòng.

### Ví dụ

|        INP.TXT       |    OUT.TXT    |
| -------------------- | ------------- |
| 7 3<br>1 3 1 3 2 1 2 | 1 1 2 2 1 3 2 |

## Bài 14. Đấu giá ngược (Reverse Auctions)

Có n người tham gia trò chơi đấu giá ngược để mua chiếc iPhone 6 Plus của công ty ABC. Người thứ i đưa ra mức giá a<sub>i</sub>. Ban tổ chức muốn chọn ra một người đã đưa ra mức giá nhỏ nhất và duy nhất để trao giải.

Hỏi người nhận giải thưởng đã phải trả số tiền bao nhiêu?

### Dữ liệu vào

* Dòng đầu chứa số nguyên dương n (n ≤ 10<sup>5</sup>).
* Dòng thứ hai chứa n số nguyên dương a<sub>1</sub>, a<sub>2</sub>, ...,
  a<sub>n</sub> (a<sub>i</sub> ≤ 10<sup>5</sup>).

### Dữ liệu ra

Một số nguyên duy nhất là giá mà người thắng cuộc đưa ra. Nếu không tồn tại
người thắng cuộc, đưa ra -1.

### Ví dụ

|      INP.TXT     | OUT.TXT |
| ---------------- | :-----: |
| 6<br>4 3 2 1 2 1 |    3    |

## Bài 15. Kiểm hàng siêu thị

Một siêu thị kinh doanh n mặt hàng được đánh số từ 1 đến n. Mặt hàng thứ i đang
còn số lượng là b<sub>i</sub> và mức tối thiểu cần duy trì để đảm bảo hoạt động
kinh doanh là a<sub>i</sub>. Hệ thống thông tin của siêu thị sẽ nhận được m tín
hiệu thuộc một trong hai loại sau:

* Loại A: `1 x y` - đã nhập thêm y mặt hàng x.
* Loại B: `2 x y` - đã bán y mặt hàng x. Nếu số lượng sản phẩm mặt hàng này
  dưới mức an toàn thì cần nhập thêm để đạt mức a<sub>x</sub>.

### Dữ liệu vào

* Dòng đầu chứa hai số nguyên dương n, m.
* n dòng tiếp theo, mỗi dòng chứa hai số tự nhiên a<sub>i</sub> và
  b<sub>i</sub>.
* m dòng tiếp theo, mỗi dòng chứa một thông tin loại A hoặc B.

### Dữ liệu ra

Với thông tin loại B, nếu số lượng sản phẩm x ở mức không an toàn, ghi ra tín
hiệu `BUY x y` trong đó y là số sản phẩm x cần mua thêm để đạt mức an toàn.

### Ví dụ

| INP.TXT | OUT.TXT |
| ------- | ------- |
|  3 6    |         |
|  3 4    |         |
|  2 3    |         |
|  4 6    |         |
|  2 2 2  | BUY 2 1 |
|  1 2 3  |         |
|  2 3 1  |         |
|  2 3 5  | BUY 3 4 |
|  2 2 1  |         |
|  2 1 3  | BUY 1 2 |

## Bài 16

Cho xâu s chỉ chứa các chữ cái tiếng Anh thường và n yêu cầu có dạng:

* `1 x y`: thêm xâu x vào sau vị trí thứ y của xâu s hiện tại, nếu y = 0 thì
  thêm x vào đầu xâu s.
* `2 x y`: xóa xâu s bắt đầu từ vị trí thứ x, độ dài y.

### Dữ liệu vào

* Dòng đầu chứa xâu s và n (|s|, n ≤ 100).
* n dòng tiếp theo chứa các yêu cầu.

### Dữ liệu ra

Gồm n dòng, mỗi dòng là xâu s sau khi thực hiện mỗi yêu cầu.

### Ví dụ

|         INP.TXT         |   OUT.TXT  |
| ----------------------- | ---------- |
| abc 2<br>1 d 1<br>2 2 2 | adbc<br>ac |

## Bài 17

Cho xâu s gồm các chữ cái tiếng Anh và dấu cách.

Chuẩn hóa s về dạng biểu diễn tên người - chữ cái đầu tiên mỗi từ viết hoa, các
chữ còn lại viết thường, giữa các từ chỉ có một dấu cách. 

### Dữ liệu vào

Xâu s (|s| ≤ 100000).

### Dữ liệu ra

Xâu s sau khi chuẩn hoá.

### Ví dụ

|           INP.TXT           |           OUT.TXT          |
| --------------------------- | -------------------------- |
| `riCHArd  MAttHEW sTalLmAn` | `Richard Matthew Stallman` |

## Bài 18

Cho xâu s gồm chữ cái in thường và chữ số.

Tính tổng các số trong xâu.

### Dữ liệu vào

Xâu s (|s| ≤ 50).

### Dữ liệu ra

Một số tự nhiên là tổng cần tìm.

### Ví dụ

|   INP.TXT   | OUT.TXT |
| :---------: | :-----: |
| 1as123as3xy |   127   |

## Bài 20

Cho hai xâu x và y.

Tìm vị trí x xuất hiện đầu tiên trong y.

### Dữ liệu vào

Hai xâu x và y (|x|, |y| ≤ 100000).

### Dữ liệu ra

Vị trí x xuất hiện đầu tiên trong y, nếu không tìm được in ra -1.

### Ví dụ

|  INP.TXT  | OUT.TXT |
| :-------: | :-----: |
| abc zabcd |    2    |
| abc abdd  |   -1    |

## Bài 21

Cho hai xâu x và y.

Kiểm tra xem có thể xoá một số kí tự của y để được x (hay x là xâu con không
liên tiếp của y) không.

### Dữ liệu vào

Hai xâu x và y (|x|, |y| ≤ 1000).

### Dữ liệu ra

`YES` nếu x là xâu con không liên tiếp của y, `NO` nếu không phải.

### Ví dụ

|  INP.TXT  | OUT.TXT |
| :-------: | :-----: |
| abc adbec |   YES   |
| abb abcd  |    NO   |

## Bài 21

Hôm nay Đạt được mẹ cho tiền đi chợ chơi. Đạt muốn mua áo để về khoe bạn gái. Ở
chợ có n cái áo xếp thành hàng đánh số từ 1 tới n và giá của chúng cũng tăng
dần từ a<sub>1</sub> tới a<sub>n</sub>. Những áo cùng loại thì có giá giống
nhau và những áo khác loại có giá khác nhau. Đạt định mua mỗi loại một áo nhưng
Đạt không biết là có bao nhiêu loại áo.

Hãy giúp Đạt đếm xem chợ có bao nhiêu loại áo.

### Dữ liệu vào

* Dòng đầu chứa số nguyên dương n (n ≤ 10<sup>5</sup>).
* Dòng thứ hai chứa n số nguyên dương a<sub>1</sub> ≤ a<sub>2</sub> ≤ ... ≤
  a<sub>n</sub> ≤ 10<sup>5</sup>.

### Dữ liệu ra

Một số nguyên dương duy nhất là số loại áo trong chợ.

### Ví dụ

|      INP.TXT     | OUT.TXT |
| ---------------- | :-----: |
| 6<br>1 2 2 2 5 5 |    3    |

## Bài 22

Hôm nay Đạt ở nhà một mình. Anh của Đạt có một xấp giấy. Mỗi tờ ghi số khác
nhau. Các tờ giấy đã được sắp xếp theo thứ tự tăng dần của số ghi trên tờ giấy.
Do nghịch ngợm Đạt đã chia xấp giấy của anh thành hai xấp nhỏ hơn cũng được sắp
xếp tăng dần theo số trên tờ giấy. Vì sợ anh mắng nên Đạt nhờ bạn tìm cách sắp
xếp chúng lại như ban đầu.

### Dữ liệu vào

* Dòng đầu chứa hai số nguyên dương n, m (n, m ≤ 10<sup>5</sup>) lần lượt là số
  lượng các tờ giấy của mỗi xấp.
* Dòng thứ hai chứa n số nguyên dương a<sub>1</sub>, a<sub>2</sub>, ...,
  a<sub>n</sub> là số ghi trên các tờ giấy của xấp thứ nhất.
* Dòng thứ ba chứa m số nguyên dương b<sub>1</sub>, b<sub>2</sub>, ...,
  b<sub>n</sub> là số ghi trên các tờ giấy của xấp thứ hai.

### Ví dụ

|        INP.TXT        |   OUT.TXT   |
| --------------------- | ----------- |
| 3 3<br>1 4 6<br>2 3 5 | 1 2 3 4 5 6 |

## Bài 23

Hôm nay Đạt tiếp tục được mẹ cho tiền đi chợ chơi. Đạt lại muốn mua áo về khoe
bạn gái. Ở chợ có n cái áo có giá lần lượt là a<sub>1</sub>, a<sub>2</sub>,
..., a<sub>n</sub>. Những áo cùng loại thì có giá giống nhau và những áo khác
loại có giá khác nhau. Đạt định mua mỗi loại 1 áo nhưng Đạt không biết là có
bao nhiêu loại áo.

Hãy giúp Đạt đếm xem chợ có bao nhiêu loại áo.

### Dữ liệu vào

* Dòng đầu chứa số nguyên dương n (n ≤ 10<sup>5</sup>).
* Dòng thứ hai chứa n số nguyên dương a<sub>1</sub>, a<sub>2</sub>, ...,
  a<sub>n</sub>.

### Dữ liệu ra

Một số nguyên dương duy nhất là số loại áo trong chợ.

### Ví dụ

|      INP.TXT     | OUT.TXT |
| ---------------- | :-----: |
| 6<br>3 2 1 3 1 1 |    3    |

## Bài 24

Công ty của bố Đạt dùng xe tải để chở hàng. Mỗi xe có thể chở không quá k tấn.
Có n kiện hàng, kiện hàng thứ i có khối lượng a<sub>i</sub>. Vì các kiện hàng
phải được chuyển ra theo thứ tự nên mỗi xe tải chỉ được chở các kiện hàng liên
tiếp.

Đạt nhờ bạn tính số xe tải cần dùng.

### Dữ liệu vào

* Dòng đầu chứa hai số nguyên dương n và k (n, k ≤ 10<sup>5</sup>).
* Dòng thứ hai chứa n số nguyên dương a<sub>1</sub>, a<sub>2</sub>, ...,
  a<sub>n</sub>.

### Dữ liệu ra

Một số nguyên dương duy nhất là số lượng xe tải cần dùng.

### Ví dụ

|      INP.TXT     | OUT.TXT |
| ---------------- | :-----: |
| 5 7<br>1 4 4 2 5 |    3    |

## Bài 25

Đạt có một băng giấy gồm n ô lần lượt ghi các số nguyên a<sub>1</sub>,
a<sub>2</sub>, ..., a<sub>n</sub>. Bạn ấy muốn cắt băng giấy thành k đoạn nhỏ
giống hệt nhau.

Hãy giúp Đạt kiểm tra xem có tồn tại cách cắt nào như thế không.

### Dữ liệu vào

* Dòng đầu chứa hai số nguyên dương n và k (n, k ≤ 10<sup>5</sup>).
* Dòng thứ hai chứa n số nguyên a<sub>1</sub>, a<sub>2</sub>, ...,
  a<sub>n</sub>.

### Dữ liệu ra

`YES` nếu có thể cắt như vậy, `NO` nếu không.

### Ví dụ

|          INP.TXT         | OUT.TXT |
| ------------------------ | :-----: |
| 9 3<br>1 2 5 1 2 5 1 2 5 |   YES   |

## Bài 26

Đạt có một băng giấy dài gồm n ô, mỗi ô có ghi một số nguyên. Đạt muốn cắt băng
giấy làm đúng k đoạn nhỏ sao cho các đoạn có tổng các số ghi trên giấy là bằng
nhau.

Đạt muốn biết có tồn tại cách cắt nào như thế không.

### Dữ liệu vào

* Dòng đầu chứa hai số nguyên dương n và k (n, k ≤ 10<sup>5</sup>).
* Dòng thứ hai chứa n số nguyên a<sub>1</sub>, a<sub>2</sub>, ...,
  a<sub>n</sub>.

### Dữ liệu ra

`YES` nếu có thể cắt như vậy, `NO` nếu không.

### Ví dụ

|          INP.TXT          | OUT.TXT |
| ------------------------- | :-----: |
| 9 3<br>1 2 3 4 10 5 3 1 1 |   YES   |

## Bài 27

Cho bảng kích thước m * n. Mỗi ô có chứa một số nguyên có giá trị tuyệt đối nhỏ
hơn 1000. Đường chéo là các ô nằm trên đường thẳng đi qua góc trái trên vào góc
phải dưới của một ô bất kì.

Tìm đường chéo có tổng các ô trong đó lớn nhất.

### Dữ liệu vào

* Dòng đầu chứa hai số nguyên dương m và n (m, n ≤ 100).
* m dòng sau mỗi dòng chứa n số nguyên là các số trong bảng.

### Dữ liệu ra

Tổng lớn nhất tìm được.

### Ví dụ

|                  INP.TXT                  | OUT.TXT |
| ----------------------------------------- | :-----: |
| 3 4<br>-6 5 1 5<br>-1 10 5 1<br>-1 1 10 5 |    15   |

## Bài 28

Cho ma trận kích thước m * n chứ các số nguyên. Ma trận con được xác định bởi
tọa độ của ô trái trên và ô phải dưới. *Giá trị* của một ma trận con được định
nghĩa là hiệu của số lớn nhất và số nhỏ nhất trong đó.

Hãy tìm một ma trận con có không ít hơn s ô và có *giá trị* lớn nhất.

### Dữ liệu vào

* Dòng đầu chứa ba số nguyên dương m, n và s (m, n ≤ 100; s ≤ m * n).
* m dòng sau mỗi dòng chứa n số nguyên là các số trong bảng.

### Dữ liệu ra

*Giá trị* lớn nhất tìm được.

### Ví dụ

|                  INP.TXT                  | OUT.TXT |
| ----------------------------------------- | :-----: |
| 3 4<br>-6 5 1 5<br>-1 10 5 1<br>-1 1 10 5 |    16   |

## Bài 29

Cho ma trận kích thước m * n chứ các số nguyên. Ma trận con được xác định bởi
tọa độ của ô trái trên và ô phải dưới.

Hãy tìm ma trận con có không ít hơn s ô và có trung bình cộng các ô lớn nhất.

### Dữ liệu vào

* Dòng đầu chứa ba số nguyên dương m, n và s (m, n ≤ 10; s ≤ m * n).
* m dòng sau mỗi dòng chứa n số nguyên là các số trong bảng.

### Dữ liệu ra

Trung bình cộng lớn nhất tìm được.

### Ví dụ

|                   INP.TXT                  | OUT.TXT |
| ------------------------------------------ | :-----: |
| 3 4<br>-6 5 1 5<br>-1 10 5 1<br>-1 10 10 5 |   8.75  |

## Bài 30

Cho n điểm trên mặt phẳng tọa độ.

Tìm hình vuông có cạnh song song với trục tọa độ có cạnh nhỏ nhất chứa tất cả
các điểm đó.

### Dữ liệu vào

* Dòng đầu chứa số nguyên dương n (n ≤ 10<sup>5</sup>).
* Dòng thứ hai chứa n cặp số nguyên x<sub>1</sub>, y<sub>1</sub>,
  x<sub>2</sub>, y<sub>2</sub>, ..., x<sub>n</sub>, y<sub>n</sub> với
  (x<sub>i</sub>, y<sub>i</sub>) là toạ độ của điểm thứ i.

### Dữ liệu ra

Một số nguyên dương duy nhất là độ dài cạnh hình vuông cần tìm.

### Ví dụ

|           INP.TXT          | OUT.TXT |
| -------------------------- | :-----: |
| 5<br>1 1 1 1 3 3 1 3 3 2 2 |    2    |

## Bài 31

Cho n điểm trên trục hoành.

Tìm điểm có tổng khoảng cách đến các điểm đã cho là nhỏ nhất.

### Dữ liệu vào

* Dòng đầu chứa số nguyên dương n (n ≤ 10<sup>5</sup>).
* Dòng thứ hai chứa n số nguyên a<sub>1</sub>, a<sub>2</sub>, ...,
  a<sub>n</sub> lần lượt là hoành độ các điểm đã cho.

### Dữ liệu ra

Một số tự nhiên duy nhất là tổng các khoảng cách nhỏ nhất tìm được.

### Ví dụ

|     INP.TXT    | OUT.TXT |
| -------------- | :-----: |
| 5<br>1 3 5 6 8 |    10   |
