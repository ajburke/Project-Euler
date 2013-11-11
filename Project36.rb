class Project36

	def initialize
		@palindromeList = Array.new
		@base10palindromeList = Array.new
	end

	def isPalindrome?(number)
		potentialPalindrome = number.to_s.scan(/\d/).map(&:to_i)
		frontCounter = 0 
		backCounter = -1

		loop do
			if(potentialPalindrome[frontCounter] == potentialPalindrome[backCounter])
				frontCounter += 1
				backCounter -= 1
			else
				return false
			end
			break if(frontCounter > potentialPalindrome.size/2)
		end
		return true
	end

	def convertToBinary(number)
		binaryNumber = number.to_s(2).to_i
		return binaryNumber
	end

	def findAllPalindromes(upper)
		findBase10Palindromes(upper)
		@base10palindromeList.each do |number|
			if (isPalindrome?(convertToBinary(number)))
				@palindromeList << number
			end
		end
		return @palindromeList
	end

	def findBase10Palindromes(upper)
		(1..upper).each do |number|
			if(isPalindrome?(number))
				@base10palindromeList << number
			end
		end
		return @base10palindromeList
	end

	def sumPalindromes(upper)
		findAllPalindromes(upper)
		total = @palindromeList.inject(:+)
		return total
	end

end




class TestSuiteProject36
	ONEMILLION = 1000000
	ONEBILLION = 100000000000
	def test_isPalindrome?
		testProject = Project36.new
		if (testProject.isPalindrome?(100001))
			puts "test_isPalindrome? success"
		else
			puts "test_isPalindrome? failure"
		end
	end

	def test_convertToBinary
		testProject = Project36.new
		if (testProject.convertToBinary(2) == 10)
			puts "test_convertToBinary success"
		else 
			puts "test_convertToBinary failure"
		end
	end

	def test_findAllPalindromes
		testProject = Project36.new
		puts testProject.findAllPalindromes(101)
	end

	def test_sumPalindromes
		testProject = Project36.new
		testProject.sumPalindromes(ONEBILLION)
	end

end

testResults = TestSuiteProject36.new

testResults.test_isPalindrome?
testResults.test_convertToBinary
testResults.test_findAllPalindromes
puts testResults.test_sumPalindromes