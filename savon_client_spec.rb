require_relative 'savon_client'

describe SavonClient do
  it 'adds numbers' do
    expect(SavonClient.new.perform('add', 1, 2)).to eq 3.0
  end

  it 'subtracts numbers' do
    expect(SavonClient.new.perform('subtract', 7, 2)).to eq 5.0
  end

  it 'multiplies numbers' do
    expect(SavonClient.new.perform('multiply', 23, 42)).to eq 966.0
  end

  it 'divides numbers' do
    pending
    expect(SavonClient.new.perform('divide', 11, 22)).to eq 0.5
  end
end
