# movie_spec.rb

require_relative '../spec_helper'

RSpec.describe OneApiSdk::Movie do
  describe '#movie_quotes' do
    movie = OneApiSdk::Movie.new.paginate_by('limit', 1).execute
    id = movie['docs'].first['_id']

    it 'updates the query string correctly' do
      movie = described_class.new
      movie.by_id(id).movie_quotes

      expect(movie.instance_variable_get(:@query_string)).to eq("movie/#{id}/quote?")
    end
  end

  describe '#by_id' do
    movie = OneApiSdk::Movie.new.paginate_by('limit', 1).execute
    id = movie['docs'].first['_id']

    it 'updates the query string correctly' do
      movie = described_class.new
      movie.by_id(id)

      expect(movie.instance_variable_get(:@query_string)).to eq("movie/#{id}")
    end

    it 'returns correct result' do
      movie = described_class.new
      res = movie.by_id(id).execute

      expect(res['docs'].count).to eq(1)
    end
  end

  describe '#sort_by' do
    it 'updates the query string correctly' do
      movie = described_class.new
      movie.sort_by('name', 'asc')

      expect(movie.instance_variable_get(:@query_string)).to eq('movie?sort=name:asc&')
    end

    it 'should not update string when other than acs or desc' do
      movie = described_class.new
      prev_query_string = movie.instance_variable_get(:@query_string)
      movie.sort_by('name', 'else')

      expect(movie.instance_variable_get(:@query_string)).to eq(prev_query_string)
    end
  end

  describe '#include' do
    it 'updates the query string correctly' do
      movie = described_class.new
      movie.include('budgetInMillions', 250)

      expect(movie.instance_variable_get(:@query_string)).to eq('movie?budgetInMillions=250&')
    end

    it 'should return correct result' do
      movie = described_class.new
      res = movie.include('budgetInMillions', 250).execute

      expect(res['docs'].first['budgetInMillions']).to eq(250)
    end
  end

  describe '#paginate_by' do
    it 'updates the query string correctly' do
      movie = described_class.new
      movie.paginate_by('limit', 1)

      expect(movie.instance_variable_get(:@query_string)).to eq('movie?limit=1&')
    end

    it 'should return correct result' do
      movie = described_class.new
      res = movie.paginate_by('limit', 1).execute

      expect(res['docs'].count).to eq(1)
    end
  end

  describe '#all' do
    it 'returns self' do
      movie = described_class.new
      expect(movie.all).to eq(movie)
    end
  end
end
