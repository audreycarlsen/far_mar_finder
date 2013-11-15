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
puts finder.vendors.find(1).revenue(("2013-11-10".."2013-11-12"))