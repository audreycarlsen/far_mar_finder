class Product
  attr_accessor :id, :name, :vendor_id

  def initialize(array)
    @id = array[0].to_i
    @name = array[1]
    @vendor_id = array[2].to_i
  end

  def self.all
    CSV.read("./support/products.csv").map do |array|
      Product.new(array)
    end
  end

  def self.find(id)
    all.find do |product|
      product.id == id
    end
  end

  def self.by_market(market)
    all.find do |product|
      product.market_id == market.downcase
    end
  end

  def self.all_by_market(market)
    all.select do |vendor|
      vendor.market_id == market.downcase
    end
  end

  def vendor
    Vendor.all.find { |vendor| vendor.id == vendor_id }
  end

  def sales
    Sale.all.select { |sale| sale.product_id == id }
  end

  def number_of_sales
    sales.count
  end
end