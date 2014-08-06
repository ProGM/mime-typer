lib = 'mime-typer'
Gem::Specification.new do |s|
  s.name        = 'mime-typer'
  s.version     = '0.2.1'
  s.date        = '2014-08-04'
  s.summary     = 'MIME Typer'
  s.description = 'A gem to detect mime type of a file, using libmagic.'
  s.authors     = ['Piero Dotti']
  s.email       = 'progiemmeh@gmail.com'
  s.homepage    = 'https://github.com/ProGM/mime-typer'
  s.license     = 'MIT'
  s.extensions   = %w(dipendences/Rakefile)

  s.files = %w(Gemfile LICENSE README.md Rakefile test.png)
  s.files << "#{lib}.gemspec"
  s.files += Dir.glob("lib/**/*.rb")
  s.files += Dir.glob("test/**/*.rb")
  s.files += Dir.glob("dipendences/*")


  s.add_development_dependency 'minitest', '~> 5.3'
  s.add_development_dependency 'rake', '~> 10.3'
end
