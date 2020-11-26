function rates =  showResults(prob)

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

		%[m, ind] = find(prob == max(prob(i, :)))
		%column = ind2sub(size(prob),ind)

		%sol(j, i) = indexMax-1

		% if mod(j, 10) == 0
		%  	j = 1;
		% else
		%  	j = j+1;
		% end

		%fprintf("%d, %d", offsetX, offsetY);
		%disp("")

		sol(offsetX, offsetY) = indexMax-1;

		if(mod(i, 10) == 0)
			offsetY = 1;
			offsetX += 1;
		else
			offsetY += 1;
		end

		 % fprintf(" %d ", indexMax-1);% index - 1 because on matlab index starts at 1 and not 0 (and I want 0 as a result)

		 % if mod(i, 10) == 0
		 % 	disp("")
		 % end
	end

	%disp("===")

	%disp(sol)
	%disp("===")

	for i=1:10
		rates(1, i) = sum(sol(i, :) == i-1);
	end

	rates = rates * 10; % 10 rectangles per line so rates = (rates / 10)*100 = rates *10

	%rates = rates ./ nbRectangles
end