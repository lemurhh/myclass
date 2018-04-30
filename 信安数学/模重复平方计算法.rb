=begin
模重复平方计算法
=end
def mod_repeat_remainder b, n, m
a_k = 1
b_k_p1 = b
n = n.to_s(2).reverse! #将指数n写为二进制形式
n.size.times do |i|
	a_k_1 , b_k = a_k, b_k_p1
	a_k = (a_k_1 * (b_k ** (n[i].to_i))) % m #迭代a
	b_k_p1 = (b_k ** 2) % m #迭代b
	p [a_k, b_k_p1]
end
puts a_k
end

