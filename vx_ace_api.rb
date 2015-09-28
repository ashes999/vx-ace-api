# This directory wraps around and makes simple/easy, stuff that uses the API (not necessarily extends it)
require 'scripts/api/game_interpreter'
require 'scripts/api/game_event'
require 'scripts/api/game_map'

# What to require?
# :patches => all bug-fixes and patches
# :utils => utilities like JSON parsing
# :extensions => things like keyboard capture

requires = [:patches, :utils, :extensions]

requires.each do |folder|
  Dir.glob("scripts/#{folder.to_s}/*.rb").each do |f|
    require "#{f.sub('.rb', '')}"
  end
end
