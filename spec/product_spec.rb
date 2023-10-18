require './product'

RSpec.describe Product do
  let(:product) { described_class.new(item) }

  describe 'init' do
    let(:item) { '2 book at 12.49' }

    it 'returns the name' do
      expect(product.name).to eq('book')
    end

    it 'returns the quantity' do
      expect(product.quantity).to eq(2)
    end

    it 'returns the base_price' do
      expect(product.base_price).to eq(12.49)
    end

    context 'when product is imported' do
      let(:item) { '1 imported bottle of perfume at 47.50' }

      it 'returns the complete name' do
        expect(product.name).to eq('imported bottle of perfume')
      end
    end
  end
end