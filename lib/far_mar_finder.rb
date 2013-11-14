require 'benchmark'
require 'csv'
require 'time'
require_relative 'market'
require_relative 'product'
require_relative 'sale'
require_relative 'vendor'

class FarMarFinder
  def initialize
  end

  def markets
    Market
  end

  def vendors
    Vendor
  end

  def products
    Product
  end

  def sales
    Sale
  end
end


finder = FarMarFinder.new
<<<<<<< HEAD
puts finder.products.most_revenue(5)
=======
puts finder.vendors.most_items(5)
>>>>>>> d6dc73398d06017f187d22735444b66534700f8c
