class XORer

	def initialize
	end	
	
	def generateRandomKey(length = 10)
		randomKey = String.new
		(1..length).each do 
			randomKey << Random.rand(0..9).to_s
		end
		return randomKey
	end

	def encryptTextWithKey(text, key)
		textInBytesArray = convertStringToByteArray(text)
		keyInBytesArray = convertStringToByteArray(key)
		encryptedtextInBytesArray = Array.new

		(0...textInBytesArray.size).each  do |index|
			encryptedtextInBytesArray[index] =  textInBytesArray[index] ^ keyInBytesArray[index%keyInBytesArray.size]
		end

		return encryptedtextInBytesArray
	end

	def convertStringToByteArray(string)
		return string.bytes.to_a
	end

	def convertByteArrayToString(byteArray)
		convertedString = String.new

		byteArray.each do |n|
			convertedString << n.chr
		end

		return convertedString
	end

	def unencryptTextWithKey(text, key)
		textInBytesArray = convertStringToByteArray(text)
		keyInBytesArray = convertStringToByteArray(key)
		unencryptedTextInBytesArray = Array.new

		(0...textInBytesArray.size).each do |index|
			unencryptedTextInBytesArray[index] = textInBytesArray[index] ^ keyInBytesArray[index]
		end

		return unencryptedTextInBytesArray
	end
end



class Test_XORer

	def test_generateRandomKey(numberOfTestCases = 10)
		testXORer = XORer.new
		testCases = Array.new

		(1..numberOfTestCases).each do
			testCases << testXORer.generateRandomKey(20)
		end

		if testCases[0] == nil
			puts "test_generateRandomKey failure"
		elsif(testCases.detect{|value| testCases.count(value) > 1 })
			puts "test_generateRandomKey failure"
		else
			puts "test_generateRandomKey success"
			#puts testCases
		end
	end

	def test_encryptTextWithKey
		testXORer = XORer.new
		helloWorld = "xor"
		key = "978"
		helloWorldByteArray = testXORer.convertStringToByteArray(helloWorld)
		#[120, 111, 114]
		keyByteArray = testXORer.convertStringToByteArray(key)
		#[57, 55, 56]

		
		encryptedTextArray = testXORer.encryptTextWithKey(helloWorld, key)
		
		(0...encryptedTextArray.size).each do |index|
			if (encryptedTextArray[index] == (helloWorldByteArray[index] ^ keyByteArray[index]))
				puts "#{encryptedTextArray[index]} encrypted correctly"
			else
				puts "#{encryptedTextArray[index]} encrypted incorrectly, failure"
				return
			end
		end
		return puts "test_encryptTextWithKey success"

	end

	def test_convertStringToByteArray
		testXORer = XORer.new

		testCase = testXORer.convertStringToByteArray("hello world")

		if (testCase.class == Array) && (testCase.all?{|value| value.is_a? Fixnum})
			puts "test_convertStringToByteArray success"
			puts testCase
		else
			puts "test_convertStringToByteArray failure"
		end
	end

	def test_convertByteArrayToString
		testXORer = XORer.new
		byteArray = [65, 88, 74]
		expectedString = "AXJ"

		testCase = testXORer.convertByteArrayToString(byteArray)

		if testCase == expectedString
			puts "test_convertByteArrayToString success"
		else
			puts "test_convertByteArrayToString failure"
		end
	end

	def test_unencryptTextWithKey
		testXORer = XORer.new
		encryptedText = "AXJ"
		key = "978"
		encryptedTextByteArray = testXORer.convertStringToByteArray(encryptedText)
		keyByteArray = testXORer.convertStringToByteArray(key)

		unencryptedTextArray = testXORer.unencryptTextWithKey(encryptedText, key)

		(0...unencryptedTextArray.size).each do |index|
			if (unencryptedTextArray[index] == encryptedTextByteArray[index] ^ keyByteArray[index])
				puts "#{unencryptedTextArray[index]} unencrypted correctly"
			else
				puts "#{unencryptedTextArray[index]} unencrypted incorrectly, failure"
				return
			end
		end
		return puts "test_unencryptTextWithKey success"
	end
	
end


testAnswers = Test_XORer.new

testAnswers.test_generateRandomKey
testAnswers.test_convertStringToByteArray
testAnswers.test_encryptTextWithKey
testAnswers.test_convertByteArrayToString
testAnswers.test_unencryptTextWithKey