class Project5

	def initialize
	end

	def findSmallestNumberEvenlyDivisibleByRange(upperLimit)
		answer = nil
		possibleAnswer = upperLimit
		loop do
			if numberIsEvenlyDivisibleByRange?(possibleAnswer, upperLimit)
				answer = possibleAnswer
			else 
				possibleAnswer += upperLimit
			end	
			break if (answer != nil)
		end
		answer
	end

	def numberIsEvenlyDivisibleByRange?(number, upperLimit)
		upperLimit.downto(1) do |n|
			if number%n != 0
				return false
			end
		end
		return true
	end

	def factorial(n)
		(1..n).inject(:*) || 1
	end
end


class TestProject5

	def test_numberIsEvenlyDivisibleByRange?
		testCase = Project5.new

		tenFact = testCase.factorial(10)

		if testCase.numberIsEvenlyDivisibleByRange?(tenFact, 10)
			puts "test_numberIsEvenlyDivisibleByRange? success"
		else
			puts "test_numberIsEvenlyDivisibleByRange? failure"
		end

	end

	def test_factorial
		testCase = Project5.new

		oneFact = testCase.factorial(1)
		fiveFact = testCase.factorial(5)
		tenFact = testCase.factorial(10)

		if oneFact == 1 && fiveFact == 120 && tenFact == 3628800
			puts "test_factorial success"
		else
			puts "test_factorial failure"
		end
	end

	def test_findSmallestNumberEvenlyDivisibleByRange
		testCase = Project5.new

		if testCase.findSmallestNumberEvenlyDivisibleByRange(10) == 2520
			puts "test_findSmallestNumberEvenlyDivisibleByRange success"
		else
			puts "test_findSmallestNumberEvenlyDivisibleByRange failure"
		end

	end

end

testAnswers = TestProject5.new

testAnswers.test_factorial
testAnswers.test_numberIsEvenlyDivisibleByRange?
testAnswers.test_findSmallestNumberEvenlyDivisibleByRange


answers = Project5.new

puts "The answer is #{answers.findSmallestNumberEvenlyDivisibleByRange(20)}"