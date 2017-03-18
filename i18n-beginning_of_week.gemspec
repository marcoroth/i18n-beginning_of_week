# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'i18n/beginning_of_week/version'

Gem::Specification.new do |spec|
  spec.name          = "i18n-beginning_of_week"
  spec.version       = I18n::BeginningOfWeek::VERSION
  spec.authors       = ["Mark Edmondson"]
  spec.email         = ["mark@retailzipline.com"]

  spec.summary       = %q{Get the beginning of the week from the current I18n locale.}
  spec.description   = %q{Different locales use different days for the beginning of the week. This gem allows the I18n locale to determine the beginning of the week day.}
  spec.homepage      = "https://github.com/markedmondson/i18n-beginning_of_week"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "i18n"
  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "pry", "~> 0.10.4"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
