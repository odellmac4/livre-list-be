class SessionsController < ApplicationController
  # def login
  #   redirect_to 'https://accounts.google.com/o/oauth2/v2/auth'
  # end
  
  def omniauth
    auth = request.env['omniauth.auth']
    user = User.from_omniauth(auth)
    if user.valid?
      user.update(token: auth.credentials.token)
      session[:user_id] = user.id

      # Redirect to the frontend with a token (or any necessary info)
      # redirect_to "http://localhost:3000?token=#{user.token}"
      render json: { token: user.token }
    else
      # redirect_to 'http://localhost:3000?error=authentication_failed'
      render json: { error: 'Authentication failed' }, status: :unauthorized
    end
  end
end