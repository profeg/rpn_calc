require 'rpn/item'

describe Rpn::Item do
  it 'parse digits as variables' do
    item = described_class.new('1')
    expect(item.variable?).to be true
  end

  it 'parse operands' do
    %w[- + / *].each do |o|
      expect(described_class.new(o).operand?).to be true
    end
  end

  it 'parse integer' do
    res = described_class.new('1')
    expect(res.value).to be_an Integer
  end

  it 'parse negative integer' do
    res = described_class.new('-1')
    expect(res.value).to be_an Integer
  end

  it 'parse float' do
    res = described_class.new('1.0')
    expect(res.value).to be_a Float
  end

  it 'parse negative float' do
    res = described_class.new('-1.0')
    expect(res.value).to be_a Float
  end

  it 'got error' do
    res = described_class.new('-1.0/')
    expect { res.value }.to raise_error StandardError
  end
end
