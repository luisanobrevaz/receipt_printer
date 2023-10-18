class Product
  attr_accessor :name, :quantity, :base_price

  def initialize(item)
    match = item.match(/(.*) at (.*)/)
    item_name = match[1].partition(' ')[2]

    @name = item_name
    @quantity = match[1].scan(/\d+/)[0].to_i
    @base_price =  match[2].to_f
  end
end
