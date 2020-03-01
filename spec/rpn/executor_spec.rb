require 'rpn/executor'
require 'rpn/item'

describe Rpn::Executor do
  it 'Should execute input string' do
    rpn = described_class.new('8', [])
    expect(rpn.result).to eq([8])

    rpn = described_class.new('4', [8])
    expect(rpn.result).to eq([8, 4])

    rpn = described_class.new('/', [8, 4])
    expect(rpn.result).to eq([2])

    rpn = described_class.new('5 8 +', [])
    expect(rpn.result).to eq([13])

    rpn = described_class.new('-3 -2 * 5 +', [])
    expect(rpn.result).to eq([11])

    rpn = described_class.new('5 9 1 - /', [])
    expect(rpn.result).to eq([0.625])

    expect { described_class.new('/', [0, 0]) }.to raise_error StandardError
  end
end
