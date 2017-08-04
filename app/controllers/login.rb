get '/login' do
  erb :'/login/new'
end

post '/login' do
  user = User.find_by(email: params[:user][:email])

  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = ["something went worng... try again"]
    erb :'/login/new'
  end
end

get '/logout' do
  session.clear
  redirect '/login'
end
