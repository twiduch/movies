class DashboardController < ApplicationController
  before_action :authenticate_request

  def index
    @term = params[:search]
    @search_movie = @term ? search_movie(@term) : nil
  end

  private

  def search_movie(term)
    Omdb::SearchService.call(term)
  end
end
