Gem::Specification.new do |gem|
  gem.name = 'deliverhq'
  gem.version = '0.0.1'
  gem.date = '2015-08-10'
  gem.summary = 'deliverhq'
  gem.description = 'DeliverHQ API wrapper'
  gem.authors = [ 'Sean Handley' ]
  gem.email = 'sean.handley@gmail.com'
  gem.files = `git ls-files`.split("\n")
  gem.homepage = 'https://github.com/datacentred/deliverhq'
  gem.license = 'BSD-3-Clause'
  
  gem.required_ruby_version = '> 2.1.0'
  
  # Runtime Dependencies
  gem.add_runtime_dependency 'faraday', '~> 0.9'
  
  # Development Dependencies
  gem.add_development_dependency 'vcr', '~> 2.8'
  gem.add_development_dependency 'webmock', '~> 1.8'
  gem.add_development_dependency 'minitest', '~> 5.3'
  gem.add_development_dependency 'simplecov', '~> 0.9'
  gem.add_development_dependency 'yard', '~> 0.8'
  gem.add_development_dependency 'coveralls', '~> 0.8'

  # Gem Signing
  gem.cert_chain  = ['certs/seanhandley.pem']
  gem.signing_key = File.expand_path("~/.ssh/gem-private_key.pem") if $0 =~ /gem\z/
end
