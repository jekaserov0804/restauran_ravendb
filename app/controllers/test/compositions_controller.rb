class Test::CompositionsController < ApplicationController
  def index
    render json: example, status: 200
  end

  private

  def example
    [
      {
        id: 'Composition_398613a2-03ad-41e8-85e1-b38e07494b28',
        ingredient_name: 'meat',
        count: 2,
        weight: 0.7,
        dish: {
          id: 'Dish_1f39a0f0-b772-48de-af4e-1086c68a52a9',
          name: 'good dish',
          price: 170
        },
        ingredient: {
          id: 'Ingredient_93c68bca-de78-499c-8701-aee66d98703c',
          name: 'meat',
          price: 150,
          weight: 1
        }
      },
      {
        id: 'Composition_b22312e4-ce40-4cc0-9f5e-89d2b5b84cd4',
        ingredient_name: 'potato',
        count: 5,
        weight: 0.6,
        dish: {
          id: 'Dish_95c72e63-b95d-4476-8a0b-4ec002925bae',
          name: 'wery bad bad dish',
          price: 70
        },
        ingredient: {
          id: 'Ingredient_d05e2094-0591-488a-b749-53de41d6554b',
          name: 'potato',
          price: 20,
          weight: 2
        }
      },
      {
        id: 'Composition_5d3f3064-f6a3-4a60-ab40-75b0a3758981',
        ingredient_name: 'test',
        count: 100,
        weight: 22,
        dish: {
          id: 'Dish_e736a1d2-133a-4e63-b499-a2f975bff651',
          name: 'bad dishes',
          price: 130
        },
        ingredient: {
          id: 'Ingredient_95d56f35-543f-40bf-ae41-8523f9ac4343',
          name: 'test',
          price: 45,
          weight: 1
        }
      }
    ]
  end
end
