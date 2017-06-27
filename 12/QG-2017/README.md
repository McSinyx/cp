# KÌ THI CHỌN HỌC SINH GIỎI QUỐC GIA THPT NĂM 2017

Môn: **TIN HỌC**

## Ngày thi thứ nhất: 05/01/2017

### Tổng quan ngày thi thứ nhất

|    Tên bài    | File chương trình | File dữ liệu | File kết quả | Điểm  |
| ------------- | :---------------: | :----------: | :----------: | :---: |
| Virus         |     VIRUS.\*      |  VIRUS.INP   |  VIRUS.OUT   |   7   |
| Dãy Fibonacci |     FIBSEQ.\*     |  FIBSEQ.INP  |  FIBSEQ.OUT  |   7   |
| Trò chơi      |     BGAME.\*      |  BGAME.INP   |  BGAME.OUT   |   6   |

Dấu `*` được thay thế bởi `PAS` hoặc `CPP` của ngôn ngữ lập trình được sử dụng
tương ứng là Pascal hoặc C++.

### Virus

*TextFile* là một virus chuyên tấn công các file văn bản theo phương thức sau:
Sao chép một đoạn các ký tự liên tiếp trong nội dung của file văn bản vào bộ
nhớ trong, thay đổi một số ký tự trong đoạn này, sau đó chèn đoạn văn bản đã
thay đổi vào ngay sau đoạn văn bản vừa sao chép trong file văn bản.

Vinh đang phát triển phần mềm để phát hiện một file văn bản đã bị nhiễm virus
nói trên hay chưa.  Vì thế, Vinh cần giải quyết bài toán sau: Cho xâu ký tự *T*
và số nguyên không âm *k*, xâu con gồm các ký tự từ vị trí *p* đến vị trí *q*
của xâu T được gọi là đoạn có khả năng bị virus sao chép mức *k* nếu nó sai
khác với xâu con gồm các ký tự từ vị trí *q*+1 đến vị trí *q*+(*q*-*p*+1) của
xâu T ở không quá k vị trí.

Ví dụ, xét xâu *T* = `zabaaxy` và *k* = 1. Đoạn văn bản `ab` từ ký tự thứ 2 đến
ký tự thứ 3 là đoạn văn bản độ dài 2 có khả năng bị virus sao chép mức 1 vì nó
khác với đoạn văn bản `aa` gồm các ký tự từ ký tự thứ 4 đến ký tự thứ 5 của xâu
*T* ở 1 vị trí.

#### Yêu cầu

Cho xâu ký tự *T* và *n* số nguyên không âm *k*<sub>1</sub>, *k*<sub>2</sub>,
…, *k<sub>n</sub>*. Với mỗi giá trị k<sub>i</sub>, hãy tìm độ dài đoạn dài nhất
trong xâu *T* có khả năng bị virus sao chép mức *k<sub>i</sub>* (*i* = 1, 2, …,
*n*).

#### Dữ liệu

* Dòng đầu chứa số nguyên dương *n* (*n* ≤ 10);
* Dòng thứ hai chứa một xâu *T* gồm các chữ cái in thường lấy từ tập 26 chữ cái
  tiếng Anh từ `a` đến `z`;
* Dòng thứ *i* trong số *n* dòng tiếp theo ghi số nguyên không âm
  *k<sub>i</sub>* (*k<sub>i</sub>* ≤ 10, *i* = 1, 2, …, *n*).

#### Kết quả

*n* dòng, dòng thứ *i* ghi một số nguyên không âm là độ dài đoạn dài nhất có
khả năng bị virus sao chép mức *k<sub>i</sub>* , *i* = 1, 2, …, *n*. Ghi *0*
nếu không tìm được đoạn như vậy.

#### Ràng buộc

Ký hiệu *m* là độ dài của xâu *T*.

* Có 40% số lượng test thỏa mãn điều kiện: *m* ≤ 300;
* Có thêm 30% số lượng test thỏa mãn điều kiện: *m* ≤ 3000; *k<sub>i</sub>* = 0
  với mọi *i*;
* 30% số lượng test còn lại thỏa mãn điều kiện: *m* ≤ 3000.

#### Ví dụ

|         VIRUS.INP         | VIRUS.OUT |
| ------------------------- | :-------: |
| 2<br>zabaaxy<br>0<br>1    |  1<br>2   |
| 2<br>zcaabcaaaa<br>0<br>1 |  2<br>4   |

##### Giải thích

Trong ví dụ thứ hai, đoạn dài nhất có khả năng bị virus sao chép mức 0 là `aa`
có độ dài 2, đoạn dài nhất có khả năng bị virus sao chép mức 1 là `caab` có độ
dài 4.
