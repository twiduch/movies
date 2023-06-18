class MoviesController < ApplicationController
  before_action :authenticate_request

  def add_movie
    movie = add_movie_to_active_collection

    redirect_to controller: 'dashboard', action: 'index', anchor: params[:anchor], search: params[:search]
  end

  private

  def add_movie_to_active_collection
    MovieCommands::AddToGroup.call(params[:imdb_id], current_user.active_group)
  end
end
