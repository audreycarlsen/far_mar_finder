class Vendor
  attr_accessor :id, :name, :num_employees, :market_id

  def initialize(array)
    @id = array[0]
    @name = array[1]
    @num_employees = array[2]
    @market_id = array[3]
  end

  def self.all
    CSV.read('../support/vendors.csv').each.map do |array|
      Vendor.new(array)
    end
  end

  def self.find(id)
    all.find do |vendor|
      vendor.id == id
    end
  end

  def self.find_by(x, match)
    all.find do |vendor|
      vendor.x.downcase == match
    end
  end

  def self.find_all_by(x, match)
    all.select do |vendor|
      vendor.x.downcase == match
    end
  end

  def market
    Market.all.find { |market| market.id == market_id }
  end

  def products
    Product.all.select { |product| product.vendor_id == id }
  end

  def sales
    Sale.all.select { |sale| sale.vendor_id == id }
  end

  def revenue
  end
end