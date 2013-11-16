class Market
  attr_accessor :id, :name, :address, :city, :county, :state, :zip

  def initialize(market)
    @id = market[0].to_i
    @name = market[1]
    @address = market[2]
    @city = market[3]
    @county = market[4]
    @state = market[5]
    @zip = market[6]
  end

  def self.all
    @all ||= CSV.read('./support/markets.csv').map do |market|
      Market.new(market)
    end
  end

  def self.find(id)
    all.find do |market|
      market.id == id
    end
  end

  def self.find_by_name(name)
    all.find do |market|
      market.name.downcase == name.downcase
    end
  end

  def self.find_all_by_state(state)
    all.select do |market|
      market.state.downcase == state.downcase
    end
  end

  def self.search(search_term)
    all.select do |market|
      market.name.downcase.include?(search_term.downcase)
    end
  end

  def vendors
    Vendor.all.select { |vendor| vendor.market_id == id }
  end

  def products
    vendors.flat_map { |vendor| vendor.products }
  end

  def preferred_vendor(date = nil)
    if date
      date = date.to_s
      vendor_hash = {}
      vendors.each do |vendor| 
        if vendor.revenue(date)
          vendor_hash[vendor] = vendor.revenue(date)
        end
      end
      vendor_hash.max_by { |vendor, revenue| revenue }[0]
    else
      vendors.max_by {|vendor| vendor.revenue}
    end
  end

  def worst_vendor(date = nil)
    if date
      date = date.to_s
      vendor_hash = {}
      vendors.each do |vendor| 
        if vendor.revenue(date)
          vendor_hash[vendor] = vendor.revenue(date)
        end
      end
      vendor_hash.min_by { |vendor, revenue| revenue }[0]
    else
      vendors.min_by {|vendor| vendor.revenue}
    end
  end

  # Accidentally complicated extra method that we can't bear to delete even though it wasn't assigned.
  # This method returns the vendor with the most sales on a given date at a specific market. WHOA.
  def vendor_with_most_sales(date)
    date = date.to_s
    vendor_sales_array = vendors.flat_map { |vendor| vendor.sales }
    vendor_sales_array.select! { |sale| sale.purchase_time == Date.parse(date) }
    vendor_sales_hash = vendor_sales_array.group_by { |sale| sale.vendor_id }
    Vendor.find(vendor_sales_hash.max_by { |vendor, sales| sales.count }[0])
  end
end
