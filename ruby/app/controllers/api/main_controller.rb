


class Api::MainController < ApplicationController

  before_action :check
  def test
    render json: {:working => true, params: params[:id], :env => ENV['RAILS_ENV'], :env2 => ENV['environment']}
  end

  def new_association
    ast = Association.new
    ast.name = params[:name]
    ast.email = params[:email]
    ast.phone = params[:phone]
    ast.save
    render :json => ast
  end
  def header_test
    render json: {:json => request.headers['HTTP_MINE_CART_NUMBER']}
  end

  private
  def check
    if request.headers['HTTP_MINE_CART_NUMBER'] == 'hello'
      render :nothing => true, :status => 403
    end
  end
end
