class Test::DishesController < ApplicationController
  def index
    render json: example, status: 200
  end

  private

  def example
    [
      {
        id: 'Dish_e736a1d2-133a-4e63-b499-a2f975bff651',
        name: 'bad dishes',
        price: 130,
        section: {
          id: 'Section_9b14a14c-50f8-45b0-9b46-c26f54ab0917',
          name: 'icecream'
        }
      },
      {
        id: 'Dish_95c72e63-b95d-4476-8a0b-4ec002925bae',
        name: 'wery bad bad dish',
        price: 70,
        section: {
          id: 'Section_e8bae025-b25b-47f3-952c-e29efd1c0ac7',
          name: 'fast food'
        }
      },
      {
        id: 'Dish_1f39a0f0-b772-48de-af4e-1086c68a52a9',
        name: 'good dish',
        price: 170,
        section: {
          id: 'Section_1f06b884-cfcb-46a2-b64a-792e52d7c2e4',
          name: 'salad'
        }
      }
    ]
  end
end
