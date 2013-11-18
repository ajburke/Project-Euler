class Project6
	def initialize
	end

	def sumSquaresOfRange(upperLimit)
		total = 0
		(1..upperLimit).each do |n|
			total += n**2
		end
		total 
	end

	def squareSumsOfRange(upperLimit)
		total = 0
		(1..upperLimit).each do |n|
			total += n
		end
		total = total**2
	end

	def findDifferenceOfSumSquares(upperLimit)
		sumOfSquares = sumSquaresOfRange(upperLimit)
		squareOfSums = squareSumsOfRange(upperLimit)

		difference = squareOfSums - sumOfSquares
	end
end

class TestProject6
	
	def test_sumSquaresOfRange
		testCase = Project6.new

		if testCase.sumSquaresOfRange(10) == 385
			puts "test_sumSquaresOfRange success"
		else
			puts "test_sumSquaresOfRange failure"
		end 
	end

	def test_squareSumsOfRange
		testCase = Project6.new

		if testCase.squareSumsOfRange(10) == 3025
			puts "test_squareSumsOfRange success"
		else
			puts "test_squareSumsOfRange failure"
		end
	end

	def test_findDifferenceOfSumSquares
		testCase = Project6.new

		if testCase.findDifferenceOfSumSquares(10) == 2640
			puts "test_findDifferenceOfSumSquares success"
		else
			puts "test_findDifferenceOfSumSquares failure"
		end
	end

end


testAnswers = TestProject6.new

testAnswers.test_sumSquaresOfRange
testAnswers.test_squareSumsOfRange
testAnswers.test_findDifferenceOfSumSquares

answers = Project6.new

puts "The answer is #{answers.findDifferenceOfSumSquares(100)}"