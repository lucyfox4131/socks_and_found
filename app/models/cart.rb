class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_sock(sock_id)
    contents[sock_id.to_s] ||= 0
    contents[sock_id.to_s] += 1
  end

  def total
    contents.values.sum
  end

  def count_of(sock_id)
    contents[sock_id.to_s]
  end

#add a socks method to cart that returns all sock instances within the cart
  def socks
    contents.map {|sock_id, _quantity| Sock.find(sock_id)}
  end

  def total_price
    socks.map do |sock|
      count_of(sock.id) * sock.price.to_f
    end.reduce(:+)
  end
end
