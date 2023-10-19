require './receipt_generator'

file_path = ARGV[0] || 'inputs/input.txt'

receipt = ReceiptGenerator.new
items = receipt.parse_items(file_path)
receipt.generate_receipt(items)
