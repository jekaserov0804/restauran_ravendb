class Order
  attr_accessor :id, :table_number

  def initialize(table_number = '')
    @id = "Order_#{SecureRandom.uuid}"
    @table_number = table_number
  end

  def serialize
    {
      id: id,
      table_number: table_number
    }
  end
end