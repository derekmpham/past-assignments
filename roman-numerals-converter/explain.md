OVERVIEW OF ROMAN NUMERALS CONVERTER

This is a program that converts an Arabic numeral (universally used numbers, i.e. 1, 8, 36, 108, 1700, etc.) into a Roman numeral (i.e. I, VIII, etc.).

Broadly speaking, this program works by breaking down the input Arabic numeral into smaller components, translating each of these smaller components into their Roman numeral counterparts (via a reference table), and then consolidating these Roman numeral counterparts to complete the conversion.

Specifically, this program: (1) Takes the input Arabic numeral, (2) Begins comparing it to every number (in value-descending order) that has a direct "simple" Roman numeral translation (i.e. "900" to "CM", "10" to "X", "5" has a direct simple translation to "V", etc.), (3) Records the Roman numeral equivalent of the largest simple translation value that is smaller than the input Arabic numeral, (4) Subtracts this translation value from the original input Arabic numeral, and (5) Continues going down the (value-descending) translation list, iterating this process (comparing, recording Roman numeral translation, and subtracting) until our input Arabic numeral is completely reduced to a value of 0. Finally, the program returns the consolidated records of Roman numeral translations into a single Roman numeral.

________

PSEUDOCODE

1. Create Roman numeral converter method
	--> Method takes in a number as a parameter
2. Create empty Roman numeral string variable
	--> Will insert Roman numeral characters into empty string throughout iteration

3. Create Roman-to-Arabic reference hash
	--> Will iterate through hash to build up Roman numeral string
	--> Roman numerals serve as keys
	--> Arabic numerals serve as values

4. Iterate through Roman-to-Arabic reference hash (each method)
	--> Create while loop for input Arabic numeral being >= each Arabic numeral value (inside hash)
		--> Convert the Roman numeral key (that corresponds with the relevant Arabic numeral value <= input number) to a string
		--> Push converted Roman numeral into Roman numeral string variable
		--> Subtract relevant Arabic numeral value from input Arabic numeral
	--> Return Roman numeral string variable
