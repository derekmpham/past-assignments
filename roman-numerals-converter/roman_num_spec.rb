require './roman_numerals'

describe 'converts Arabic number to Roman numeral' do

  # Iterate through last key-value pair in hash
  it 'converts 1 to I' do
    expect(to_roman_numeral(1)).to eq "I"
  end

  it 'converts 2 to II' do
    expect(to_roman_numeral(2)).to eq "II"
  end

  # Iterate through V/5 key-value pair
  it 'converts 6 to VI' do
    expect(to_roman_numeral(6)).to eq "VI"
  end

  # Iterate through X/10 key-value pair
  it 'converts 11 to XI' do
    expect(to_roman_numeral(11)).to eq "XI"
  end

  # Iterate through L/50 key-value pair
  it 'converts 52 to LII' do
    expect(to_roman_numeral(52)).to eq "LII"
  end

  # Iterate through C/100 key-value pair
  it 'converts 101 to CI' do
    expect(to_roman_numeral(101)).to eq "CI"
  end

  # Iterate through D/500 key-value pair
  it 'converts 506 to DVI' do
    expect(to_roman_numeral(506)).to eq "DVI"
  end

  # Iterate through M/1000 key-value pair
  it 'converts 1494 to MCDXCIV' do
    expect(to_roman_numeral(1494)).to eq "MCDXCIV"
  end

  it 'converts 2942 to MMCMXLII' do
    expect(to_roman_numeral(2942)).to eq "MMCMXLII"
  end
end
