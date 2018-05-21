class OrdersController < ApplicationController
  def index
    RavenDB.store.open_session do |session|
      render json: session.query({ collection: 'Orders' }).all.map(&:serialize), status: 200
    end
  end

  def show
    RavenDB.store.open_session do |session|
      render json: session.load(params[:id]).serialize, status: 200
    end
  end

  def create
    RavenDB.store.open_session do |session|
      session.store(Order.new(orders_params[:table_number]))
      session.save_changes
    end
    render json: { status: 'OK' }, status: 201
  end

  def update
    RavenDB.store.open_session do |session|
      order = session.load(params[:id])
      order.table_number = orders_params[:table_number] if orders_params[:table_number].present?
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
    params.require(:order).permit(:table_number)
  end
end
