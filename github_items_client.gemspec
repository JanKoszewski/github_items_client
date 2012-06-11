Gem::Specification.new do |gem|
  gem.authors       = ["Darrell Rivera", "Austen Ito", "Jan Koszewski"]
  gem.email         = ["darrell.rivera@livingsocial.com", "austen.ito@livingsocial.com", "jan.koszewski@livingsocial.com"]
  gem.description   = %q{Gem client for interacting with the OctoChat - GithubItems API}
  gem.summary       = %q{Gem client for interacting with the OctoChat - GithubItems API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "github_items_client"
  gem.require_paths = ["lib"]
  gem.version       = 0.1

  gem.add_runtime_dependency 'faraday'
end