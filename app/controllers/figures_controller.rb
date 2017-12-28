class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    binding.pry
    @figure = Figure.create(name: params["name"])
    if !params["new_title"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    if !params["new_landmark"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
  end

end
