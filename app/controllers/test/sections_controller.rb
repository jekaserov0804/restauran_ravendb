class Test::SectionsController < ApplicationController
  def index
    render json: example, status: 200
  end

  private

  def example
    [
      {
        id: 'Section_1f06b884-cfcb-46a2-b64a-792e52d7c2e4',
        name: 'salad'
      },
      {
        id: 'Section_1d9495a1-ac33-490b-b62d-012fe4238ff1',
        name: 'meat'
      },
      {
        id: 'Section_e8bae025-b25b-47f3-952c-e29efd1c0ac7',
        name: 'fast food'
      },
      {
        id: 'Section_9b14a14c-50f8-45b0-9b46-c26f54ab0917',
        name: 'icecream'
      }
    ]
  end
end
