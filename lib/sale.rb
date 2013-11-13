class Sale
  attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize(array)
    @id = array[0].to_i
    @amount = array[1].to_i
    @purchase_time = Time.parse(array[2])
    @vendor_id = array[3].to_i
    @product_id = array[4].to_i
  end

  def self.all
    @all ||= CSV.read('./support/sales.csv').map do |array|
      Sale.new(array)
    end
  end
  
  def self.find(id)
    all.find do |sale|
      sale.id == id
    end
  end

  def self.find_by_amount(amount)
    all.find do |sales|
      sales.amount == amount.to_i
    end
  end

  def self.find_all_above_amount(amount)
    all.select do |sales|
      sales.amount >= amount.to_i
    end
  end
  
  def vendor
    Vendor.all.find { |vendor| vendor.id == vendor_id }
  end

  def product
    Product.all.find { |product| product.id == product_id }
  end

  def self.between(beginning_time, end_time)
    all.select { |sale| Time.parse(beginning_time) < sale.purchase_time && sale.purchase_time < Time.parse(end_time) }
  end
end