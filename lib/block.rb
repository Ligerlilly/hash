def hi(string, &block)
  if block_given?
    yield string
  else
    string
  end
end
