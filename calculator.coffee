class Calculator
	@inputError = new TypeError("negative numbers are not allowed")

	add: (numbers) ->
		return 0 if numbers is ""

		# match = numbers.match(/\/\/(.+?)\n(.*)/)
		# if match
		# 	numbers = match[2]
		# 	delimiter = match[1]
		# else
		# 	delimiter = ","

		delimiterController = new DelimiterController(numbers)
		delimiter = delimiterController.parseDelimiter()
		numbers = delimiterController.numbers

		numbers = numbers.split(///\n|#{delimiter}///)
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