class Product
  attr_accessor :id, :name, :vendor_id

  def initialize(array)
    @id = array[0].to_i
    @name = array[1]
    @vendor_id = array[2].to_i
  end

  def self.all
    @all ||= CSV.read('./support/products.csv').map do |array|
      Product.new(array)
    end
  end

  def self.find(id)
    all.find do |product|
      product.id == id
    end
  end

  def self.by_vendor(vendor_id)
    all.select do |product|
      product.vendor_id == vendor_id
    end
  end

  def self.find_by_name(name)
    all.find do |product|
      product.name.downcase == name.downcase
    end
  end

  def self.find_all_by_type(type)
    all.select do |product|
      product.name.downcase.include?(type.downcase)
    end
  end


  def self.most_revenue(n)
    revenue_hash = {}
    all.each do |product| 
      if !product.revenue.nil?
        revenue_hash[product] = product.revenue 
      end
    end
    revenue_hash.sort_by { |product, revenue| -revenue }.first(n).map(&:first)
  end

  # `best_day` returns a `Date` object with the most sales for the given product using the `Sale` purchase_time
  def best_day
    day_hash = sales.group_by { |sale| sale.purchase_time.to_date }
    day_hash.sort_by { |day, sales| sales.count }.last[0]
  end

  def vendor
    Vendor.all.find { |vendor| vendor.id == vendor_id }
  end

  def sales
    Sale.all.select { |sale| sale.product_id == id }
  end

  def revenue
    sales.map { |sale| sale.amount.to_i }.reduce(:+)
  end

  def number_of_sales
    sales.count
  end
end