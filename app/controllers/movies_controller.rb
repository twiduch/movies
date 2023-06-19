class MoviesController < ApplicationController
  before_action :authenticate_request
  include MovieSearchable

  def add_movie
    movie = add_movie_to_active_group
    async_update_movie_info(movie) if movie
    prepare_movie_searchable_variables
    render 'dashboard_movies'
  end

  def remove_movie
    remove_movie_from_active_group
    prepare_movie_searchable_variables
    render 'dashboard_movies'
  end

  private

  def add_movie_to_active_group
    MovieCommands::AddToGroup.call(params[:imdb_id], current_user.active_group)
  end

  def remove_movie_from_active_group
    MovieCommands::RemoveFromGroup.call(params[:imdb_id], current_user.active_group)
  end

  def async_update_movie_info(movie)
    Thread.new do
      MovieCommands::UpdateMovie.call(movie)
    end
  end
end
