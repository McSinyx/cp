#!/usr/bin/env python3

# Dễ thấy các đèn đổi màu lẻ lần có màu xanh, chẵn lần màu đỏ.
#
# Xét đèn thứ i:
# * Giả sử phân tích i thành các ước nguyên tố: i = p1 ** q1 + ... + pm ** qm,
#   khi đó i sẽ có k = (q1 + 1) * ... * (qm + 1) ước nguyên dương.
# * Đèn thứ i sẽ được đổi màu ở lần bấm công tắc nhận i làm bội, hay sẽ đổi màu
#   k lần.
# * k lẻ khi và chỉ khi q1 + 1, ..., qm + 1 đều lẻ hay q1, ..., qm đều chẵn tức
#   là i là số chính phương.
#
# Vậy kết quả cần tìm là số số chính phương từ 1 đến n.

print(int(int(input()) ** 0.5))
