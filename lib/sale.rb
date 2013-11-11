class Sale
  attr_accessor :id

  def initialize(array)
    @id = 
  end

  def self.all
    CSV.read("./support/sales.csv").map do |array|
      Sale.new(array)
    end
  end
end