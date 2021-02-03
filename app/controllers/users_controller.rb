class UsersController < ApplicationController

  # GET: /users
  #get "/users" do
    #erb :"/users/index.html"
  #end

  get "/login" do
    erb :login
  end

  post "/login" do
    @user = User.find_by(username: params[:username])   #find the user
    if @user.authenticate(params[:password])
      session[:user_id] = @user_id   #actually logging the user in
      redirect "users/#{@user.id}"
    else
    end
  end
 
  #Route to signup
  get "/signup" do
  end

  # GET: /users/new
  #get "/users/new" do
    #erb :"/users/new.html"
  #end

  # POST: /users
  #post "/users" do
    #redirect "/users"
  #end

  # GET: /users/5
  get "/users/:id" do  #User show route
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end


end
