class Project4

	def initialize
	end

	def calculateUpperLimitFromNumberOfDigits(numberOfDigits)
		maxNumber = (10**numberOfDigits) - 1
		upperLimit = maxNumber*maxNumber
	end

	def buildPalindromeFromOptions(palindromeHalf, isOddLengthOfDigits, middleDigit)
		
		if isOddLengthOfDigits 
			palindrome = palindromeHalf.to_s + middleDigit.to_s + palindromeHalf.to_s.reverse!
		else
			palindrome = palindromeHalf.to_s + palindromeHalf.to_s.reverse!
		end
		
		palindrome.to_i
		
	end

	def findHighestPalindromeFromSetNumberOfDigits(digitLength)
		upperLimit = calculateUpperLimitFromNumberOfDigits(digitLength)
		maxLength = upperLimit.to_s.size
		maxPalindromeHalf = String.new

		(0...(maxLength/2)).each do |n|
			maxPalindromeHalf << "9"
		end
		maxPalindromeHalf = maxPalindromeHalf.to_i

		if (maxLength%2) == 0
			(maxPalindromeHalf).downto(1) do |n|
				palindrome = buildPalindromeFromOptions(n, false, nil)
					if isNumberFactorOfNLengthDigits?(palindrome, digitLength)
						return palindrome
					end
			end
		else
			(maxPalindromeHalf).downto(1) do |n|
				(0..9).each do |middleDigit|
					palindrome = buildPalindromeFromOptions(n, true, middleDigit)
						if isNumberFactorOfNLengthDigits?(palindrome, digitLength)
							return palindrome
						end
				end
			end
		end

		return "No palindrome within range"
	end

	def isNumberFactorOfNLengthDigits?(number, nLength)
		maxFactorNumber = (10**nLength) - 1
		minFactorNumber = 10**(nLength-1)

		maxFactorNumber.downto(minFactorNumber) do |n| 
			if number%n == 0 && (number/n).to_s.size == nLength
				return true
			end
		end
		return false
	end

end

class TestProject4

	def test_calculateUpperLimitFromNumberOfDigits
		testCase = Project4.new
		upperLimit = testCase.calculateUpperLimitFromNumberOfDigits(3)

		if upperLimit == 998001
			puts "test_calculateUpperLimitFromNumberOfDigits success"
		else
			puts "test_calculateUpperLimitFromNumberOfDigits failure"
		end

	end

	def test_buildPalindromeFromOptions
		testCase = Project4.new
		oddLengthPalindrome = testCase.buildPalindromeFromOptions(999, true, 2)
		evenLengthPalindrome = testCase.buildPalindromeFromOptions(999, false, nil)
		if oddLengthPalindrome == 9992999 && evenLengthPalindrome == 999999
			puts "test_buildPalindromeFromOptions success"
		else
			puts "test_buildPalindromeFromOptions failure"
		end
	end

	def test_findHighestPalindromeFromSetNumberOfDigits
		testCase = Project4.new
		upperLimit = testCase.calculateUpperLimitFromNumberOfDigits(3)
		highestPalindrome = testCase.findHighestPalindromeFromSetNumberOfDigits(3)

		if highestPalindrome == 906609
			puts "test_findHighestPalindromeFromSetNumberOfDigits success"
		else
			puts "test_findHighestPalindromeFromSetNumberOfDigits failure"
		end
	end

	def test_isNumberFactorOfNLengthDigits?
		testCase = Project4.new
		isAProduct = 10000
		isNotAProduct = 10001
		#
		if !testCase.isNumberFactorOfNLengthDigits?(isNotAProduct, 3) && testCase.isNumberFactorOfNLengthDigits?(isAProduct, 3)
			puts "test_isFactorOfNLengthDigits success"
		else
			puts "test_isFactorOfNLengthDigits failure"
		end
	end

end

testAnswers = TestProject4.new
testAnswers.test_calculateUpperLimitFromNumberOfDigits
testAnswers.test_buildPalindromeFromOptions
testAnswers.test_isNumberFactorOfNLengthDigits?
testAnswers.test_findHighestPalindromeFromSetNumberOfDigits

answers = Project4.new

puts answers.findHighestPalindromeFromSetNumberOfDigits(3)

=begin
9779
math notes
10000
998001


100-999 * 100-999
=end