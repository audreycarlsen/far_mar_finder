class Market
  attr_accessor :id, :name, :address, :city, :county, :state, :zip

  def initialize(array)
    @id = ""
    @name = ""
    @address = ""
    @city = ""
    @county = ""
    @state = ""
    @zip = ""
    @market_data = CSV.read('./support/markets.csv')
    @index_hash = {:id => 0, :name => 1, :address => 2, :city => 3, :county => 4, :state => 5, :zip => 6}
  end

  def self.all
    @market_data.each do |array|
      Market.new(array)
    end
  end

  def self.find(id)
    @market_data.find do |array|
      array[0] == id
    end
  end

  def self.find_by(x, match)
    @market_data.find do |array|
      array[@index_hash[x.to_sym]] == /#{match}/i
    end
  end

  def self.find_all_by(x, match)
    @market_data.select do |array|
      array[@index_hash[x.to_sym]] == /#{match}/i
    end
  end

  # TODO check for x's validity
end