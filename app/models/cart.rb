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

  def socks
    contents.map { |sock_id, _quantity| Sock.find(sock_id) }
  end

  def total_price
    socks.map do |sock|
      count_of(sock.id) * sock.price.to_f.round(2)
    end.reduce(:+)
  end

  def create_order(current_user)
    current_user.orders.create(status: "ordered")
  end

  def remove_sock(sock_id)
    contents.delete_if { |id, _quantity| id == sock_id.to_s }
  end

  def update_quantity(id, direction)
    if direction == "plus"
      contents[id.to_s] += 1
    elsif direction == "minus" && one?(id)
      remove_sock(id)
    else
      contents[id.to_s] -= 1
    end
  end

  def one?(id)
    contents[id.to_s] == 1
  end
end
