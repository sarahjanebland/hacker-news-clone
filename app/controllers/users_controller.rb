get '/users/:id/posts' do
  @user = User.find(params[:id])
  @posts = @user.posts
  erb :user_posts
end

get '/users/:id/comments' do
  @user = User.find(params[:id])
  @comments = @user.comments
  erb :user_comments
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :user
end

post '/users' do
  @user = User.new(first_name: params[:first_name],
                   last_name: params[:last_name],
                   email: params[:email],
                   hashed_password: params[:password])
  if @user.save
    login(@user.id)
    redirect "/users/#{@user.id}"
  else
    #display error messages
    redirect "/"
  end
end

post '/users/login' do
  @user = User.find_by_email(params[:email])
  if @user
    if @user.authenticate(params[:password])
      login(@user.id)
      redirect "/users/#{@user.id}"
    else
      #display error messages
      redirect "/"
    end
  else
    redirect "/"
  end
end

post '/users/logout' do
  logout
  redirect '/'
end
  

