require_relative 'lib/mp3tagger/version'

Gem::Specification.new do |spec|
  spec.name          = "mp3tagger"
  spec.version       = Mp3tagger::VERSION
  spec.authors       = ["Nicola Bernardini"]
  spec.email         = ["nicola.bernardini.rome@gmail.com"]

  spec.summary       = %q{A simple software that tags any mp3 file with information deduced from a properly formatted file name}
  spec.description   = %q{mp3tagger is a simple software that tags any mp3 file with information deduced from a properly formatted file name.}
  spec.homepage      = "https://rubygems.org/gems/mp3tagger"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7")

  spec.metadata["allowed_push_host"] = "https://rubygems.org/gems/mp3tagger"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/nicb/mp3tagger"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'id3lib-ruby', '~> 0.6.0'
end
