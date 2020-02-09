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

  def get_events_by_distance
    # v = params[:radius]
    # render :json => v.to_
    lon = request.headers['HTTP_LON']
    lat = request.headers['HTTP_LAT']
    radius = request.headers['HTTP_RADIUS']
    bbox = Geocoder::Calculations.bounding_box([lat, lon], radius, :units => :km)
    # puts bbox
    events = Event
                 .where("lat between ? and ?", bbox[0], bbox[2])
                 .where("lon between ? and ?", bbox[1], bbox[3])
    events.each do |ev|
      ev.distance =  Geocoder::Calculations.distance_between [lat, lon], [ev.lat, ev.lon], :units => :km
    end
    render :json => events
  end

  def reverse

    # response = Net::HTTP.post_form('https://nominatim.openstreetmap.org/', {:q => })
    # Net::HTTP::Get.new('https://nominatim.openstreetmap.org/?addressdetails=0&q=Tecnocampus mataro&format=json&limit=1')
  end

  def user_achievements
    user = User.find_by_token(token)
    render :json => user.achievements

  end
  def user_all
    render :json => User.all, :except => [:password, :salt, :token]
  end

  def my_user
    user = User.find_by_token(token)
    if user.nil?
      render nothing: true, status: :unauthorized
      return
    end
    render :json => user, :except => [:password, :salt, :token]
  end

  def get_user
    us = User.find(params[:user_id])
    render :json => us, :include =>
        {
            :level => {:only => [:name, :description]}
        }, :except => [:password, :salt, :token]
  end

  def get_my_friends
    us = User.find_by_token(token)
    render :json => us.friends, :include =>
        {
            :level => {:only => [:name, :description, :id]}
        }, :except => [:password, :salt, :token]
  end

  def get_user_friends
    us = User.find(params[:user_id])
    render :json => us.friends, :include =>
        {
            :level => {:only => [:name, :description, :id]}
        }, :except => [:password, :salt, :token]
  end

  private

  def token
    request.headers["HTTP_MINE_CART_NUMBER"]
  end

  def check
    if token.nil?
      render :nothing => true, :status => 403

    else
      if User.find_by_token(token).nil?
        render :nothing => trust, :status => 401
      end
    end
  end
end