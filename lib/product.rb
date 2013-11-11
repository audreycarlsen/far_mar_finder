class Product
  attr_accessor :id, :food, :price

  def initialize(array)
    @id = ""
    @food = ""
    @price = ""
  end

  def self.all
    CSV.read("./support/products.csv").map do |array|
      Product.new(array)
    end
  end
end