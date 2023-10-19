require './receipt_generator'

RSpec.describe ReceiptGenerator do
  describe 'generate receipt' do
    let(:receipt_printer) { described_class.new }
    let(:items) do
      ['2 book at 12.49',
       '1 music CD at 14.99',
       '1 chocolate bar at 0.85']
    end

    let(:outputs) do
      "2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: "\
      "1.50\nTotal: 42.32\n"
    end

    shared_examples 'printer' do
      it 'prints the receipt' do
        expect do
          receipt_printer.generate_receipt(items)
        end.to output(outputs).to_stdout
      end
    end

    it_behaves_like 'printer'

    context 'when there are imported goods' do
      let(:items) do
        ['1 imported box of chocolates at 10.00',
         '1 imported bottle of perfume at 47.50']
      end

      let(:outputs) do
        "1 imported box of chocolates: 10.50\n1 imported bottle of perfume: "\
        "54.65\nSales Taxes: 7.65\nTotal: 65.15\n"
      end

      it_behaves_like 'printer'
    end

    context 'when there are imported goods' do
      let(:items) do
        ['1 imported bottle of perfume at 27.99',
         '1 bottle of perfume at 18.99',
         '1 packet of headache pills at 9.75',
         '3 imported boxes of chocolates at 11.25']
      end

      let(:outputs) do
        "1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 "\
        "packet of headache pills: 9.75\n3 imported boxes of chocolates: "\
        "35.55\nSales Taxes: 7.90\nTotal: 98.38\n"
      end

      it_behaves_like 'printer'
    end
  end

  describe 'parse_items' do
    let(:receipt_printer) { described_class.new }
    let(:file_path) { 'spec/support/fixtures/example_input.txt' }
    let(:items_list) do
      ['2 book at 12.49',
       '1 music CD at 14.99',
       '1 chocolate bar at 0.85']
    end

    it 'prints the receipt' do
      expect(receipt_printer.parse_items(file_path))
        .to eq(items_list)
    end
  end
end
