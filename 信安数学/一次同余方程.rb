def gcd m,n
	return n if m%n==0
	gcd n, m%n
end

def num_solus a, b, m
	g = gcd a, m
	if b%g==0
		return g
	else
		return 0
	end
end
def get_inverse a, m

j = -1
s_j, s_j_1 = 0, 1
t_j, t_j_1 = 1, 0

r_j_1 = a
r_j = m
q_j_p1 = r_j_1 / r_j
r_j_p1 = -q_j_p1 * r_j + r_j_1

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

end
return (s_j % m).abs
end

def get_x0 a, m
	g = gcd(a, m)
	return get_inverse(a/g, m/g)
end

def get_x1 a, b, m
	g = gcd a, m
	x0 = get_x0 a, m
	return (b / g * x0) % (m / g)
end

def get_all a, b, m
	num = num_solus a, b, m
	g = gcd(a, m)
	solus = []
	if num==0
		puts "No Solutions"
		return solus 
	else
		x1 = get_x1(a, b, m)
		num.times do |t|
			solus <<  x1 + t * m/g
		end
	end
	return solus
end


