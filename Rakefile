# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

begin
  require 'bones'
  Bones.setup
rescue LoadError
  begin
    load 'tasks/setup.rb'
  rescue LoadError
    raise RuntimeError, '### please install the "bones" gem ###'
  end
end

ensure_in_path 'lib'
require 'quickgithelp'

task :default => 'spec:run'

PROJ.name = 'quickgithelp'
PROJ.authors = 'Michael Nutt'
PROJ.email = 'michael@nuttnet.net'
PROJ.url = 'http://github.com/mnutt/quickgithelp'
PROJ.version = Quickgithelp::VERSION
PROJ.rubyforge.name = 'quickgithelp'

PROJ.spec.opts << '--color'

# EOF
