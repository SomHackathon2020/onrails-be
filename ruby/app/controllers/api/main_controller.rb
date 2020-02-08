


class Api::MainController < ApplicationController

  def test
    render json: {:working => true, params: params[:id]}
  end

end
