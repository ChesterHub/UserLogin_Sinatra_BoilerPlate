# Users INDEX
get '/users' do
  @users = User.all
  erb :'users/index'
end

# Users NEW
get '/users/new' do
  erb :'users/new'
end

# Users SHOW
get '/users/profile' do
  @user = current_user
  erb :'users/show'
end

# Users EDIT
get '/users/edit' do
  @user = current_user
  erb :'users/edit'
end

# Users CREATE
post '/users' do
  if params[:user][:password] != params[:password_confirmation]
    @errors = ["ERROR: Passwords Don't Match!"]
    erb :'users/new'
  else
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect "/users/profile"
    else
      @errors = @user.errors.full_messages
      erb :'users/new'
    end
  end
end

# Users UPDATE
put '/users/:id' do
  @user = current_user
  @user.update(params[:user])
  redirect "/users/profile"
end

# Users DELETE
delete '/users/:id' do
  @user = current_user
  @user.destroy
  redirect "/users"
end

