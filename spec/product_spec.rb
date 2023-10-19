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

    it 'returns the taxes_perc' do
      expect(product.taxes_perc).to eq(0)
    end

    context 'when product is imported' do
      let(:item) { '1 imported bottle of perfume at 47.50' }

      it 'returns the complete name' do
        expect(product.name).to eq('imported bottle of perfume')
      end

      it 'returns the taxes_perc' do
        expect(product.taxes_perc.round(2)).to eq(0.15)
      end
    end
  end

  describe 'total_taxes' do
    let(:item) { '2 book at 12.49' }

    it 'returns the total_taxes' do
      expect(product.total_taxes).to eq(0)
    end

    context 'when product is imported' do
      let(:item) { '1 imported bottle of perfume at 47.50' }

      it 'returns the total_taxes' do
        expect(product.total_taxes).to eq(7.15)
      end
    end

    context 'when price is round' do
      let(:item) { '1 imported bottle of perfume at 10' }

      it 'returns the total_taxes' do
        expect(product.total_taxes).to eq(1.50)
      end
    end
  end

  describe 'total_price' do
    let(:item) { '2 book at 12.49' }

    it 'returns the total_price' do
      expect(product.total_price).to eq(24.98)
    end

    context 'when product is imported' do
      let(:item) { '1 imported bottle of perfume at 47.50' }

      it 'returns the total_taxes' do
        expect(product.total_price).to eq(54.65)
      end
    end
  end
end
