class SessionsController < ApplicationController
  # def omniauth
  #   auth = request.env['omniauth.auth']
  #   user = User.from_omniauth(auth)
  #   if user.valid?
  #     session[:user] = user
  #     user.update(token: auth.credentials.token)
  #     render json: {
  #       user: {
  #         uid: user.uid,
  #         email: user.email,
  #         name: user.name
  #       },
  #       token: user.token
  #     }
  #     redirect_to "http://localhost:3000/"
  #   else
  #     redirect_to "http://localhost:3000/"
  #   end
  # end
end