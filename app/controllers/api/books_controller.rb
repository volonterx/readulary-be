class Api::BooksController < ApiController

  before_action :check_user, only: [:index]

  def index
    @books = user.books
  end

  private

  def check_user
    render json: { errors: {user: 'missing uid query parameter'} }, status: :bad_request unless user
  end
end