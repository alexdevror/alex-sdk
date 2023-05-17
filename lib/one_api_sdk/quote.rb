# frozen_string_literal: true

module OneApiSdk
  class Quote
    include OneApiSdk::Filters
    include OneApiSdk::Requests

    def initialize
      @query_string = 'quote?'
    end

    def execute
      results = get(@query_string)
    end

    def all
      self
    end
  end
end
