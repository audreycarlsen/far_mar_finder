class Sale
  attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize(array)
    @id = array[0]
    @amount = array[1]
    @purchase_time = array[2]
    @vendor_id = array[3]
    @product_id = array[4]
  end

  def self.all
    CSV.read("../support/sales.csv").map do |array|
      Sale.new(array)
    end
  end
  
  def self.find(id)
    all.find do |sale|
      sale.id == id
    end
  end

  def self.find_by(x, match)
    all.find do |sale|
      sale.x.downcase == match
    end
  end

  def self.find_all_by(x, match)
    all.select do |sale|
      sale.x.downcase == match
    end
  end
  
  def vendor
    Vendor.all.find { |vendor| vendor.id == vendor_id }
  end

  def product
    Product.all.find { |product| product.id == product_id }
  end

  def self.between(beginning_time, end_time)
    all.select { |sale| Time.parse(beginning_time) < Time.parse(sale.purchase_time) && Time.parse(sale.purchase_time) < Time.parse(end_time) }
  end
end