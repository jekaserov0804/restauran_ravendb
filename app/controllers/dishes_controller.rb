class DishesController < ApplicationController
  def index
    data = []
    RavenDB.store.open_session do |session|
      session.query({ collection: 'Dishes' }).all.each do |dish|
        dish.section_id = session.load(dish.section_id)
        data << dish.serialize
      end
    end
    render json: data, status: 200
  end

  def show
    RavenDB.store.open_session do |session|
      dish = session.load(params[:id])
      dish.section_id = session.load(dish.section_id)
      render json: dish.serialize, status: 200
    end
  end

  def create
    RavenDB.store.open_session do |session|
      session.store(Dish.new(dishes_params[:name],
                             dishes_params[:section_id],
                             dishes_params[:price]))
      session.save_changes
    end
    render json: { status: 'OK' }, status: 201
  end

  def update
    RavenDB.store.open_session do |session|
      dish = session.load(params[:id])
      dish.name = dishes_params[:name] if dishes_params[:name].present?
      dish.section_id = dishes_params[:price] if dishes_params[:section_id].present?
      dish.price = dishes_params[:weight] if dishes_params[:price].present?
      session.save_changes
    end
    render json: { status: 'OK' }, status: 200
  end

  def destroy
    RavenDB.store.open_session do |session|
      dish = session.load(params[:id])
      session.delete(dish)
      session.save_changes
    end
    render json: { status: 'OK' }, status: 200
  end

  private

  def dishes_params
    params.require(:dish).permit(:name, :section_id, :price)
  end
end
