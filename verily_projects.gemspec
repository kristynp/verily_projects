#lib = File.expand_path('lib', __dir__)
#lib = File.expand_path("../lib", __FILE__)
File.expand_path(__FILE__) et al
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "verily_projects/version"
require_relative "verily_projects/cli"
require_relative "verily_projects/scraper"
require_relative "verily_projects/project"

Gem::Specification.new do |spec|
  spec.name          = "verily_projects"
  spec.version       = VerilyProjects::VERSION
  spec.authors       = ["<kristynp"]
  spec.email         = ["kristyparker1@gmail.com"]

  spec.summary       = "verily project scraper"
  spec.homepage      = "http://www.knp.com"
  spec.license       = "MIT"
  
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 2.0'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://mygemserver.com"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "http://www.knp.com"
    spec.metadata["changelog_uri"] = "http://www.knp.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_dependency "pry"
  spec.add_dependency "nokogiri"
end
