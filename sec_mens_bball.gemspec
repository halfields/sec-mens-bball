
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sec_mens_bball/version"

Gem::Specification.new do |spec|
  spec.name          = "sec_mens_bball"
  spec.version       = SecMensBball::VERSION
  spec.authors       = ["halfields"]
  spec.email         = ["hfields697@aol.com"]

  spec.summary       = %q{Gives records and}
  spec.description   = %q{Shows the league and overall basketball records for the men's teams in the Southeastern Conference. Pick a team and see its complete 2017-1018 schedule}
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

  # spec.add_dependency "require_all"
  spec.add_dependency "nokogiri"

end
