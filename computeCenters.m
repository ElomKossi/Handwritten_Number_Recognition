function centers = computeCenters(profiles, nbClasses, d)
	centers = zeros(nbClasses, d);

	first = 1;
	last = 20;

	for i=1:nbClasses

		centers(i, :) = mean(profiles(first:last, :));

		first += 20;
		last += 20;
	end
end