


class Api::MainController < ApplicationController

  def test
    render json: {:working => true, params: params[:id], :env => ENV['RAILS_ENV'], :env2 => ENV['environment']}
  end

  def new_association
    at = Association.create :name => params[:name], :email => params[:email], :phone => params[:phone]
  end
end
