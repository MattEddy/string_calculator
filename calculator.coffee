class Calculator
	@inputError = new TypeError("negative numbers are not allowed")

	add: (numbers_string) ->
		return 0 if numbers_string is ""
		numbers = new Parser(numbers_string).coerce(@stringToNumber)
		sum = 0
		for num in numbers
			sum += num
			@rejectNegatives() if num < 0
		sum
	
	stringToNumber: (value) -> 
		parseInt(value)

	rejectNegatives: ->
		throw @inputError

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
