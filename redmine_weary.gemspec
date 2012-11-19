# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "redmine_weary/version"

Gem::Specification.new do |s|
  s.name        = "redmine_weary"
  s.version     = RedmineWeary::VERSION
  s.authors     = ["Joe Mahoney"]
  s.email       = ["mwunsch@gilt.com"]
  s.homepage    = "http://github.com/jmahoney/redmine_  weary"
  s.summary     = %q{Ruby client for the Redmine REST API.}
  s.description = %q{Ruby client for the Redmine REST API (http://www.redmine.org/projects/redmine/wiki/Rest_api). Written with the Weary framework.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "weary", "~> 1.1.0"
end
