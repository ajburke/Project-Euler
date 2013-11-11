class Project3

	PrimeList = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
	
	
	def initialize
		@currentPrime = 2
		@largestFactor = 2
	end

	def isFactor?(number, factor)
		if number % factor == 0
			updateLargestFactor(factor)
			return true
		else
			return false
		end
	end

	def getNextPrimeFromList
		@currentPrime = PrimeList[PrimeList.index(@currentPrime) + 1]
	end

	def getNextPrimeAfter(number)
		return
	end

	def updateLargestFactor(factor)
		if factor > @largestFactor
			@largestFactor = factor
		end
	end

	def solve(number)
	
		if isFactor?(number, @currentPrime)

			if number == @currentPrime				
				return @largestFactor
			else
				number = number/@currentPrime
				@currentPrime = PrimeList[0]
				return solve(number)
			end
		else
			@currentPrime = getNextPrimeFromList
			return solve(number)
		end
		return @currentPrime
	end

end


answer = Project3.new
puts answer.solve(100)