#========================================================================
# ** Logger
#    By: ashes999 (ashes999@yahoo.com)
#    Version: 1.0
#------------------------------------------------------------------------
# * Description:
# Simple, flat logging to a file (with a timestamp).
#========================================================================

class Logger
  @@first_message = true
  
	def self.log(message)
    # If we're in debug mode, wipe the file on the first message
		file_mode = !$DEBUG.nil? && @@first_message ? 'w' : 'a'    
		File.open('log.txt', file_mode) { |f|
			f.write("#{Time.new} :: #{message}\n")
		}
		
		@@first_message = false
	end
end

