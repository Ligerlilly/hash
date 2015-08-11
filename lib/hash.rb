require 'pry'

class MyHash
  define_method(:initialize) do
    @key_array = []
    @value_array = []
  end

  define_method(:my_store) do | key, value |
    @key_array.push(key)
    @value_array.push(value)
    value
  end

  define_method(:my_fetch) do | key |
    @value_array[@key_array.index(key)]
  end

  define_method(:my_has_key?) do | key |
    @key_array.include?(key)
  end

  define_method(:my_has_value?) do | value |
    @value_array.include?(value)
  end

  define_method(:my_length) do
    @key_array.length
  end

  define_method(:keys) do
    @key_array
  end

  define_method(:values) do
    @value_array
  end

  def my_merge(arg_hash, &block)
    @new_hash = MyHash.new
    for key in self.keys
      @new_hash.my_store(key, self.my_fetch(key))
    end

    if block_given?
      for key in arg_hash.keys
        if @new_hash.keys.include?(key)
          @new_hash.values[@new_hash.keys.index(key)] = block.call self.my_fetch(key), arg_hash.my_fetch(key)
        else
          @new_hash.my_store(key, arg_hash.my_fetch(key))
        end
      end
    else
      for key in arg_hash.keys
        if @new_hash.keys.include?(key)
          @new_hash.values[@new_hash.keys.index(key)] = arg_hash.my_fetch(key)
        else
          @new_hash.my_store(key, arg_hash.my_fetch(key))
        end
      end
    end

    @new_hash
  end


end
