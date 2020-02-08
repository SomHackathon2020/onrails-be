


class Api::LoginController < ApplicationController

  def login
    uname = request.headers['HTTP_EMAIL']
    pwd = request.headers['HTTP_PASSWORD']
    user = User.find_by(email: uname, password: pwd)
    if user.nil?
      render :json => request.headers['HTTP_EMAIL'] , status: :unauthorized
      return
    end

    loop do
      uuid = SecureRandom.uuid
      if User.find_by(token: uuid).nil?
        user.token = uuid
        user.save
        break;
      end
    end
    render json: user
  end

  def signup

  end
end

