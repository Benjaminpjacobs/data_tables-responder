# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'data_tables/responder/version'

Gem::Specification.new do |spec|
  spec.name          = 'data_tables-responder'
  spec.version       = DataTables::Responder::VERSION
  spec.authors       = ['Dale Stevens']
  spec.email         = ['dale@twilightcoders.net']

  spec.summary       = 'Respond to DataTable requests.'
  spec.description   = "Allows rails to respond to DataTable requests"
  spec.homepage      = "https://github.com/TwilightCoders/data_tables-responder"
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib', 'spec']

  rails_versions = ['>= 4.1', '< 6']
  spec.required_ruby_version = '>= 2.3'

  spec.add_runtime_dependency 'active_model_serializers', '~> 0'
  spec.add_runtime_dependency 'quick_count', '~> 0.1'
  spec.add_runtime_dependency 'railties', rails_versions

  spec.add_development_dependency 'activerecord', rails_versions
  spec.add_development_dependency 'pg', '~> 0'
  spec.add_development_dependency 'pry-byebug', '~> 3'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'combustion', '~> 0.7'

end
