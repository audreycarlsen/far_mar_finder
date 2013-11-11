class Sale
  attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize(array)
    @id = ""
    @amount = ""
    @purchase_time = ""
    @vendor_id = ""
    @product_id = ""
  end

  def self.all
    CSV.read("./support/sales.csv").map do |array|
      Sale.new(array)
    end
  end
end