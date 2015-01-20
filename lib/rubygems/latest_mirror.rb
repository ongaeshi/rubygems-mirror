require 'rubygems'
require 'fileutils'

class Gem::LatestMirror < Gem::Mirror
  def gems
    gems = []

    SPECS_FILES.each do |sf|
      update_specs unless File.exist?(to(sf))

      gems += Marshal.load(File.read(to(sf)))
    end

    latest_gems = []
    gems_by_name = gems.group_by {|name,version| name }
    gems_by_name.each {|name, list|
      list = list.sort_by {|name,version| version }
      latest_gems << list.pop
    }

    latest_gems.map! do |name, ver, plat|
      # If the platform is ruby, it is not in the gem name
      "#{name}-#{ver}#{"-#{plat}" unless plat == RUBY}.gem"
    end

    latest_gems
  end
end
