FactoryBot.define do
  factory :movie do
    title { 'title' }
    year { '1984' }
    poster { 'http://abc.com' }
    plot { 'plot' }
    imdb_id { 'tt2424' }
    movie_type { 'movie' }
  end
end
