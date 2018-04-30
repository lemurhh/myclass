=begin
--prime_factors: 求n的标准分解式包含的素因子
--euler: 求n的欧拉函数值
--uncongruential?: 判断list内的数字是否与模m两两不同余
--gcd: 最大公因数
--rela_prime?: 判断list内的数是否与m互素
--resuide?: 判断list是否为模m的完全剩余系
--simple_resuide?: 判断list是否为模m的简化剩余系
=end
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
	factors.uniq!
	factors
end

def euler n
	prm_facts = prime_factors n
	(n * prm_facts.inject(1) {|product, prime| product *= Rational(prime-1, prime)}).to_i
end

def uncongruential? mod, list
	bucket = Array.new(mod, 0)
	list.each{|num| bucket[num%mod]+=1}
	if bucket.find{|count| break true if count>=2}
		false
	else
		true
	end
end

def gcd m, n
	return m if n==0
	gcd(n, m%n)
end

def rela_prime? mod, list
	list.each do |num|
		return false if gcd(num, mod)!=1
	end
	true
end

def resuide? mod, list
	if list.size==mod and uncongruential?(mod, list)
		true
	else
		false
	end
end

def simple_resiude? mod, list
	if list.size==euler(mod) and uncongruential?(mod, list) and rela_prime?(mod, list)
		true
	else
		false
	end
end
