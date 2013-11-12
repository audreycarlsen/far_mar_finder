class Market
  attr_accessor :id, :name, :address, :city, :county, :state, :zip

  def initialize(array)
    @id = array[0]
    @name = array[1]
    @address = array[2]
    @city = array[3]
    @county = array[4]
    @state = array[5]
    @zip = array[6]
  end

  def self.all
    CSV.read('./support/markets.csv').each.map do |array|
      Market.new(array)
    end
  end

  def self.find(id)
    all.find do |market|
      market.id
    end
  end

  def self.find_by(x, match)
    all.find do |market|
      market.x.downcase
    end
  end

  def self.find_all_by(x, match)
    all.select do |market|
      market.x.downcase
    end
  end

  def vendors

  end

  # TODO check for x's validity
end