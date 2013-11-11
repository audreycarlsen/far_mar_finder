class Product
  attr_accessor :id, :name, :vendor_id

  def initialize(array)
    @id = ""
    @name = ""
    @vendor_id = ""
  end

  def self.all
    CSV.read("./support/products.csv").map do |array|
      Product.new(array)
    end
  end
end