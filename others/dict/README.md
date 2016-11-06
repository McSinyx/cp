# Từ điển

Cho một từ điển, là một danh sách gồm `n` từ `w`. Cho `q` truy vấn, mỗi truy vấn đưa ra
một xâu `s`, yêu cầu đếm xem có bao nhiêu từ có tiền tố là `s`.

## Input

`dict.inp` gồm `n` + `q` + 2 dòng:

* Dòng 1: Gồm một số nguyên là số `n`, số lượng từ của từ điển.
* Dòng 2 đến `n` + 1: Mỗi dòng gồm một xâu kí tự `w` là một từ thuộc từ điển.
* Dòng `n` + 2: Gồm một số nguyên là số `q`, số lượng truy vấn.
* Dòng `n` + 3 đến `n` + `q` + 2: Mỗi dòng gồm một xâu kí tự `s` mô tả một tiền
  tố cần đếm.

## Output

`dict.out` gồm `q` dòng, mỗi dòng gồm một số nguyên là câu trả lời cho
truy vấn tương ứng.

## Giới hạn

* 1 ≤ `n`, `q` ≤ 20000.
* 1 ≤ Độ dài `w`, `s` ≤ 20.
* Các xâu `w`, `s` gồm các chữ cái in thường (từ `a` đến `z`).

## Ví dụ

`dict.inp`:

    4
    banana
    ban
    baconsoi
    alibaba
    4
    ban
    ba
    ali
    baba

`dict.out`:

    2
    3
    1
    0

Giải thích:

* 2 từ có tiền tố `ban` là: `banana`, `ban`.
* 3 từ có tiền tố `ba` là: `banana`, `ban`, `baconsoi`.
* 2 từ có tiền tố `ali` là: `alibaba`.
