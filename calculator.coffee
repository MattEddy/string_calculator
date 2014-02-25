class Calculator
	@inputError = new TypeError("negative numbers are not allowed")
	@delimiter
	@numbers_string

	add: (numbers_string) ->
		@numbers_string = numbers_string
		return 0 if @numbers_string is ""
		delimiterController = new DelimiterController(@numbers_string)
		@delimiter = delimiterController.parseDelimiter()
		@numbers_string = delimiterController.numbers
		@sumArray(@splitIntoArray())

	splitIntoArray: (numbers_string) ->
		@numbers_string.split(///\n|#{@delimiter}///)

	sumArray: (numbers)	->
		sum = 0
		for num in numbers
			sum += parseInt(num)
			if parseInt(num) < 0
				@rejectNegatives()
		sum

	rejectNegatives: ->
		throw @inputError

class DelimiterController
	@delimiter
	@numbers
	constructor: (numbers_string) ->
		@numbers = numbers_string

	parseDelimiter: ->
		match = @numbers.match(/\/\/(.+?)\n(.*)/)
		if match
			@numbers = match[2]
			@delimiter = match[1]
		else
			@delimiter = ","
		return @delimiter

	numbers: ->
		@numbers


module.exports = Calculator