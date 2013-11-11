class Vendor
  attr_accessor :id, :name, :num_employees, :market_id

  def initialize(array)
    @id = ""
    @name = ""
    @num_employees = ""
    @market_id = ""
  end

  def self.all
    CSV.read("./support/vendors.csv").map do |array|
      Vendor.new(array)
    end
  end
end