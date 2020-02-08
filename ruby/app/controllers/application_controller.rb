class ApplicationController < ActionController::API

  # GET test
  def test
    render json: {working: true}
  end
end
