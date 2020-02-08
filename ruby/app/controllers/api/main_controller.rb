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
    render json: {:json => token}
  end

  def user_all
    render :json => User.all
  end
  def my_user
    user = User.find_by_token(token)
    if user.nil?
      render nothing: true, status: :unauthorized
      return
    end
    render :json => user
  end
  def get_user
    us = User.find(params[:user_id])
    render :json => us, :include =>
        {
            :level => {:only => [:name, :description]}
        }, :except => [:password, :salt, :token]
  end
  def get_user_friends
    us = User.find(params[:user_id])
    render :json => us, :include =>
        {
            :friends => {:only => [:name], :include => {:level => {:only => :name}}},
            :level => {:only => [:name, :description]}
        }, :except => [:password, :salt, :token]
  end

  private
  def token
    request.headers["HTTP_MINE_CART_NUMBER"]
  end

  def check
    if request.headers['HTTP_MINE_CART_NUMBER'].nil?
      render :nothing => true, :status => 403

    else
      if User.find_by_token(token).nil?
        render :nothing => trust, :status => 401
      end
    end
  end
end