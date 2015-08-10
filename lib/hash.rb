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


  define_method(:my_merge) do | my_hash |
    @new_hash = MyHash.new
    for key in self.keys
      @new_hash.my_store(key, self.my_fetch(key))
    end

    for key in my_hash.keys
      if @new_hash.keys.include?(key)
        @new_hash.values[@new_hash.keys.index(key)] = my_hash.my_fetch(key)
      else
        @new_hash.my_store(key, my_hash.my_fetch(key))
      end
    end

    # "#{@new_hash.keys} and #{@new_hash.values}"
    @new_hash
  end


end
