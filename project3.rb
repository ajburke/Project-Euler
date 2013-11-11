class Project3
	def createArrayofPossiblePrimes(maxNumber)
		possiblePrimes = Array.new
		(2..maxNumber).step(2) do |n|
			possiblePrimes << n
		end
		return possiblePrimes
	end



end




class Test_Project3
	THENUMBER = 600851475143
	#THEOTHERNUMBER =  600851475143/2
	def test_createArrayofPossiblePrimes
		testProject3 = Project3.new
		possiblePrimes = testProject3.createArrayofPossiblePrimes(THENUMBER)

		if possiblePrimes.size != (THENUMBER/2)
			puts  "test_createArrayofPossiblePrimes failure"
		else
			puts "test_createArrayofPossiblePrimes"
		end
	end

	def setup
		testProject3 = Project3.new
		return testProject3
	end
end

test = Test_Project3.new 
test.test_createArrayofPossiblePrimes