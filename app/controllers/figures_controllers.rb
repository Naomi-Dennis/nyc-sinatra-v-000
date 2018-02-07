class FiguresController < ApplicationController

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures/new' do
    landmarks = Array.new
    titles = Array.new
    figure_name = params["figure"]["name"]
    new_title = params["title"]["name"]
    new_landmark = params["landmark"]["name"]
    landmarks = params["figure"]["landmark_ids"].collect{ |i_id| Landmark.find_by(id: i_id) }if !params["figure"]["landmark_ids"].nil?
    titles = params["figure"]["title_ids"].collect{ |i_id| Title.find_by(id: i_id) } if !params["figure"]["title_ids"].nil?
    new_title_obj = Title.create(name: new_title) if !new_title.empty?
    new_landmark_obj = Landmark.create(name: new_landmark) if !new_landmark.empty?
    new_figure_obj = Figure.create(name: figure_name)
    landmarks << new_landmark_obj if !new_landmark_obj.nil?
    titles << new_title_obj if !new_title_obj.nil?

    new_figure_obj.landmarks = landmarks
    new_figure_obj.titles = titles

    new_figure_obj.save

    redirect "/figures"
  end

  post '/figures/save' do
    landmarks = Array.new
    titles = Array.new
    figure_name = "NEW FIGURE #{params["figure"]["id"]}"
    figure_name = params["figure"]["name"] if !params["figure"]["name"].nil?
    new_title = params["title"]["name"]
    new_landmark = params["landmark"]["name"]
    landmarks = params["figure"]["landmark_ids"].collect{ |i_id| Landmark.find_by(id: i_id) }if !params["figure"]["landmark_ids"].nil?
    titles = params["figure"]["title_ids"].collect{ |i_id| Title.find_by(id: i_id) } if !params["figure"]["title_ids"].nil?

    new_title_obj = Title.create(name: new_title) if !new_title.empty?
    new_landmark_obj = Landmark.create(name: new_landmark) if !new_landmark.empty?
    new_figure_obj = Figure.find_by(id: params["figure"]["id"])
    new_figure_obj.name = figure_name
    landmarks << new_landmark_obj if !new_landmark_obj.nil?
    titles << new_title_obj if !new_title_obj.nil?

    new_figure_obj.landmarks = landmarks
    new_figure_obj.titles = titles
    new_figure_obj.save
    redirect "/figures/#{params["figure"]["id"]}"
  end

  get '/figures' do
    @figures =  Figure.all
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/show'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id].to_i)
    @landmarks = @figure.landmarks
    @titles = @figure.titles
    erb :'/figures/single_show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id].to_i)
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/edit'
  end
end
