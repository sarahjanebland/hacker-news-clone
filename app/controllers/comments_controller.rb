post '/comments/new' do
  content_type :json
  @comment = Comment.create(content: params[:content], 
                            user_id: session[:user_id],
                            post_id: params[:post_id])

  @user = User.find(session[:user_id])                         
  { :comment => erb(:_comments_block, :layout => false, :locals => {:comment => @comment}) }.to_json
end
