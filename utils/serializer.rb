# Serializes and deserializes. Note that this uses Marshal.dump under
# the hood, which means changes to fields are not handled gracefully ...
class Serializer
	def self.serialize(obj)
    return Marshal.dump(obj)
  end
  def self.deserialize(str)
    return Marshal.restore(str)
  end
end

=begin
	def self.serialize(obj)
    # Convert to a map. JSON parser can't handle classes.
    map = {}
    serialized = ""
    
    if obj.is_a?(Array)
      serialized = '['
      obj.each do |o|
        serialized += serialize(o)
      end
      serialized += ']'
    else      
      obj.instance_variables.each do |i|
        map[i] = obj.instance_variable_get(i)
      end
      serialized = JSON.encode(map);
    end

    return serialized    
	end
	
  # Doesn't quite work
	def self.deserialize(str, clazz)
		obj = JSON.decode(str)
    if (obj.is_a?(Array))
      obj.each do |o|
        o = map_to_obj(o, clazz)
      end
    else
      return map_to_obj(obj, clazz)
    end
	end
  
  def self.map_to_obj(obj, clazz)
    to_return = clazz.new
    obj.each do |name, value|
      clazz.instance_variable_set(name, value)
    end
    return to_return
  end
end
=end