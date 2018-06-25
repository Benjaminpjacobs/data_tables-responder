require_relative 'lib/data_tables/responder/version'

Gem::Specification.new do |spec|
  spec.name          = 'data_tables-responder'
  spec.version       = DataTables::Responder::VERSION
  spec.authors       = ['Dale Stevens']
  spec.email         = ['dale@twilightcoders.net']

  spec.summary       = 'Respond to DataTable requests.'
  spec.description   = "Allows rails to respond to DataTable requests"
  spec.homepage      = "https://github.com/TwilightCoders/data_tables-responder"
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'].tap do |host|
    host             = 'https://rubygems.org'
  end

  spec.files         = Dir['CHANGELOG.md', 'README.md', 'LICENSE', 'lib/**/*']
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  rails_versions = ['>= 4.1', '< 6']
  spec.required_ruby_version = '>= 2.3'

  spec.add_runtime_dependency 'active_model_serializers', '~> 0'
  spec.add_runtime_dependency 'quick_count', ['>= 0.0.3', '< 0.1.0']
  spec.add_runtime_dependency 'railties', rails_versions

  spec.add_development_dependency 'activerecord', rails_versions
  spec.add_development_dependency 'pg', '~> 0'
  spec.add_development_dependency 'pry-byebug', '~> 3'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'combustion', '~> 0.7'

end
