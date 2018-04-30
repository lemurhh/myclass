# coding: utf-8
def gcd2 m, n
	return n if m%n==0
	gcd2 n, m%n
end

def gcd *list
	len = list.size
	g = gcd2(list[0], list[1])

	return g if len==2
	gcd(g, *list[2...len])
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

def get_m(list_m)
	return list_m.inject(1){|product, ele_m| product*ele_m}
end

def get_list_M(list_m)
	m = get_m(list_m)
	return list_m.map{|ele_m| m/ele_m}
end

def get_list_Mi(list_m) #i指inverse
	list_M = get_list_M(list_m)
	list_Mi = []
	list_M.zip(list_m) {|ele_M, ele_m| list_Mi << get_inverse(ele_M, ele_m)}
	return list_Mi
end

def solve_equ_set(list_b, list_m)
	if gcd(*list_m)!=1
		puts "m不两两互素"
		return
	else
		m = get_m(list_m)
		list_M = get_list_M(list_m)
		list_Mi = get_list_Mi(list_m)
		result = 0
		list_b.zip(list_M, list_Mi) {|ele_b, ele_M, ele_Mi| result += ele_b*ele_M*ele_Mi}
		return result%m
	end
end


#b = [2, 3, 2]
#m = [3, 5, 7]
#puts "结果: #{solve_equ_set(b, m)}"

