class SupplementOrder
  attr_accessor :id, :dish_id, :dish_name, :count, :order_id

  def initialize(order_id = 0, dish_id = 0, dish_name = '', count = 0)
    @id = "SupplemetOrder_#{SecureRandom.uuid}"
    @order_id = order_id
    @dish_id = dish_id
    @dish_name = dish_name
    @count = count
  end

  def serialize
    {
      id: id,
      dish_name: dish_name,
      count: count,
      dish: {
        id: dish_id.id,
        name: dish_id.name,
        price: dish_id.price
      },
      order: {
        id: order_id.id,
        table_number: order_id.table_number
      }
    }
  end
end