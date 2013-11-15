class Vendor
  attr_accessor :id, :name, :no_of_employees, :market_id

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
    sales.map { |sale| sale.amount.to_i }.reduce(:+)
  end

  # `self.most_items(n)` returns the top n vendor instances ranked by total number of items sold
  def self.most_items(n)
    vendor_hash = Sale.all.group_by { |sale| sale.vendor_id}
    vendor_id_array = vendor_hash.sort_by { |vendor, items| -items.count}.take(n).map(&:first)
    vendor_id_array.map { |id| find(id) }
  end

  # TODO Fix this method
  # `revenue(range_of_dates)` returns the total revenue for that vendor across several dates
  def revenue_between_dates(range)
    Sale.between(range.first.to_date, range.last.to_date).map { |vendor| vendor.revenue }
  end



  # def revenue(options = {})
  #   date_max = sales.map {|sale| sale.purchase_time}.max
  #   date_min = sales.map {|sale| sale.purchase_time}.min
  #   date = options[:date] || (date_min..date_max)

  #   date.map do |date| 
  #   sales.map { |sale| sale.amount.to_i }.reduce(:+)
  # end
end