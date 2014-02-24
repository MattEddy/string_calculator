// Generated by CoffeeScript 1.4.0
(function() {
  var Calculator, DelimiterController;

  Calculator = (function() {

    function Calculator() {}

    Calculator.inputError = new TypeError("negative numbers are not allowed");

    Calculator.prototype.add = function(numbers) {
      var delimiter, delimiterController, num, sum, _i, _len;
      if (numbers === "") {
        return 0;
      }
      delimiterController = new DelimiterController(numbers);
      delimiter = delimiterController.parseDelimiter();
      numbers = delimiterController.numbers;
      numbers = numbers.split(RegExp("\\n|" + delimiter));
      sum = 0;
      for (_i = 0, _len = numbers.length; _i < _len; _i++) {
        num = numbers[_i];
        sum += parseInt(num);
        if (parseInt(num) < 0) {
          this.rejectNegatives();
        }
      }
      return sum;
    };

    Calculator.prototype.rejectNegatives = function() {
      throw this.inputError;
    };

    return Calculator;

  })();

  DelimiterController = (function() {

    DelimiterController.delimiter;

    DelimiterController.numbers;

    function DelimiterController(numbers_string) {
      this.numbers = numbers_string;
    }

    DelimiterController.prototype.parseDelimiter = function() {
      var match;
      match = this.numbers.match(/\/\/(.+?)\n(.*)/);
      if (match) {
        this.numbers = match[2];
        this.delimiter = match[1];
      } else {
        this.delimiter = ",";
      }
      return this.delimiter;
    };

    DelimiterController.prototype.numbers = function() {
      return this.numbers;
    };

    return DelimiterController;

  })();

  module.exports = Calculator;

}).call(this);
