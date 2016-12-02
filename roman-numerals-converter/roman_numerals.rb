# ROMAN NUMERALS CONVERTER METHOD

def to_roman_numeral(number)
  roman_numeral = ""

  roman_ref = {
    :M => 1000,
    :CM => 900,
    :D => 500,
    :CD => 400,
    :C => 100,
    :XC => 90,
    :L => 50,
    :XL => 40,
    :X => 10,
    :IX => 9,
    :V => 5,
    :IV => 4,
    :I => 1,
  }

  roman_ref.each do |roman, num|
  	while number >= num
  	  roman_numeral += roman.to_s
  	  number -= num
  	end
  end

  roman_numeral
end
