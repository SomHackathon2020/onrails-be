class Api::LoginController < ApplicationController

  def login
    uname = request.headers['HTTP_EMAIL']
    pwd = request.headers['HTTP_PASSWORD']
    user = User.find_by(email: uname, password: pwd)
    if user.nil?
      render :json => request.headers['HTTP_EMAIL'], status: :unauthorized
      return
    end

    loop do
      uuid = SecureRandom.uuid
      if User.find_by(token: uuid).nil?
        user.token = uuid
        user.save
        break
      end
    end
    render json: user
  end

  def register

    if request.headers['HTTP_EMAIL'].nil? ||
        request.headers['HTTP_NAME'].nil? ||
        request.headers['HTTP_PASSWORD'].nil? ||
        request.headers['HTTP_PHONE'].nil? ||
        request.headers['HTTP_BIRTH'].nil?
      render :json => 'void'
    end
    user.password = request.headers['HTTP_PASSWORD']
    user = User.new
    user.phone = request.headers['HTTP_PHONE']
    user.email = request.headers['HTTP_EMAIL']
    user.birth = request.headers['HTTP_BIRTH']
    user.name = request.headers['HTTP_NAME']
    user.save
    render json: user
  end

  private


end

