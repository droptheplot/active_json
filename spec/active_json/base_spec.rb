require_relative '../my_database'

describe ActiveJson::Base do
  describe '#configure' do
    it 'yields with config' do
      expect do |block|
        MyDatabase.configure(&block)
      end.to yield_with_args(OpenStruct)
    end
  end

  describe '#reload' do
    it 'update database from JSON document' do
      MyDatabase.website = "Someone else's Blog."

      MyDatabase.reload

      expect(MyDatabase.website).to eq("Mr. Buster Muller's Blog.")
    end
  end

  describe 'JSON methods' do
    describe '#method_missing' do
      it 'returns JSON by method name' do
        expect(MyDatabase.website).to eq("Mr. Buster Muller's Blog.")
      end
    end

    describe '#respond_to?' do
      it 'returns true' do
        expect(MyDatabase.respond_to?(:website)).to be true
      end
    end
  end
end
