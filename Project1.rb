class Problem1

	def initialize(*args)
		$numbersToCheck = *args
		$total = 0
		$multipleList = Array.new
	end

	def returnTotal
		removeNonNumerics
		findMultiplesOf($numbersToCheck)
		sumMultipleList
		return $total
	end

	def removeNonNumerics
		$numbersToCheck.each do |number|
			if $numbersToCheck[number].is_a?(Numeric)
				#leave number in the list of numbers to check
				else
					$numbersToCheck.delete_at(number)
			end
		end
	end

	def findMultiplesOf(numbers)

		$numbersToCheck.each do | number |
			counter = number
			while counter < 1000 do
				addToMultipleArrayIfNotAlreadyIncluded(counter)
				counter += number
			end 
		end
	end

	def addToMultipleArrayIfNotAlreadyIncluded(number)
		if $multipleList.include?(number)
			#if the multiple is already in the list, dont do anything
			else
				$multipleList << number
		end
	end

	def sumMultipleList
		$multipleList.each do |multiple|
			$total += multiple
		end
	end

end


answer = Problem1.new(3,5)

puts answer.returnTotal
