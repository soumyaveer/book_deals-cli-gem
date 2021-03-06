# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "book_deals/version"

Gem::Specification.new do |spec|
  spec.name          = "book-deals"
  spec.version       = BookDeals::VERSION
  spec.authors       = ["Soumya Veer"]
  spec.email         = ["veer.soumya@gmail.com"]

  spec.summary       = %q{Finds and displays book deals from goodreads.}
  spec.description   = %q{Finds and displays book deals from goodreads.}
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["book-deals"]
  spec.require_paths = ["lib", "lib/book_deals"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
  spec.add_dependency "colorize"
end
