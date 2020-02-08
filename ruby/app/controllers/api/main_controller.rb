


class Api::MainController < ApplicationController

  def test
    render json: {:working => true, params: params[:id], :env => ENV['testing_env']}
  end

end
