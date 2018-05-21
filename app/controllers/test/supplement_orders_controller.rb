class Test::SupplementOrdersController < ApplicationController
  def index
    render json: example, status: 200
  end

  private

  def example
    [
      {
        id: 'SupplemetOrder_82576a6f-9294-4a4e-9fb5-bb5275642c30',
        dish_name: 'good dish',
        count: 10,
        dish: {
            id: 'Dish_1f39a0f0-b772-48de-af4e-1086c68a52a9',
          name: 'good dish',
          price: 170
        },
        order: {
          id: 'Order_61c32394-84b4-4c25-bcd2-b7a80497a24e',
          table_number: 5
        }
      },
      {
        id: 'SupplemetOrder_22d50941-176a-454f-81c1-a18e65e53b9f',
        dish_name: 'wery bad bad dish',
        count: 5,
        dish: {
          id: 'Dish_95c72e63-b95d-4476-8a0b-4ec002925bae',
          name: 'wery bad bad dish',
          price: 70
        },
        order: {
          id: 'Order_01b6bff4-37ed-41a5-adf2-05155d443275',
          table_number: 1
        }
      },
      {
        id: 'SupplemetOrder_6e2093b0-6e71-4f85-bc29-367daf4e1e4f',
        dish_name: 'bad dishes',
        count: 2,
        dish: {
          id: 'Dish_e736a1d2-133a-4e63-b499-a2f975bff651',
          name: 'bad dishes',
          price: 130
        },
        order: {
          id: 'Order_ccaa318d-ef07-4e50-9f34-f27c5e58be57',
          table_number: 3
        }
      }
    ]
  end
end
