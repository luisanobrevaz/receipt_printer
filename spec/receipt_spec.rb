require './receipt'
require './product'

RSpec.describe Receipt do
  let(:receipt) { described_class.new }
  let(:items) do
    ['2 book at 12.49',
     '1 music CD at 14.99',
     '1 chocolate bar at 0.85']
  end

  describe 'print_receipt' do
    let(:outputs) do
      "2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 42.32\n"
    end

    it 'prints the receipt' do
      receipt.products = items.map { |item| Product.new(item) }
      expect { receipt.print_receipt }.to output(outputs).to_stdout
    end
  end

  describe 'taxes sum' do
    it 'returns the correct taxes sum' do
      receipt.products = items.map { |item| Product.new(item) }
      expect(receipt.taxes_sum).to eq(1.5)
    end
  end

  describe 'total sum' do
    it 'returns the correct total sum' do
      receipt.products = items.map { |item| Product.new(item) }
      expect(receipt.total_sum).to eq(42.32)
    end
  end
end
