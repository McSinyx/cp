# ĐỀ KIỂM TRA LỚP 10 TIN

Trường ĐHSP Hà Nội - Trường THPT Chuyên

Môn thi: Tin học - Ngày 01/10/2015

Thời gian làm bài: 180 phút

## TỔNG QUAN VỀ ĐỀ THI

Bài | Tên file bài làm | Giới hạn mỗi test | Điểm
--- | ---------------- | ----------------- | ----
1   | `NEGPAIRS.*`     | 0.5 giây          | 100
2   | `DCOUNT.*`       | 0.5 giây          | 100
3   | `SUMAVR.*`       | 0.5 giây          | 100
4   | `ZPAIRS.*`       | 0.5 giây          | 100
5   | `HAMMING.*`      | 0.5 giây          | 100

Phần mở rộng `*` là PAS hay CPP tùy theo ngôn ngữ và môi trường lập trình (Free
Pascal hay CodeBlock).

## Bài 1. CẶP SỐ ĐỐI NHAU (NEGPAIRS.*)

Cho dãy số nguyên A = (a<sub>1</sub>, a<sub>2</sub>, ..., a<sub>n</sub>). Hãy
cho biết có bao nhiêu cặp chỉ số (i, j) trong đó i ≠ j thỏa mãn a<sub>i</sub> =
−a<sub>j</sub>

**Dữ liệu:** Vào từ thiết bị nhập chuẩn:

* Dòng 1 chứa số nguyên dương n ≤ 10<sup>6</sup>
* Dòng 2 chứa n số nguyên a<sub>1</sub>, a<sub>2</sub>, ..., a<sub>n</sub> cách
  nhau bởi dấu cách (∀i: |a<sub>i</sub>| ≤ 100)

**Kết quả:** Ghi ra thiết bị xuất chuẩn một số nguyên duy nhất là số cặp i ≠ j
thỏa mãn a<sub>i</sub> = −a<sub>j</sub>.

**Ví dụ:**

Sample Input              | Sample Output
------------------------- | -------------
9<br>-3 -2 -1 0 9 0 1 2 3 | 4
6<br>0 0 0 0              | 6

## Bài 2. THỐNG KÊ (DCOUNT.*)

Cho dãy số nguyên không âm A = (a<sub>1</sub>, a<sub>2</sub>, ...,
a<sub>n</sub>) gồm n phần tử.

**Yêu cầu:** Hãy đếm số lượng các giá trị khác nhau có trong dãy A và đưa ra số
lần xuất hiện của phần tử xuất hiện nhiều nhất?

**Dữ liệu:** Vào từ thiết bị nhập chuẩn

* Dòng đầu ghi số n (n ≤ 10<sup>6</sup>)
* Dòng tiếp theo gồm n số là các phần tử của dãy A, (0 ≤ a<sub>i</sub> ≤
  10<sup>6</sup>)

**Kết quả:** Ghi ra thiết bị xuất chuẩn gồm 2 số k và t: k là số lượng các giá
trị khác nhau và t là số lần xuất hiện của phần tử xuất hiện nhiều nhất trong
dãy đã cho.

**Ví dụ:**

Sample Input            | Sample Output
----------------------- | -------------
8<br>11 2 13 4 50 2 2 3 | 6 3

*Giải thích: có 6 giá trị khác nhau trong dãy là 2, 3, 4, 11, 13 và 50, số 2
xuất hiện nhiều nhất là 3 lần.*

## Bài 3. TRUNG BÌNH CỘNG (SUMAVR.*)

Cho dãy số nguyên B = (b<sub>1</sub>, b<sub>2</sub>, ..., b<sub>n</sub>), hãy
tìm dãy số nguyên A = (a<sub>1</sub>, a<sub>2</sub>, ..., a<sub>n</sub>) sao
cho ∀i: 1 ≤ i ≤ n trung bình cộng của i phần tử đầu tiên trong dãy A đúng bằng
b<sub>i</sub>:

a<sub>1</sub> + a<sub>2</sub> + ... + a<sub>n</sub> = b<sub>i</sub> x i, ∀i =
1, 2, ..., n

**Dữ liệu:** Vào từ thiết bị nhập chuẩn:

