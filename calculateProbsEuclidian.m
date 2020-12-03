function prob = calculateProbsEuclidian(distances)

	nbRectangles = size(distances, 1);
	prob = zeros(nbRectangles, 10);

	for r=1:nbRectangles
		for i=1:10
			prob(r, i) = exp(-distances(r, i)) ./ sum(exp(-distances(r, :)));
		end
	end
end