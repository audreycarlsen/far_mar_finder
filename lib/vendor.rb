class Vendor
  attr_accessor :id, :name, :no_of_employees, :market_id

  def initialize(array)
    @id = array[0].to_i
    @name = array[1]
    @no_of_employees = array[2].to_i
    @market_id = array[3].to_i
  end

  def self.all
    @@all ||= CSV.read('./support/vendors.csv').each.map do |array|
      Vendor.new(array)
    end
  end

  def self.find(id)
    all.find do |vendor|
      vendor.id == id
    end
  end

  def self.by_market(market_id)
    all.select do |vendor|
      vendor.market_id == market_id
    end
  end

  # def self.find_by_x(market)
  #   all.select do |vendor|
  #     vendor.market_id == market
  #   end
  # end

  # def self.find_all_by_x(market)
  #   all.select do |vendor|
  #     vendor.market_id == market
  #   end
  # end

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
    sales.map { |sale| sale.amount.to_i }.reduce(:+)
  end
end