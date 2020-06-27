require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/articles'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

<<<<<<< HEAD
  get '/articles/new' do
    erb :new
=======
  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  post '/articles' do
    Article.create(title: params[:title], content: params[:content])
>>>>>>> d77d0e03858b74b319984a7f540e46554cc17b7c
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  post '/articles' do
    Article.create(title: params[:title], content: params[:content])

    redirect to '/articles/' + "#{Article.last.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    article = Article.find(params[:id])
    article.update(title: params[:title], content: params[:content])
    redirect to '/articles/' + "#{article[:id]}"
  end

  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to '/articles'
  end

end
