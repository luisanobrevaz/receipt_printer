require './receipt'
require './product'

class ReceiptPrinter
  def generate_receipt(items_list)
    receipt = Receipt.new
    receipt.products = items_list.map { |item| Product.new(item) }
    receipt.print_receipt
  end

  def parse_items
    file = File.open('input.txt')
    file.readlines.map(&:chomp)
  end
end
