class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def websocket
    if defined?(WebsocketRails)
      WebsocketRails
    else
      Pusher
    end
  end
end
