require 'rubygems/latest_mirror'
require 'rubygems/mirror'
require 'rubygems/command'
require 'yaml'

class Gem::Commands::LatestMirrorCommand < Gem::Commands::MirrorCommand
  def initialize
    super 'latest_mirror', 'Mirror a gem repository latest only'
  end

  def description # :nodoc:
    <<-EOF
The latest_mirror command uses the ~/.gem/.mirrorrc config file to mirror
remote gem repositories to a local path. The config file is a YAML
document that looks like this:

  ---
  - from: http://gems.example.com # source repository URI
    to: /path/to/mirror           # destination directory
    parallelism: 10               # use 10 threads for downloads

Multiple sources and destinations may be specified.
    EOF
  end

  def execute(user_home)
    execute_in(Gem::LatestMirror)
  end
end
