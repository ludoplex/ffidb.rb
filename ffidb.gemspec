#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.version            = File.read('VERSION').chomp
  gem.date               = File.mtime('VERSION').strftime('%Y-%m-%d')

  gem.name               = 'ffidb'
  gem.homepage           = 'https://github.com/ffidb/ffidb.rb'
  gem.license            = 'Unlicense'
  gem.summary            = 'Command-line interface (CLI) for the FFI DB registry.'
  gem.description        = gem.summary

  gem.author             = 'Arto Bendiken'
  gem.email              = 'arto@bendiken.net'

  gem.metadata = {
    'bug_tracker_uri'   => 'https://github.com/ffidb/ffidb.rb/issues',
    'changelog_uri'     => 'https://github.com/ffidb/ffidb.rb/blob/master/CHANGES.md',
    'documentation_uri' => 'https://www.rubydoc.info/github/ffidb/ffidb.rb/master',
    'homepage_uri'      => gem.homepage,
    #'mailing_list_uri'  => 'https://groups.google.com/forum/#!forum/ffidb',
    'source_code_uri'   => 'https://github.com/ffidb/ffidb.rb',
  }

  gem.platform           = Gem::Platform::RUBY
  gem.files              = %w(AUTHORS CREDITS.md README.md UNLICENSE VERSION) + Dir.glob('lib/**/*.rb')
  gem.bindir             = %q(bin)
  gem.executables        = %w(ffidb)
  gem.require_paths      = %w(lib)
  gem.extensions         = %w()
  gem.test_files         = %w()

  gem.required_ruby_version      = '>= 2.7.0'
  gem.required_rubygems_version  = '>= 3.1.2' # Ruby 2.7.0
  gem.requirements               = []
  gem.add_development_dependency 'rake',      '>= 13'
  gem.add_development_dependency 'rspec',     '>= 3.9'
  gem.add_development_dependency 'yard' ,     '>= 0.9'
  gem.add_development_dependency 'ffi-clang', '>= 0.6'
  gem.post_install_message       = nil
end
