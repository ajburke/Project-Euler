#require "test/unit"

class Project8


attr_accessor :statusArray , :theNumber
	
	def initialize 
		@statusArray = Array.new
		@theNumber = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"
		@activatedNumbers = Array.new
	end

	def turnEverythingOff

		while @statusArray.size < @theNumber.size do
			@statusArray << 0
		end
	end

	def turnOnNumber(number)

		for index in 0..@theNumber.size
			if (@theNumber[index].to_i == number.to_i)
				@statusArray[index] = 1
			end
		end
	end

	def getSetIndexes
	end

end



class Project8_Test 

	def initialize
		@testProject = Project8.new
		@testProject.turnEverythingOff
	end

	def test_turnEverythingOff
		

		if @testProject.statusArray.size == 1000
			puts "SUCCESS"
		else
			puts "WRONG"
		end

		@testProject.statusArray.each do |index|
			if index == 0
				else
				puts "something has broken"
			end
		end
	end

	def test_TurnOnNumber
		

		@testProject.turnOnNumber(9)

		failed = false

		for index in 0..@testProject.theNumber.size
			if (@testProject.theNumber[index].to_i == 9)
				if (@testProject.statusArray[index].to_i != 1)
					failed = true					
				end
			else
				if (@testProject.statusArray[index].to_i != 0)
					failed = true					
				end
			end
		end

		if (failed)
			puts "Failed"
		else
			puts "Passed"
		end

	end

	def test_getSetIndexes
		@testProject = Project8.new
		@testProject.theNumber = "1239999997"
		@testProject.turnEverythingOff
		@testProject.turnOnNumber(9)

		setIndexes = @testProject.getSetIndexes

		if setIndexes.kind_of?(Array) && setIndexes.size == 2 && setIndexes[0] == 3 && setIndexes[1] == 4
			puts "getSetIndexes success"
		else
			puts "getSetIndexes failure :("
		end
	end


end


answer = Project8_Test.new

answer.test_turnEverythingOff
answer.test_TurnOnNumber
answer.test_getSetIndexes