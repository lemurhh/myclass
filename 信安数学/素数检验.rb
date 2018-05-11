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

def legendre(d,p,flag=0)
  return 0 if d%p==0
  return 1 if d==1
  return (-1)**((p-1)/2) if d==-1
  return legendre(-1,p) * legendre(d.abs, p) if d<-1
  return (-1)**((p**2-1)/8) if d==2
  return legendre(d%p, p) if d>p
  return legendre(p,d)*((-1)**((p-1)*(d-1)/4)) if flag==1
  return prime_factors(d).inject(1) {|product, num| product*legendre(num,p,1)}
end

def solovay n, t
  t.times do
    b = rand(2..n-2)
    r = (b**((n-1)/2)) % n
    if r!=n-1 and r!=1
      return false
    else
      s = legendre(b, n)
      s += n if s==-1
      if r!=s
        return false
      end
    end
  end
  true
end

def divide n
  count = 0
  while n%2==0
    n /= 2
    count += 1
  end
  [count, n]
end

def rabin n, t
  s ,t = divide n-1
  t.times do
    b = rand(2..n-2)
    if (b**t)%n==1
      next
    else
      next if true==0.upto(s-1) {|r| break true if (b**((2**r)*t))%n==n-1}
    end
    return false
  end
  true
end
      
