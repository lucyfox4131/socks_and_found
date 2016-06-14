class SockPresenter
  attr_reader :template

  def initialize(sock, template)
    @sock = sock
    @template = template
  end

  def retired
    if @sock.retired
      "Item Retired"
    else
      template.button_to("Add to Cart", "/cart_socks",
                         params: { sock_id: @sock.id })
    end
  end
end
