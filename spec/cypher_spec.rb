require 'rspec'
require 'cypher'

describe Cypher do
  let(:empty_cypher) { Cypher.new }
  let(:full_cypher) { Cypher.new }

  describe '#initialize' do

    it 'accepts a library when initialized' do
      empty_cypher.create
      lib = empty_cypher.lib

      expect { Cypher.new(lib) }.to_not raise_error
    end

    it 'sets a default empty library' do
      expect(empty_cypher.lib).to eq({})
    end

    # it 'checks if the library is single or multichar' do
    #   expect(empty_cypher).to receive(:multichar)
    # end

  end

  describe '#create' do

    context 'no target library' do
      let(:seed2) { Cypher.new }

      it 'generates a random seed' do
        empty_cypher.create
        seed2.create
        expect(empty_cypher.seed).to_not eq(seed2.seed)
      end

      it 'generates a library based on a random seed' do
        empty_cypher.create
        expect(empty_cypher.lib).to_not be_empty
      end
    end

    context 'target library exists' do
      it 'accepts a seed as an argument' do
        full_cypher.create
        seed = full_cypher.seed
        expect { full_cypher.create(seed) }.to_not raise_error
      end
    end

  end

  describe '#encode' do

    context 'seeded library' do
      it 'encodes a word' do
        word = "cat"
        empty_cypher.create
        expect(empty_cypher.encode("cat")).to_not eq("cat")
      end

      it 'encodes a longer string'
    end


    context 'morse library' do
      it 'encodes a word'

      it 'encodes a longer string'
    end

    context 'reversal library' do
      it 'encodes a word'

      it 'encodes a longer string'
    end

    context 'numerical library' do
      it 'encodes a word'

      it 'encodes a longer string'
    end
  end

  describe '#decode' do

  end
end
