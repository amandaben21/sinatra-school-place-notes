class UsersController < ApplicationController

  # GET: /users
  #get "/users" do
    #erb :"/users/index.html"
  #end

  get "/login" do
    erb :"/users/login.html"
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
    erb :"/users/signup.html"
  end

   # GET: /users/5
   get "/users/:id" do  #User show route
    @user = User.find_by(id: params[:id])

    erb :"/users/show.html"
  end

  post "/users" do  #creates the new user and not show the new user then send you to the route of the new user
    if params[:username] != "" && params[:email] != "" && params[:password]
      @user = User.create(params)
      session[:user_id] = @user_id  #actually logging the user in
      redirect "/users/#{@user.id}" #gets the user url gets a brand new http request,login in the user right away
    else 
      redirect "/signup"
    end
  end

  # GET: /users/new
  #get "/users/new" do
    #erb :"/users/new.html"
  #end

  # POST: /users
  #post "/users" do
    #redirect "/users"
  #end

 

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
