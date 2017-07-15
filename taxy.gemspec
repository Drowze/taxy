# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = 'taxy'
  spec.version = '0.1.0'
  spec.authors = ['Rafael G']
  spec.email = ['gibim6+taxy@gmail.com']
  spec.date = Time.now.strftime('%F')

  spec.homepage = 'https://github.com/drowze/taxy'
  spec.summary = 'Cabify API wrapper.'
  spec.license = 'MIT'
  spec.files = Dir['{lib,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
  spec.files += Dir.glob('lib/**/*.rb')
  spec.require_paths = ['lib']

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_dependency 'faraday', '~> 0.9', '>= 0.9.0'
  spec.add_dependency 'json', '~> 1.8'
end
