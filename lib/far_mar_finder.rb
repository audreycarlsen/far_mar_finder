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
puts finder.sales.between('2011-03-30 02:47:56 -0700', '2012-01-27 17:30:41 -0800').inspect