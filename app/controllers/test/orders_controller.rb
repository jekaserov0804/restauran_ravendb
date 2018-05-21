class Test::OrdersController < ApplicationController
  def index
    render json: example, status: 200
  end

  private

  def example
    [
      {
        id: 'Order_01b6bff4-37ed-41a5-adf2-05155d443275',
        table_number: 1
      },
      {
        id: 'Order_1f8a88ef-2cc2-4da1-ab95-81c9083c1339',
        table_number: 2
      },
      {
        id: 'Order_ccaa318d-ef07-4e50-9f34-f27c5e58be57',
        table_number: 3
      },
      {
        id: 'Order_82b15549-1773-466a-b6b8-7c1a95ccf03a',
        table_number: 4
      },
      {
        id: 'Order_61c32394-84b4-4c25-bcd2-b7a80497a24e',
        table_number: 5
      },
      {
        id: 'Order_1df48609-dbde-42b2-ad19-79cfe9afe19b',
        table_number: 6
      }
    ]
  end
end
