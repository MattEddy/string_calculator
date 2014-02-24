class Calculator
	@inputError = new TypeError("negative numbers are not allowed")

	add: (numbers) ->
		return 0 if numbers is ""
		
		match = numbers.match(/\/\/(.+?)\n(.*)/)
		if match
			numbers = match[2]
			delimiter = match[1]
		else 
			delimiter = ","
	
		numbers = numbers.split(///\n|#{delimiter}///)
		sum = 0
		for num in numbers
			sum += parseInt(num)
			if parseInt(num) < 0
				@rejectNegatives() 
		sum

	rejectNegatives: ->
		throw @inputError

module.exports = Calculator