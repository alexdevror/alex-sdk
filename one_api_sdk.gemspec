# frozen_string_literal: true

require_relative 'lib/one_api_sdk/version'

Gem::Specification.new do |spec|
  spec.name          = 'one_api_sdk'
  spec.version       = OneApiSdk::VERSION
  spec.authors       = ['Alex']
  spec.email         = ['alexbobrov010@gmail.com']

  spec.summary       = 'It provide the facility to get data from The One Api more friendly'
  spec.description   = 'It provide the facility to get data from The One Api more friendly'
  spec.homepage      = 'https://github.com/alexdevror/alex-sdk'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = "https://rubygems.org"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/alexdevror/alex-sdk'
  spec.metadata['changelog_uri'] = 'https://github.com/alexdevror/alex-sdk'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
