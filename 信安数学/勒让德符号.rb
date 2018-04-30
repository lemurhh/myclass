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

d = [13,30,71,-35,-23,7,-105,91,-70,-286,46]
p = [47,53,73,97,131,223,223,563,571,647,23]
d.zip(p) {|dd,pp| puts legendre(dd,pp)}
