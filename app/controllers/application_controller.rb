class ApplicationController < ActionController::API
  before_action :connect

  def connect
    RavenDB.store.configure do |config|
      config.urls = ['http://127.0.0.1:8080']
      config.database = 'restaurant'
    end
  end
end
