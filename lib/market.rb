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

  def vendors
    Vendor.all.select { |vendor| vendor.market_id == id }
  end


  # TODO check for x's validity
end