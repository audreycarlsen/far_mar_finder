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
end