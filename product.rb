class Product
  attr_accessor :name, :quantity, :base_price, :taxes_perc

  def initialize(item)
    match = item.match(/(.*) at (.*)/)
    item_name = match[1].partition(' ')[2]

    @name = item_name
    @quantity = match[1].scan(/\d+/)[0].to_i
    @base_price =  match[2].to_f
    @taxes_perc =  calculate_taxes
  end

  def total_taxes
    (unit_taxes * quantity).round(2)
  end

  def total_price
    final_price = (base_price + unit_taxes)

    (final_price * quantity).round(2)
  end

  private

  def unit_taxes
    (taxes_perc.round(2) * base_price * 20).ceil.to_f / 20
  end

  def calculate_taxes
    base_tax = free_base_tax ? 0 : 0.1
    imported_products_tax = @name.match(/imported/).nil? ? 0 : 0.05

    imported_products_tax + base_tax
  end

  def free_base_tax
    return true if category == 'books' || category == 'food' || category == 'medical'

    false
  end

  def category
    return 'books' if category?(book_list)
    return 'food' if category?(food_list)
    return 'medical' if category?(medical_list)

    'other'
  end

  def category?(category_list)
    category_list.each do |list_item|
      return true unless @name.match(list_item).nil?

      next
    end
    false
  end

  def food_list
    [/chocolate/, /apple/]
  end

  def book_list
    [/dictionary/, /book/]
  end

  def medical_list
    [/pill/, /syrup/]
  end
end
