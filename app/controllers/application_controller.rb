require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Notes_is_where_its_at"
  end

  get "/" do
    erb :welcome
  end

  get "/login" do
    if !logged_in?
      erb :"login.html"
    else
      redirect "/notes"
    end
  end

  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/notes"
    else
      redirect "/login"
    end
  end


  get "/logout" do
    session.clear
    redirect '/'
  end

  helpers do
    def logged_in?
      !!current_user
    end
    
    def current_user
      @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/"
      end
    end
  end

end
