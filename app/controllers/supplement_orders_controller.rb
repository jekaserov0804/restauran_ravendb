class SupplementOrdersController < ApplicationController
  def index
    data = []
    RavenDB.store.open_session do |session|
      session.query({ collection: 'SupplementOrders' }).all.each do |order|
        order.order_id = session.load(order.order_id)
        order.dish_id = session.load(order.dish_id)
        data << order.serialize
      end
      render json: data, status: 200
    end
  end

  def show
    RavenDB.store.open_session do |session|
      order = session.load(params[:id])
      order.order_id = session.load(order.order_id)
      order.dish_id = session.load(order.dish_id)
      render json: order.serialize, status: 200
    end
  end

  def create
    RavenDB.store.open_session do |session|
      session.store(SupplementOrder.new(orders_params[:order_id],
                                        orders_params[:dish_id],
                                        orders_params[:dish_name],
                                        orders_params[:count]))
      session.save_changes
    end
    render json: { status: 'OK' }, status: 201
  end

  def update
    RavenDB.store.open_session do |session|
      order = session.load(params[:id])
      order.order_id = orders_params[:order_id] if orders_params[:order_id].present?
      order.dish_id = orders_params[:dish_id] if orders_params[:dish_id].present?
      order.dish_name = orders_params[:dish_name] if orders_params[:dish_name].present?
      order.count = orders_params[:count] if orders_params[:count].present?
      session.save_changes
    end
    render json: { status: 'OK' }, status: 200
  end

  def destroy
    RavenDB.store.open_session do |session|
      order = session.load(params[:id])
      session.delete(order)
      session.save_changes
    end
    render json: { status: 'OK' }, status: 200
  end

  private

  def orders_params
    params.require(:supplement_order).permit(:dish_name, :count, :dish_id, :order_id)
  end
end
