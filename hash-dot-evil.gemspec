Gem::Specification.new do |s|
  s.name        = 'hash-dot-evil'
  s.version     = '0.0.1'
  s.date        = '2019-03-07'
  s.summary     = "Adds the JavaScript hash syntax to ruby"
  s.description = "Demonstrates a gem that masquerades as legitimate but steals your AWS credentials and sends them to a remote listener"
  s.authors     = ["Ben Porter"]
  s.email       = 'BenjaminPorter86@gmail.com'
  s.files       = ["lib/hash-dot-evil.rb"]
  s.homepage    =
    'http://rubygems.org/gems/hash-dot-evil'
  s.license       = 'MIT'
  s.add_dependency "rainbow"
  s.add_development_dependency "rspec"
end
