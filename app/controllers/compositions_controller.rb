class CompositionsController < ApplicationController
  def index
    data = []
    RavenDB.store.open_session do |session|
      session.query({ collection: 'Compositions' }).all.each do |composition|
        composition.ingredient_id = session.load(composition.ingredient_id)
        composition.dish_id = session.load(composition.dish_id)
        data << composition.serialize
      end
      render json: data, status: 200
    end
  end

  def show
    RavenDB.store.open_session do |session|
      composition = session.load(params[:id])
      composition.ingredient_id = session.load(composition.ingredient_id)
      composition.dish_id = session.load(composition.dish_id)
      render json: composition.serialize, status: 200
    end
  end

  def create
    RavenDB.store.open_session do |session|
      session.store(Composition.new(compositions_params[:dish_id],
                                    compositions_params[:ingredient_name],
                                    compositions_params[:count],
                                    compositions_params[:weight],
                                    compositions_params[:ingredient_id],
                                    compositions_params[:price]))
      session.save_changes
    end
    render json: { status: 'OK' }, status: 201
  end

  def update
    RavenDB.store.open_session do |session|
      composition = session.load(params[:id])
      composition.dish_id = compositions_params[:dish_id] if compositions_params[:dish_id].present?
      composition.ingredient_name = compositions_params[:ingredient_name] if compositions_params[:ingredient_name].present?
      composition.count = compositions_params[:count] if compositions_params[:count].present?
      composition.weight = compositions_params[:weight] if compositions_params[:weight].present?
      composition.ingredient_id = compositions_params[:ingredient_id] if compositions_params[:ingredient_id].present?
      composition.price = compositions_params[:price] if compositions_params[:price].present?
      session.save_changes
    end
    render json: { status: 'OK' }, status: 200
  end

  def destroy
    RavenDB.store.open_session do |session|
      composition = session.load(params[:id])
      session.delete(composition)
      session.save_changes
    end
    render json: { status: 'OK' }, status: 200
  end

  private

  def compositions_params
    params.require(:composition).permit(:dish_id, :ingredient_name,
                                        :count, :weight, :ingredient_id, :price)
  end
end
