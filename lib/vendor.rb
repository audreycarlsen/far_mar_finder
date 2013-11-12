class Vendor
  attr_accessor :id, :name, :num_employees, :market_id

  def initialize(array)
    @id = array[0]
    @name = array[1]
    @num_employees = array[2]
    @market_id = array[3]
  end

  def self.all
    CSV.read('./support/vendors.csv').each.map do |array|
      Vendor.new(array)
    end
  end

  def self.find(id)
    all.find do |vendor|
      vendor.id
    end
  end

  def self.find_by(x, match)
    all.find do |vendor|
      vendor.x.downcase
    end
  end

  def self.find_all_by(x, match)
    all.select do |vendor|
      vendor.x.downcase
    end
  end

  def market
  end

  def products
  end

  def sales
  end

  def revenue
  end
end