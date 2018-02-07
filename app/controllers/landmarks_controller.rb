class LandmarksController < ApplicationController


  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks/new' do
    name = params['landmark']['name']
    year_completed = params["landmark"]["year_completed"].to_i

    Landmark.create(name: name, year_completed: year_completed)
    redirect '/landmarks'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks/:id/edit' do
      @landmark = Landmark.find_by(id: params[:id])
      name = params["landmark"]["name"]
      year_completed = params["landmark"]["year_completed"]
      @landmark.name = name
      @landmark.year_completed = year_completed
      @landmark.save
      redirect "/landmarks/#{params[:id]}"
  end
end
