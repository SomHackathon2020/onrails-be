


class Api::LoginController < ApplicationController

  def login
    render json: {:working => true, params: params[:id], :env => ENV['RAILS_ENV'], :env2 => ENV['environment']}
  end

end

