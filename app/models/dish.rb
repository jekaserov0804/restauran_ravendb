class Dish
  attr_accessor :id, :name, :section_id, :price

  def initialize(name = '', section_id = 0, price = 0)
    @id = "Dish_#{SecureRandom.uuid}"
    @name = name
    @section_id = section_id
    @price = price
  end

  def serialize
    {
      id: id,
      name: name,
      price: price,
      section: {
        id: section_id.id,
        name: section_id.name
      }
    }
  end
end