* Dòng 1 chứa số nguyên dương n ≤ 10<sup>5</sup>
* Dòng 2 chứa n số nguyên b<sub>1</sub>, b<sub>2</sub>, ..., b<sub>n</sub> cách
  nhau bởi dấu cách (∀i: |b<sub>i</sub>| ≤ 10<sup>9</sup>)

**Kết quả:** Ghi ra thiết bị xuất chuẩn n số a<sub>1</sub>, a<sub>2</sub>, ...,
a<sub>n</sub> theo đúng thứ tự cách nhau bởi dấu cách.

**Ví dụ:**

Sample Input   | Sample Output
-------------- | -------------
5<br>1 2 2 3 4 | 1 3 2 6 8

## Bài 4. GHÉP CẶP (ZPAIRS.*)

Cho hai dãy số A = (a<sub>1</sub>, a<sub>2</sub>, ..., a<sub>n</sub>) và dãy số
B = (b<sub>1</sub>, b<sub>2</sub>, ..., b<sub>n</sub>) đã được sắp theo thứ tự
không giảm.

Một phép ghép cặp là phép lấy một phần tử a<sub>i</sub> của dãy A và một phần
tử b<sub>j</sub> của dãy B thành một cặp (a<sub>i</sub>, b<sub>j</sub>). Chi
phí của cặp này được tính bằng |a<sub>i</sub> − b<sub>j</sub>|.

**Yêu cầu:** Tính xem có thể ghép tối đa được bao nhiêu cặp sao cho tổng chi
phí của các cặp = 0. Biết rằng, mỗi phần tử trong A cũng như trong B chỉ được
ghép vào một cặp duy nhất.

**Dữ liệu:** Vào từ thiết bị nhập chuẩn:

* Dòng 1: 2 số n, m lần lượt là số phần tử của dãy A, B (n, m ≤ 10<sup>5</sup>).
* Dòng 2: gồm n số nguyên sắp theo thứ tự không giảm là dãy A = (a<sub>1</sub>,
  a<sub>2</sub>, ..., a<sub>n</sub>), |a<sub>i</sub>| ≤ 10<sup>9</sup>.
* Dòng 3: gồm m số nguyên sắp theo thứ tự không giảm là dãy B =
  ,(b<sub>1</sub>, b<sub>2</sub>, ..., b<sub>n</sub>) |b<sub>i</sub>| ≤
  10<sup>9</sup>.

**Kết quả:** Ghi ra thiết bị xuất chuẩn gồm duy nhất một số k là số cặp ghép
lớn nhất tìm được thỏa mãn yêu cầu đề bài.

**Ví dụ:**

Sample Input                | Sample Output
--------------------------- | -------------
4 5<br>1 2 2 3<br>2 3 5 5 5 | 2

## Bài 5. DÃY SỐ HAMMING (HAMMING.*)

Dãy số nguyên dương tăng dần trong đó, phần tử đầu tiên là a<sub>1</sub> = 1,
các phần tử tiếp theo có ước nguyên tố của mỗi số không quá 5 được gọi là dãy
hamming. Như vậy, 10 = 2 x 5 sẽ là một số trong hãy Hamming, còn 26 = 2 x 13
không thuộc dãy hamming.

Phần đầu của dãy Hamming là: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15, ...

**Yêu cầu:** Cho một dãy gồm n số nguyên a<sub>1</sub>, a<sub>2</sub>, ...,
a<sub>n</sub> (a<sub>i</sub> ≤ 10<sup>9</sup>). Với mỗi số a<sub>i</sub> hãy
kiểm tra xem nó có thuộc dãy số Hamming?

**Dữ liệu:** Vào từ thiết bị nhập chuẩn:
* Dòng đầu là số n (n ≤ 10<sup>5</sup>)
* n dòng tiếp theo, mỗi dòng ghi một số nguyên của dãy a<sub>1</sub>,
  a<sub>2</sub>, ..., a<sub>n</sub> (a<sub>i</sub> ≤ 10<sup>9</sup>).

**Kết quả:** Ghi ra thiết bị xuất chuẩn gồm n dòng mỗi dòng gồm YES hoặc NO
tương ứng với mỗi số a<sub>i</sub> có/không thuộc dãy Hamming.

**Ví dụ:**

Sample Input | Sample Output
------------ | -------------
11           | YES
1            | YES
2            | YES
6            | NO
7            | YES
8            | YES
9            | YES
10           | NO
11           | YES
12           | NO
13           | NO
14           |
