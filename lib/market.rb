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
  end

  def self.all
    CSV.read("./support/markets.csv").map do |array|
      Market.new(array)
    end
  end
end