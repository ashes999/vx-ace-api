# Make sure you set API_ROOT before requiring this
raise 'Please set API_ROOT before requiring this' unless !API_ROOT.nil?

# What to require?
# :api        => API extensions to built-in classes like Game_Interpreter
# :patches    => all bug-fixes and patches
# :utils      => utilities like JSON parsing
# :extensions => things like keyboard capture

requires = [:api, :patches, :utils, :extensions]

requires.each do |folder|
  Dir.glob("#{API_ROOT}/#{folder.to_s}/*.rb").each do |f|
    require "#{f.sub('.rb', '')}"
  end
end
