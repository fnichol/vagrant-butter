# -*- encoding: utf-8 -*-
require File.expand_path('../lib/vagrant/butter/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Fletcher Nichol"]
  gem.email         = ["fnichol@nichol.ca"]
  gem.description   = %q{Smooth out Vagrantfiles with some common helpers and shims}
  gem.summary       = %q{Smooth out Vagrantfiles with some common helpers and shims}
  gem.homepage      = 'https://github.com/fnichol/vagrant-butter#readme'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "vagrant-butter"
  gem.require_paths = ['lib']
  gem.version       = Vagrant::Butter::VERSION

  gem.add_dependency "vagrant", "~> 0.8.2"
end
