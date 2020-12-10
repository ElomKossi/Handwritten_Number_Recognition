function prob = testEuclidian(img, centers, d)
	% Determine the lines of the image
	linesTab = getLines(img);

	% Determine for each row the columns
	columnsTab  = getColumns(img, linesTab);

	% Determines the coordinates of each character
	rectangleCoords = buildRectangle(img, linesTab, columnsTab);

	%showRectangle(img, rectangleCoords);

	profiles = extractProfile(img, rectangleCoords, d);
	nbRectangles = size(rectangleCoords, 1);

	nbClasses = size(centers, 1);

	distances = zeros(nbRectangles, nbClasses);

	for r=1:nbRectangles
		for j=1:nbClasses
			distances(r, j) = sqrt(sum((centers(j, :) - profiles(r, :)).^2));
		end
	end

	%disp("distances = ");
	%disp(distances)

	prob = calculateProbsEuclidian(distances);
	saveToFile('probaEuclidian.mat', prob);
end