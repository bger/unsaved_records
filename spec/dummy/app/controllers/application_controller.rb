class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def saved
    @user = User.last
    @user.update_attributes(first_name: "saved name")
    render json: @user
  end

  def dirty
    @user = User.last
    @user.assign_attributes(first_name: "not saved name")
    render json: @user
  end
end
