require 'csv'
require 'time'
require_relative 'market'
require_relative 'product'
require_relative 'sale'
require_relative 'vendor'

class FarMarFinder
  
end

finder = FarMarFinder.new
finder.markets
 #=> Market
finder.vendors
 #=> Vendor
finder.products
 #=> Product
finder.sales
 #=> Sale
finder.markets.all
# => [...] Returns all instances of the Market class