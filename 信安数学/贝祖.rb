=begin
s_j_1 : S_(j-1)
s_j_p1 : S_(j+1)
=end

#设置初始值
j = -1
s_j, s_j_1 = 0, 1
t_j, t_j_1 = 1, 0
print "Input two numbers: "
r_j_1 = gets.chomp.to_i
r_j = gets.chomp.to_i
q_j_p1 = r_j_1 / r_j
r_j_p1 = -q_j_p1 * r_j + r_j_1
p [j,s_j,t_j,q_j_p1,r_j_p1]

while r_j_p1!=0
	j+=1
	#更新
	s_j_2, s_j_1 = s_j_1, s_j
	t_j_2, t_j_1 = t_j_1, t_j
	q_j = q_j_p1
	r_j_1, r_j = r_j, r_j_p1
	#迭代
	s_j = -q_j * s_j_1 + s_j_2
	t_j = -q_j * t_j_1 + t_j_2
	q_j_p1 = r_j_1 / r_j
	r_j_p1 = -q_j_p1 * r_j + r_j_1
	#输出
	p [j, s_j, t_j, q_j_p1, r_j_p1]
end

