require 'csv'
require 'time'
require_relative 'market'
# ... Require all of the supporting classes

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