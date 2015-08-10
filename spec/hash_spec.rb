require 'rspec'
require './lib/hash'

describe MyHash do
  before do
    @test_hash = MyHash.new
  end
  describe '#my_store' do
    it 'takes two arguments ' do
      expect(@test_hash.my_store('animal', 'dog')).to eq 'dog'
    end
  end
  describe '#my_fetch' do
    it 'takes two arguments ' do
      @test_hash.my_store('animal', 'dog')
      expect(@test_hash.my_fetch('animal')).to eq 'dog'
    end
  end

  describe '#my_has_key?' do
    it 'returns true is test_hash has key' do
      @test_hash.my_store('animal', 'cat')
      expect(@test_hash.my_has_key?('animal')).to eq true
    end
  end

  describe '#my_has_value?' do
    it 'returns true is test_hash has value' do
      @test_hash.my_store('animal', 'cat')
      expect(@test_hash.my_has_value?('cat')).to eq true
    end
  end


end
