BFN = 600851475143

#solution taken from http://www.mathblog.dk/project-euler-problem-3/
#adapted into ruby by myself
#All credit for algorithm goes to author of said blog

def getLargestPrimeFactor

	counter = 2
	newnumm = BFN
	largestFactor = 0
	loop do
		if (newnumm%counter == 0)
			newnumm = newnumm/counter
			largestFactor = counter
		else
			counter = counter + 1
		end
		break if (counter * counter > newnumm)
	end
	if newnumm > largestFactor
		largestFactor = newnumm
	end
	puts largestFactor
end


getLargestPrimeFactor