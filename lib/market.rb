require 'csv'
require_relative "vendor"

class Market
  attr_accessor :id, :name, :address, :city, :county, :state, :zip

  def initialize(market)
    @id = market[0]
    @name = market[1]
    @address = market[2]
    @city = market[3]
    @county = market[4]
    @state = market[5]
    @zip = market[6]
  end

  def self.all
    CSV.read('../support/markets.csv').map do |market|
      Market.new(market)
    end
  end

  def self.find(id)
    all.find do |market|
      market.id == id
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
    Vendor.all.select { |vendor| vendor.market_id == id }.each { |vendor| [].push(vendor.name)}
  end


  # TODO check for x's validity
end

market5 = Market.find("5")
puts market5
market5.vendors