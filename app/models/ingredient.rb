class Ingredient
  attr_accessor :id, :name, :price, :weight

  def initialize(name = '', price = 0, weight = 0)
    @id = "Ingredient_#{SecureRandom.uuid}"
    @name = name
    @price = price
    @weight = weight
  end

  def serialize
    {
      id: id,
      name: name,
      price: price,
      weight: weight
    }
  end
end