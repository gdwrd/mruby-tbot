MRuby::Gem::Specification.new('mruby-tbot') do |spec|
  spec.license = 'MIT'
  spec.authors = 'Nazarii Sheremet'

  spec.add_dependency('mruby-smallhttp', :mgem => 'mruby-smallhttp')
  spec.add_dependency('mruby-json',      :github => 'mattn/mruby-json')
  spec.add_dependency('mruby-sleep',     :github => 'matsumotory/mruby-sleep')

  spec.add_test_dependency('mruby-env',  :github => 'iij/mruby-env')
end
