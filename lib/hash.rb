

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

end
