require "ip_range"
require "ip"

describe "ip" do

  it "return the ip direction of the object" do
    ip = "192.168.1.255"

    ip = Ip.new(ip)

    expect(ip.address).to eq("192.168.1.255")
  end

  it "return true if the ip is bigger than the direction send" do
    ip_bigger = "192.168.1.255"
    ip_smaller = "192.168.1.4"

    ip = Ip.new(ip_bigger)
    sol = ip.is_bigger?(ip_smaller)

    expect(sol).to eq(true)
  end

  it "return false if the is smaller than the direction send" do
    ip_bigger = "192.168.1.3"
    ip_smaller = "192.168.1.2"

    ip = Ip.new(ip_smaller)
    sol = ip.is_bigger?(ip_bigger)

    expect(sol).to eq(false)
  end

  it "return false if the is smaller than the direction send" do
    ip_bigger = "192.168.4.3"
    ip_smaller = "192.168.1.10"

    ip = Ip.new(ip_bigger)
    sol = ip.is_bigger?(ip_smaller)

    expect(sol).to eq(true)
  end

end

describe "ip_range" do

  it "return the net address" do
    ip_init = "192.168.1.1"
    mask = "255.255.255.0"

    ip = Ip.new(ip_init,mask)
    sol = ip.net_address()

    expect(sol).to eq([192,168,1,0])
  end

  it "return the first and the last ip address(mask: 255.255.255.0)" do
    ip_init = "192.168.1.1"
    mask = "255.255.255.0"

    ip = Ip.new(ip_init,mask)
    sol = ip.net_range()

    expect(sol).to eq([[192,168,1,1],[192,168,1,255]])
  end

  it "return the first and the last ip address(mask: 255.255.0.0)" do
    ip_init = "192.168.1.1"
    mask = "255.255.0.0"

    ip = Ip.new(ip_init,mask)
    sol = ip.net_range()

    expect(sol).to eq([[192,168,0,1],[192,168,255,255]])
  end

  it "return the first and the last ip address(shorth mask: 24)" do
    ip_init = "192.168.1.1"
    mask = "24"

    ip = Ip.new(ip_init,mask)
    sol = ip.net_range()

    expect(sol).to eq([[192,168,1,1],[192,168,1,255]])
  end

  it "return the first and the last ip address(shorth mask: 16)" do
    ip_init = "192.168.1.1"
    mask = "16"

    ip = Ip.new(ip_init,mask)
    sol = ip.net_range()

    expect(sol).to eq([[192,168,0,1],[192,168,255,255]])
  end
end
