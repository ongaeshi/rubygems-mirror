require 'rubygems/command_manager'
require 'rubygems/mirror/command'
require 'rubygems/latest_mirror/command'

Gem::CommandManager.instance.register_command :mirror
Gem::CommandManager.instance.register_command :latest_mirror
