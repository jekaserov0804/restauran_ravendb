class Composition
  attr_accessor :id, :dish_id, :ingredient_name, :count, :weight, :ingredient_id, :price

  def initialize(dish_id = 0, ingredient_name = '', count = 0, weight = 0, ingredient_id = 0, price = 0)
    @id = "Composition_#{SecureRandom.uuid}"
    @dish_id = dish_id
    @ingredient_name = ingredient_name
    @count = count
    @weight = weight
    @ingredient_id = ingredient_id
    @price = price
  end

  def serialize
    {
      id: id,
      ingredient_name: ingredient_name,
      count: count,
      weight: weight,
      dish: {
        id: dish_id.id,
        name: dish_id.name,
        price: dish_id.price
      },
      ingredient: {
        id: ingredient_id.id,
        name: ingredient_id.name,
        price: ingredient_id.price,
        weight: ingredient_id.weight
      }
    }
  end
end