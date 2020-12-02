function [centers, profiles] = trainEuclidian(img, d, nbClasses)

	% Determine the lines of the image
	linesTab = getLines(img);

	% Determine for each row the columns
	columnsTab  = getColumns(img, linesTab);

	% Determines the coordinates of each character
	coordinatesTab = buildRectangle(img, linesTab, columnsTab);

	%showRectangle(img, coordinatesTab);

	profiles = extractProfile(img, coordinatesTab, d);
	centers = computeCenters(profiles, nbClasses, d);
end