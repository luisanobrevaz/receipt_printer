require './receipt'
require './product'

class ReceiptGenerator
  def generate_receipt(items_list)
    receipt = Receipt.new
    receipt.products = items_list.map { |item| Product.new(item) }
    receipt.print_receipt
  end

  def parse_items(file_path)
    file = File.open(file_path)
    file.readlines.map(&:chomp)
  end
end
