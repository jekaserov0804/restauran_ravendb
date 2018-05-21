class SectionsController < ApplicationController
  def index
    RavenDB.store.open_session do |session|
      render json: session.query({ collection: 'Sections' }).all.map(&:serialize), status: 200
    end
  end

  def show
    RavenDB.store.open_session do |session|
      render json: session.load(params[:id]).serialize, status: 200
    end
  end

  def create
    RavenDB.store.open_session do |session|
      session.store(Section.new(sections_params[:name]))
      session.save_changes
    end
    render json: { status: 'OK' }, status: 201
  end

  def update
    RavenDB.store.open_session do |session|
      section = session.load(params[:id])
      section.name = sections_params[:name] if sections_params[:name].present?
      session.save_changes
    end
    render json: { status: 'OK' }, status: 200
  end

  def destroy
    RavenDB.store.open_session do |session|
      section = session.load(params[:id])
      session.delete(section)
      session.save_changes
    end
    render json: { status: 'OK' }, status: 200
  end

  private

  def sections_params
    params.require(:section).permit(:name)
  end
end
