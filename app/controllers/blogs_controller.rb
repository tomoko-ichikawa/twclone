class BlogsController < ApplicationController
  def index
      get'/blogs', to:'blogs#index'
  end
end
