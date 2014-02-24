chai = require("chai")
Calculator = require("../calculator")
calculator = new Calculator()

expect = chai.expect

describe "Calculator", ->
	it "adds two numbers", ->
		expect(calculator.add("1,2")).to.equal(3)

	it "handles a single number", ->
		expect(calculator.add("1")).to.equal(1)		

	it "returns 0 for an empty string", ->
		expect(calculator.add("")).to.equal(0)
		
	it "adds multiple numbers", ->
		expect(calculator.add("1,2,3")).to.equal(6)

	it "accepts new-line delimiters", ->
		expect(calculator.add("1\n2,3")).to.equal(6)

	it "allows the specification of a delimiter", ->
		expect(calculator.add("//#\n1#2#3")).to.equal(6)

	it "throws an exception when a number is negative", ->
		expect(calculator.add("-1")).to.throw(Calculator.inputError)