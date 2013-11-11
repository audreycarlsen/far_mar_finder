class Vendor
  attr_accessor :id

  def initialize(array)
    @id = 
  end

  def self.all
    CSV.read("./support/vendors.csv").map do |array|
      Vendor.new(array)
    end
  end
end