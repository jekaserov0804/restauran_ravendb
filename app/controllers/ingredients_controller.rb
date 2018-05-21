class IngredientsController < ApplicationController
  def index
    RavenDB.store.open_session do |session|
      render json: session.query({ collection: 'Ingredients' }).all.map(&:serialize), status: 200
    end
  end

  def show
    RavenDB.store.open_session do |session|
      render json: session.load(params[:id]).serialize, status: 200
    end
  end

  def create
    RavenDB.store.open_session do |session|
      session.store(Ingredient.new(ingredients_params[:name],
                                   ingredients_params[:price],
                                   ingredients_params[:weight]))
      session.save_changes
    end
    render json: { status: 'OK' }, status: 201
  end

  def update
    RavenDB.store.open_session do |session|
      ingredient = session.load(params[:id])
      ingredient.name = ingredients_params[:name] if ingredients_params[:name].present?
      ingredient.price = ingredients_params[:price] if ingredients_params[:price].present?
      ingredient.weight = ingredients_params[:weight] if ingredients_params[:weight].present?
      session.save_changes
    end
    render json: { status: 'OK' }, status: 200
  end

  def destroy
    RavenDB.store.open_session do |session|
      ingredient = session.load(params[:id])
      session.delete(ingredient)
      session.save_changes
    end
    render json: { status: 'OK' }, status: 200
  end

  private

  def ingredients_params
    params.require(:ingredient).permit(:name, :price, :weight)
  end
end
