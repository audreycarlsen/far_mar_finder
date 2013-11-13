class Product
  attr_accessor :id, :name, :vendor_id

  def initialize(array)
    @id = array[0].to_i
    @name = array[1]
    @vendor_id = array[2].to_i
  end

  def self.all
    @@all ||= CSV.read('./support/products.csv').map do |array|
      Product.new(array)
    end
  end

  def self.find(id)
    all.find do |product|
      product.id == id
    end
  end

  def self.by_vendor(vendor_id)
    all.select do |product|
      product.vendor_id == vendor_id
    end
  end

  # def self.find_by_x
  # end

  # def self.all_by_x(vendor)
  #   all.select do |product|
  #     product.vendor_id == vendor
  #   end
  # end

  def vendor
    Vendor.all.find { |vendor| vendor.id == vendor_id }
  end

  def sales
    Sale.all.select { |sale| sale.product_id == id }
  end

  def number_of_sales
    sales.count
  end
end