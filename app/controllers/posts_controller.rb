get '/posts' do
  @posts = Post.all
  erb :posts
end

post '/posts/new' do
  @post = Post.new(title: params[:title],
                   content: params[:content],
                   user_id: session[:user_id])
  if @post.save
    redirect "/posts/#{@post.id}"
  else
    erb :user
  end
end

post '/posts/:id/comments' do
end

post '/posts/:id/vote' do
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @comments = @post.comments
  erb :post
end

