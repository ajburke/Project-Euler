class Project2
	FOURMILLION = 4000000

	def initialize
		$firstTerm = 1
		$secondTerm = 2
		$nextTerm = 3
		$total = 0
		$fibonacciArray = Array.new
		$fibonacciArray << $secondTerm
	end
=begin
	def showMeValues
				
				if $nextTerm == nil
					puts "its nil"
					else
						puts $nextTerm
				end
		if $fibonacciArray == nil
			puts "its nil"
		else		
			puts $fibonacciArray
		end
	end
=end
	def returnTotal
		calculateTotal
		return $total
	end

	def calculateTotal
		generateFibonacciArray
		$fibonacciArray.each do |number|
			$total += number
		end
	end

	def generateFibonacciArray
		while ($firstTerm + $secondTerm) < FOURMILLION do
			$nextTerm = $firstTerm + $secondTerm
			addNextTermToFibonacciArrayIfItsEven($nextTerm)
			moveSequenceForwardOneStep
		end
	end

	def addNextTermToFibonacciArrayIfItsEven(singleNextTerm)
		if(singleNextTerm%2 == 0)
			$fibonacciArray << singleNextTerm
		end		
	end

	def moveSequenceForwardOneStep
		$firstTerm = $secondTerm
		$secondTerm = $nextTerm
	end

end

answer = Project2.new
#answer.showMeValues
puts answer.returnTotal