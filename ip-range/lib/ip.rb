class Ip

  attr_reader :address

  def initialize(ip, mask = nil)
    @address = ip
    @ip_pos = ip.split(".").map{|n| n.to_i}

    if (mask.to_i>0 && mask.to_i<32)
      @mask = long_mask(mask)
    else
      @mask = mask.split(".").map{|n| n.to_i} if mask != nil
    end
  end

  def is_bigger?(compare_ip)
    if(@ip_pos[2] == compare_ip.split(".")[2].to_i)
      return @ip_pos[3] > compare_ip.split(".")[3].to_i
    else
      return @ip_pos[2] > compare_ip.split(".")[2].to_i
    end
  end

  def net_range()
    user_address = @mask.map{|n| n ^ 255}
    net = net_address()
    first_address = net.clone
    first_address[3] += 1
    last_address = []
    [0,1,2,3].each{|n| last_address[n] = user_address[n] + net[n] }

    [first_address,last_address]
  end

  def net_address()
    net = []
    net[3] = @ip_pos[3] & @mask[3]
    net[2] = @ip_pos[2] & @mask[2]
    net[1] = @ip_pos[1] & @mask[1]
    net[0] = @ip_pos[0] & @mask[0]
    net
  end

  def long_mask(num)
    string_mask = Array.new(num.to_i).fill(1).join('')
    string_mask = string_mask.ljust(32,'0')
    array_mask = /^(\d{8})(\d{8})(\d{8})(\d{8})$/.match(string_mask)

    [array_mask[1].to_i(2),array_mask[2].to_i(2),array_mask[3].to_i(2),array_mask[4].to_i(2)]
  end
end
