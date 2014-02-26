class Calculator
	add: (numbers_string) ->
		return 0 if numbers_string is ""
		
		new Parser(numbers_string)
			.coerce(NaturalNumber.parse)
			.reduce(@sum, 0)

	sum: (acc, num) ->
		acc + num

class NaturalNumber
	@inputError = new TypeError("negative numbers are not allowed")

	@parse: (value) ->
		number = parseInt(value)	
		throw @inputError if number < 0
		number

class Parser
	delimiter: ","

	constructor: (string) ->
		@string = string

	coerce: (func) ->
		@parse()
		@toArray().map func

	toArray: ->
		@string.split(///\n|#{@delimiter}///)

	parse: ->
		if match = @string.match(/\/\/(.+?)\n(.*)/)
			[@string, @delimiter] = [match[2], match[1]]
		@

module.exports = Calculator
