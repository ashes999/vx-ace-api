# This directory wraps around and makes simple/easy, stuff that uses the API (not necessarily extends it)
# Make sure you set API_ROOT before requiring it
raise 'Please set API_ROOT before requiring this' unless !API_ROOT.nil?

require "#{API_ROOT}/api/game_interpreter"
require "#{API_ROOT}/api/game_event"
require "#{API_ROOT}/api/game_map"

# What to require?
# :patches => all bug-fixes and patches
# :utils => utilities like JSON parsing
# :extensions => things like keyboard capture

requires = [:patches, :utils, :extensions]

requires.each do |folder|
  Dir.glob("#{API_ROOT}/#{folder.to_s}/*.rb").each do |f|
    require "#{f.sub('.rb', '')}"
  end
end
