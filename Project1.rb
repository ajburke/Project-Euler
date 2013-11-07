class Problem1

	def initialize(*args)
		$numbersToCheck = *args
		$total = 0
	end
=begin
	def returnSumOfMultiples
		$numbersToCheck.each do |number|
			getSumOfMultiples(number)
		end
		return $total
	end

	def getSumOfMultiples(baseNumber)
		(1..(1000-1)).each do |number|
			addMultipleIfItIsAMultipleOfBaseNumber(number, baseNumber)
		end
	end

	def addMultipleIfItIsAMultipleOfBaseNumber(number, baseNumber)
		if((number%baseNumber == 0) && (number%3 != 0))
			$total += number
		end
	end
=end
	def returnTotal
		addMultiplesofThree
		addMultiplesofFive
		return $total
	end

	def addMultiplesofThree
		counter = 3
		while counter < 1000 do
			$total += counter
			counter += 3
		end 
	end

	def addMultiplesofFive
		counter = 5
		while counter < 1000 do
			addToTotalIfNotAMultipleOfThree(counter)
			counter += 5
		end 
	end

	def addToTotalIfNotAMultipleOfThree(number)
		if(number%3 != 0)
			$total += number
		end
	end

end


answer = Problem1.new(3,5)

puts answer.returnTotal
