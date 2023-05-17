# spec/one_api_sdk_spec.rb

require 'one_api_sdk'

describe OneApiSdk do
  it 'has a version number' do
    expect(OneApiSdk::VERSION).not_to be nil
  end
end
