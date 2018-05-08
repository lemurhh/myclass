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

def gcd m, n
	return n if m%n==0
	gcd n, m%n
end

def single_root p
  factors = prime_factors p-1
  
  2.upto(p-1) do |g|
    judge = []
    factors.each do |q|
      judge << g**((p-1)/q) % p
    end
    return g if not judge.index(1)
  end
end

def all_roots p
  euler_value = p-1
  g = single_root p
  roots = [g]
  2.upto(euler_value-1) do |d|
    roots << (g**d)%p if gcd(d, euler_value)==1
  end
  roots
end

      
  

