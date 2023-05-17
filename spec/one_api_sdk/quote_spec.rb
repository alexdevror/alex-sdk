# quote_spec.rb

require_relative '../spec_helper'

RSpec.describe OneApiSdk::Quote do
  describe '#by_id' do
    quote = described_class.new.paginate_by('limit', 1).execute
    id = quote['docs']&.first['_id']

    it 'updates the query string correctly' do
      quote = described_class.new
      quote.by_id(id)

      expect(quote.instance_variable_get(:@query_string)).to eq("quote/#{id}")
    end

    it 'returns correct result' do
      quote = described_class.new
      res = quote.by_id(id).execute

      expect(res['docs'].count).to eq(1)
    end
  end

  describe '#sort_by' do
    it 'updates the query string correctly' do
      quote = described_class.new
      quote.sort_by('name', 'asc')

      expect(quote.instance_variable_get(:@query_string)).to eq('quote?sort=name:asc&')
    end

    it 'should not update string when other than acs or desc' do
      quote = described_class.new
      prev_query_string = quote.instance_variable_get(:@query_string)
      quote.sort_by('name', 'else')

      expect(quote.instance_variable_get(:@query_string)).to eq(prev_query_string)
    end
  end

  describe '#include' do
    it 'updates the query string correctly' do
      quote = described_class.new
      quote.include('dialog', 'They cursed us!')

      expect(quote.instance_variable_get(:@query_string)).to eq('quote?dialog=They cursed us!&')
    end

    it 'should return correct result' do
      quote = described_class.new
      res = res = quote.include('dialog', 'They cursed us!').execute

      expect(res['docs'].first['dialog']).to eq('They cursed us!')
    end
  end

  describe '#paginate_by' do
    it 'updates the query string correctly' do
      quote = described_class.new
      quote.paginate_by('limit', 1)

      expect(quote.instance_variable_get(:@query_string)).to eq('quote?limit=1&')
    end

    it 'should return correct result' do
      quote = described_class.new
      res = quote.paginate_by('limit', 1).execute

      expect(res['docs'].count).to eq(1)
    end
  end

  describe '#all' do
    it 'returns self' do
      quote = described_class.new
      expect(quote.all).to eq(quote)
    end
  end
end
