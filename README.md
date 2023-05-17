# OneApiSdk

OneApiSdk is a Ruby gem that provides a user-friendly interface for accessing and interacting with TheOneApi. With this gem, you can easily make API calls and retrieve results without dealing with the complexities of constructing URLs and handling the underlying HTTP requests.

I used `ruby 2.7.6` version for this gem.

## Installation

For testing create a build of your sdk by this comman
Add this line to your application's Gemfile:

```ruby
gem 'one_api_sdk'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install one_api_sdk

## Usage

To get started, require the gem and create an instance of `OneApiSDK`
In this gem you can use two basic end points for `TheOneAPI`
Movie : `OneApiSdk::Movie.new`
Quote : `OneApiSdk::Quote.new`

## Making API Calls

There are many API calls that you can do with this gem like getting filtered results along with pagination and sorting. Here are the examples of few.

`TheOneApi::Quote.new.sort_by("movie", 'asc').paginate_by('limit', 3).execute`
`OneApiSdk::Movie.new.greater_than('runtimeInMinutes', 400).execute `

## Contributing

Contributions to TheOneApi gem are welcome! If you encounter any issues or have suggestions for improvements, please open an issue on the GitHub Repo.

## License

TheOneApi gem is released under the [MIT License](https://chat.openai.com/link-to-license).
