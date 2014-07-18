chai       = require("chai")
Calculator = require("../calculator")
calculator = new Calculator()

expect = chai.expect

describe "Calculator", ->
  it "adds two numbers", ->
    expect(calculator.add("1,2")).to.equal(3)
