# frozen_string_literal: true

module OneApiSdk
  module Filters
    OPERATORS = {
      less_than_equal_to: '<=',
      less_than: '<',
      greater_than: '>',
      greater_than_equal_to: '>=',
      include: '=',
      exclude: '!='
    }

    def by_id(id)
      @query_string = "#{@query_string.chomp('?')}/#{id}"

      self
    end

    def sort_by(name, sort_type = 'asc')
      @query_string = "#{@query_string}sort=#{name}:#{sort_type}&" if ['asc', 'desc'].any?(sort_type)

      self
    end

    OPERATORS.each do |operator, sign|
      define_method(operator) do |param, *value|
        @query_string = "#{@query_string}#{param}#{sign}#{value.join(',')}&"

        self
      end
    end

    def paginate_by(name, value)
      @query_string = "#{@query_string}#{name}=#{value}&"

      self
    end

    def pagination(limit = 10, offset = 0, page = 1)
      @query_string = "#{@query_string}limit=#{limit}&offset=#{offset}&page=#{page}&"

      self
    end
  end
end
