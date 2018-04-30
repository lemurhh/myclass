# coding: utf-8
require './孙子定理.rb'

def prime_factors n 
	return [] if n < 2	
	factors = []
	i = 2
	while i <= n
		while n % i == 0
			n = n / i
			factors << i
		end
		i += 1
	end
	factors
end

def get_b_list(*pk_result) #Ex: get_b_list([1,2],[3,4],[5,6]) -> [1,3,5],[1,3,6],[1,4,5],[1,4,6],[2,3,5],[2,3,6],,[2,4,5],[2,4,6]
	if pk_result.size == 2
		b_list = []
		first_pk_result = pk_result[0]
		second_pk_result = pk_result[1]
		first_pk_result.size.times do |i|
			second_pk_result.size.times do |j|
				b_list << [first_pk_result[i],second_pk_result[j]]
			end
		end
		return b_list
	else
		old_b_list = get_b_list(*pk_result[1...pk_result.size])
		new_b_list = []
		first_pk_result = pk_result[0]
		first_pk_result.size.times do |i|
			old_b_list.size.times do |j|
				new_b_list << Array.new(old_b_list[j]) #建立old_b_list的副本
				new_b_list[new_b_list.size-1].unshift(first_pk_result[i])
			end
		end
		return new_b_list
	end
end

def get_poly_value(coefficient, degree, x)
  result = 0
  coefficient.zip(degree) do |coe, deg|
    result+=coe*(x**deg)
  end
  result
end

def get_poly_deri(coefficient, degree)
  degn, coen = [], []
  coefficient.size.times do |i|
    next if degree[i]==0
    degn << degree[i]-1
    coen << coefficient[i]*degree[i]
  end
  return coen, degn
end

def get_deri_inverse(coefficient, degree, x1, p)
  coe_deri, deg_deri = get_poly_deri(coefficient, degree)
  get_inverse(get_poly_value(coe_deri, deg_deri, x1), p)
end

def solve_core(k, coefficient, degree, x1, p, inverse)
  if k==2
    deri = get_poly_deri(coefficient, degree)
    t1 = (-get_poly_value(coefficient, degree, x1) / p * inverse)%p
    return (x1+t1*p)%(p**2)
  else
    result = solve_core(k-1, coefficient, degree, x1, p, inverse)
    t = (-get_poly_value(coefficient, degree, result) / (p**(k-1)) * inverse)%p
    return result+t*(p**(k-1))%(p**k)
  end
end

def get_x1_list(coefficient, degree, p)
  x1_list = []
  p.times do |i|
    x1_list << i if get_poly_value(coefficient, degree, i) % p == 0
  end
  x1_list
end

def solve_pk(coefficient, degree, p, k)
  pk_result = []
  x1_list = get_x1_list(coefficient, degree, p)
  x1_list.each do |x1|
    inverse = get_deri_inverse(coefficient, degree, x1, p)
    pk_result << solve_core(k, coefficient, degree, x1, p, inverse)
  end
  pk_result
end

def get_m_divide(m) #得到m的标准分解式，素因数存储到prime, 对应的次数存储到degree
  prime = prime_factors m
  degree = prime.uniq.map {|pri| prime.count pri}
  prime.uniq!
  [prime,degree]
end

def trans_poly_to_pks(coefficient, degree, m)
  pk_result = []
  p_list ,k_list = get_m_divide m
  p_list.zip(k_list) do |p, k|
    if k==1
      pk_result << get_x1_list(coefficient, degree, p)
    else
      pk_result << solve_pk(coefficient, degree, p, k)
    end
  end
  pk_result
end

def pks_to_equ_set_and_solve(coefficient, degree, m)
  pk_result = trans_poly_to_pks(coefficient, degree, m)
  p_list, k_list = get_m_divide m
  m_list = []
  p_list.zip(k_list) do |p, k|
    m_list << p**k
  end
  
  result = []
  if pk_result.size==1
    return pk_result.first
  else
    b_list = get_b_list(*pk_result)
    b_list.each do |b|
      result << solve_equ_set(b, m_list)
    end
    return result
  end
end
  
  

coefficient = [3,4,2,1,1,1,12,1]
degree = [14,13,11,9,6,3,2,1]
m=5

p "P120, 3.4.5: #{pks_to_equ_set_and_solve(coefficient, degree, m)}"

coefficient = [1,2,8,9]
degree = [4,3,1,0]
m = 35
p "P110, 3.3.1: #{pks_to_equ_set_and_solve(coefficient, degree, m)}"
