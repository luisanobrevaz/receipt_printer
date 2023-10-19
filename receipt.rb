class Receipt
  attr_accessor :products

  def print_receipt
    products.map do |p|
      puts "#{p.quantity} #{p.name}: #{format('%.2f', p.total_price)}"
    end
    puts "Sales Taxes: #{format('%.2f', taxes_sum)}"
    puts "Total: #{format('%.2f', total_sum)}"
  end

  def taxes_sum
    products.sum(&:total_taxes).round(2)
  end

  def total_sum
    products.sum(&:total_price).round(2)
  end
end
