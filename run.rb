require './receipt_printer'

receipt = ReceiptPrinter.new
items = receipt.parse_items
receipt.generate_receipt(items)
