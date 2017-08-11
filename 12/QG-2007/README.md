# KÌ THI CHỌN HỌC SINH GIỎI QUỐC GIA THPT NĂM 2007

## Dãy con không giảm dài nhất

Cho dãy số nguyên dương a<sub>1</sub>, a<sub>2</sub>, …, a<sub>n</sub>.

Dãy số a<sub>i</sub>, a<sub>i+1</sub>, …, a<sub>j</sub> thỏa mãn a<sub>i</sub>
≤ a<sub>i+1</sub> ≤ … ≤ a<sub>j</sub> với 1 ≤ i ≤ j ≤ n được gọi là dãy con
không giảm của dãy số đã cho và khi đó số j - i + 1 được gọi là độ dài của dãy
con này. 

### Yêu cầu

Hãy tìm dãy con có độ dài lớn nhất trong số các dãy con không giảm của dãy số
đã cho mà các phần tử của nó đều thuộc dãy số (u<sub>k</sub>) xác định bởi:

* u<sub>1</sub> = 1;
* u<sub>k</sub> = u<sub>k-1</sub> + k (k ≥ 2).

### Dữ liệu

* Dòng đầu tiên chứa một số nguyên dương n (n ≤ 10000);
* Dòng thứ i trong n dòng tiếp theo chứa một số nguyên dương a<sub>i</sub> là
  số hạng thứ i của dãy số đã cho (a<sub>i</sub> ≤ 10<sup>8</sup>, i = 1, 2, …,
  n).

### Kết quả

Số nguyên d là độ dài của dãy con không giảm tìm được (quy ước rằng nếu không
có dãy con nào thỏa mãn điều kiện đặt ra thì d = 0). 

### Ví dụ

|                   MAXISEQ.INP                   | MAXISEQ.OUT |
| ----------------------------------------------- | :---------: |
| 8<br>2<br>2007<br>6<br>6<br>15<br>16<br>3<br>21 |      3      |

#### Giải thích

Các dãy con không giảm của dãy số đã cho mà các phần tử của nó đều thuộc dãy
(u<sub>k</sub>) là: 6, 6, 15 và 3, 21 (vì u<sub>2</sub> = 3, u<sub>3</sub> = 6,
u<sub>5</sub> = 15, u<sub>6</sub> = 21). Dãy cần tìm là 6, 6, 15 có độ dài là
3. 
