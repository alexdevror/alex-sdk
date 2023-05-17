# frozen_string_literal: true

module OneApiSdk
  class Movie
    include OneApiSdk::Filters
    include OneApiSdk::Requests

    def initialize
      @query_string = 'movie?'
    end

    def execute
      results = get(@query_string)
    end

    def movie_quotes
      @query_string = "#{@query_string}/quote?"

      self
    end

    def all
      self
    end
  end
end
