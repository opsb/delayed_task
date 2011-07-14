Gem::Specification.new do |s|
  s.name = %q{delayed_task}
  s.version = "0.1.2"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["opsb"]
  s.summary = %q{Run any rake tasks as a delayed job'}  
  s.description = %q{Run any rake tasks as a delayed job by adding delay: in front of the rake task e.g. rake delay:db:seed'}
  s.email = %q{oliver@opsb.co.uk}
  s.files = Dir.glob("lib/**/*") + %w(delayed_task.gemspec)
  s.homepage = %q{http://github.com/opsb/delayed_task}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
end