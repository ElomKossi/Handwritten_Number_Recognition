function [rates, sol] = getResults(prob)

	nbRectangles = size(prob, 1);

	sol = zeros(10, 10);

	j = 1;

	offsetX = 1;
	offsetY = 1;

	rates = zeros(1, 10);

	for i=1:nbRectangles
		
		maxProb = 0;
		indexMax = 1;

		for k=1:10
			if prob(i, k) > maxProb
				maxProb = prob(i, k);
				indexMax = k;
			end
		end

		sol(offsetX, offsetY) = indexMax-1;

		if(mod(i, 10) == 0)
			offsetY = 1;
			offsetX += 1;
		else
			offsetY += 1;
		end
	end

	for i=1:10
		rates(1, i) = sum(sol(i, :) == i-1);
	end

	rates = rates * 10; % 10 rectangles per line so rates = (rates / 10)*100 = rates *10
end