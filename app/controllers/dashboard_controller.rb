class DashboardController < ApplicationController
  before_action :authenticate_request
  include MovieSearchable

  def index
    prepare_movie_searchable_variables
  end
end
