# Các bài tập khác

## Tìm đoạn thẳng v2

Trên 1 đoạn trục số [−c, c], cho N đoạn thẳng, đoạn thứ i là [a<sub>i</sub>,
b<sub>i</sub>].

### Yêu cầu

Cho một điểm M với toạ độ x. Hãy cho biết M thuộc bao nhiêu đoạn thẳng đã cho ở
trên, và cụ thể là những đoạn nào? Nếu M không thuộc đoạn nào trong các đoạn đã
cho, hãy chỉ ra 1 đoạn dài nhất chứa điểm M và không có điểm trong chung với
bất kì đoạn nào trong N đoạn đã cho (không có điểm chung ngoài hai điểm đầu
mút).

### Dữ liệu

Tệp `INTERVAL.INP`:

* Dòng thứ nhất ghi ba số nguyên N, c và x (1 ≤ N ≤ 10<sup>5</sup>; |x| ≤ c ≤
  10<sup>9</sup>).
* N dòng tiếp theo, dòng thứ i + 1 ghi hai số nguyên a<sub>i</sub>,
  b<sub>i</sub> (1 ≤ i ≤ N; |a<sub>i</sub>|, |b<sub>i</sub>| ≤ c).

### Kết quả

Tệp `INTERVAL.OUT`:

* Dòng thứ nhất ghi số tự nhiên K là số đoạn chứa điểm M.
* Dòng thứ hai:
    * Nếu K dương, ghi K số là số thứ tự của K đoạn chứa M.
    * Nếu K = 0, ghi hai số nguyên là toạ độ hai đầu mút của đoạn thẳng dài
      nhất chứa M và không có điểm trong chung với N đoạn đã cho.

### Ví dụ

|             INTERVAL.INP            | INTERVAL.OUT |
| ----------------------------------- | ------------ |
| 4 20 2<br>1 3<br>2 4<br>7 10<br>0 1 |   2<br>1 2   |
| 3 10 5<br>1 2<br>-4 4<br>6 9        |   0<br>4 6   |

## Phân tích số

Lập chương trình nhập vào 2 số nguyên dương n và m.

Tìm số tự nhiên k lớn nhất sao cho n! chia hết cho m<sup>k</sup>.

### Dữ liệu

Tệp `FDP.INP` gồm một dòng ghi hai số nguyên dương n và m (n ≤ 10<sup>18</sup>;
2 ≤ m ≤ 10<sup>12</sup>).

### Kết quả

Tệp `FDP.OUT` gồm một dòng duy nhất ghi số tự nhiên k.

### Ví dụ

| FDP.INP | FDP.OUT |
| :-----: | :-----: |
|  10 10  |    2    |
| 100 15  |   24    |
