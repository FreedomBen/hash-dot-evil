RSpec.describe Hash do
  it "let's you access a key by method" do
    hash = { :key1 => 'value1', 'key2' => 'value2' }
    expect(hash.key1).to eq('value1')
    expect(hash.key1).to eq('value1')
    expect(hash.key2).to eq('value2')
    expect(hash.key2).to eq('value2')
  end

  it "let's you set a key by method" do
    hash = {}
    expect{hash.key1 = 'value1'}.to change{hash[:key1]}.from(nil).to('value1')
    expect{hash.key1 = 'skate1'}.to change{hash[:key1]}.from('value1').to('skate1')
    expect{hash.key2 = 'value2'}.to change{hash[:key2]}.from(nil).to('value2')
    expect{hash.key2 = 'skate2'}.to change{hash[:key2]}.from('value2').to('skate2')
  end

  it "doesn't make up key values" do
    hash = {}
    expect(hash.key1).to eq(nil)
  end

  it "defines the method on the hash object after it's first use" do
    hash = {}
    expect(hash.methods).not_to include(:key1)
    expect(hash.key1).to eq(nil)
    expect(hash.methods).to include(:key1)
    expect(hash.methods).not_to include(:key1=)
    expect{hash.key1 = 'value1'}.not_to raise_error
    expect(hash.methods).to include(:key1=)
    expect(hash.key1).to eq('value1')
  end

  it "puts methods as singletons on the hash object, not the hash class" do
    hash = {}
    expect(hash.methods).not_to include(:key1)
    expect(hash.key1).to eq(nil)
    expect(hash.methods).to include(:key1)
    h2 = {}
    expect(h2.methods).not_to include(:key1)
    expect(hash.methods).not_to include(:key2)
    expect(hash.key2).to eq(nil)
    expect(hash.methods).to include(:key2)
    expect(h2.methods).not_to include(:key2)
  end
end
