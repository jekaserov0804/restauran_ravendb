class Test::IngredientsController < ApplicationController
  def index
    render json: example, status: 200
  end

  private

  def example
    [
      {
        id: 'Ingredient_95d56f35-543f-40bf-ae41-8523f9ac4343',
        name: 'test',
        price: 45,
        weight: 1
      },
      {
        id: 'Ingredient_82a95dd6-6c57-4de9-ba92-3acbf61bc45e',
        name: 'tomato',
        price: 100,
        weight: 1.5
      },
      {
        id: 'Ingredient_d05e2094-0591-488a-b749-53de41d6554b',
        name: 'potato',
        price: 20,
        weight: 2
      },
      {
        id: 'Ingredient_93c68bca-de78-499c-8701-aee66d98703c',
        name: 'meat',
        price: 150,
        weight: 1
      }
    ]
  end
end
