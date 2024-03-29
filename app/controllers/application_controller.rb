class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user! # only for admin case

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.admin?
      admin_events_path
    else
      flash[:notice] = "Vous devez avoir un compte administrateur pour accéder à cette page."
      root_path
    end
  end
end
