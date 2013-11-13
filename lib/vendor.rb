class Vendor
  attr_accessor :id, :name, :no_of_employees, :market_id, :revenue

  def initialize(array)
    @id = array[0].to_i
    @name = array[1]
    @no_of_employees = array[2].to_i
    @market_id = array[3].to_i
  end

  def self.all
    @all ||= CSV.read('./support/vendors.csv').each.map do |array|
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

  def self.find_by_name(name)
    all.find do |vendor|
      vendor.name.downcase == name.downcase
    end
  end

  def self.find_all_above_no_of_employees(no_of_employees)
    all.select do |vendor|
      vendor.no_of_employees >= no_of_employees.to_i
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
    @revenue = sales.map { |sale| sale.amount.to_i }.reduce(:+)
  end
end