# coding: utf-8

class Array
  def + arr
    result = []
    if self.first.class==Fixnum and arr.first.class==Fixnum
      self.zip(arr) do |n1, n2|
        result << n1+n2
      end
    else
      self.zip(arr) do |a1, a2|
        result << a1+a2
      end
    end
    result
  end
  def - arr
    result = []
    if self.first.class==Fixnum and arr.first.class==Fixnum
      self.zip(arr) do |n1, n2|
        result << n1-n2
      end
    else
      self.zip(arr) do |a1, a2|
        result << a1-a2
      end
    end
    result
  end
  def <= arr
    self.zip(arr) do |n1, n2|
      return false if n1>n2
    end
    true
  end
end

$avaliable = [1,6,2,2]
$max = [[7,5,3], [3,2,2], [9,0,2], [2,2,2], [4,3,3]]
$allocation = [[0,0,3,2], [1,0,0,0], [1,3,5,4], [0,3,3,2], [0,0,1,4]]
$need = [[0,0,1,2], [1,7,5,0], [2,3,5,6], [0,6,5,2], [0,6,5,6]]

def is_safe?(avaliable, allocation, need)
  pidn = need.size
  work = Array.new(avaliable)
  finish = Array.new(pidn, false)
  safe_seq = []
  pidn.times do
    pidn.times do |pid|
      if finish[pid]==false and need[pid] <= work
        answer = [work]
        work += allocation[pid]
        answer.push(need[pid], allocation[pid], work)
        p answer
        finish[pid] = true
        safe_seq << pid
      end
    end
  end
  
  [not(finish.index(false)), safe_seq]
end

def bank(avaliable, allocation, need, request)
  pid = request.first
  request.shift
  if not request <= need[pid]
    puts "\033[31m[-] pid: #{pid} request: #{request} 请求超过最大值\e[0m"
    puts
    return
  elsif not request <= avaliable
    puts "\033[31m[-] pid: #{pid} request: #{request} avaliable: #{avaliable} 暂无足够资源进行分配\e[0m"
    puts
    return
  else
    avaliable_new = avaliable - request
    allocation_new = Array.new(allocation)
    allocation_new[pid] = allocation[pid] + request
    need_new = Array.new(need)
    need_new[pid] = need[pid] - request
    state, safe_seq = is_safe?(avaliable_new, allocation_new, need_new)
    if state
      $avaliable, $allocation, $need = avaliable_new, allocation_new, need_new
      puts "\033[32m[+] pid: #{pid} request: #{request} 安全序列: #{safe_seq}\e[0m"
      puts
    else
      puts "\033[31m[-] pid: #{pid} request: #{request} 不安全状态\e[0m"
      puts
    end
  end
end

bank($avaliable, $allocation, $need, [0,0,0,0,0])
bank($avaliable, $allocation, $need, [2,1,2,2,2])
