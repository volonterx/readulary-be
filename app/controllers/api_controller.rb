class ApiController < ApplicationController

  before_action :authenticate_request!

  private

  def user
    @user ||= User.find_by_uid(params[:uid])
  end

  def authenticate_request!
    unless request.headers['auth-key'] == ENV['API_AUTH_KEY']
      render json: { errors: ['Unauthorized'] }, status: :unauthorized
    end
  end

end