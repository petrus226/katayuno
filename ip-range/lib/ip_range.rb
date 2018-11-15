require "ip"

class IpRange
  def initialize(ip_to,ip_from)
    @ip_to = Ip.new(ip_to)
    @ip_from = Ip.new(ip_from)
  end

  def order
    return [@ip_from.address, @ip_to.address] if  @ip_to.is_bigger?(@ip_from.address)
    return [@ip_to.address, @ip_from.address]
  end

end
