% profile structure :
% rect1 : (line1Left, line1Right, line2Left, line2Right...)
% rect2 : (line1Left, line1Right, line2Left, line2Right...)
% ...

% rectangleCoords
% top left line
% top left column
% rectangle height
% rectangle width

function profiles = extractProfile(img, rectangleCoords, d)

	nbRectangles = size(rectangleCoords, 1);

	profiles = zeros(nbRectangles, d);

	% for each rectangle
	for i=1:nbRectangles

		 % disp(rectangleCoords(i, 1))
			% disp(rectangleCoords(i, 2))
		 % 	 disp(rectangleCoords(i, 3))
		 % 	 disp(rectangleCoords(i, 4))

		topLeftCornerLine = rectangleCoords(i, 2);
		bottomLeftCornerLine = rectangleCoords(i, 2) + rectangleCoords(i, 4);

		lines = floor(linspace(topLeftCornerLine, bottomLeftCornerLine, d/2));
		nbLines = size(lines, 2);
		profileVector = zeros(1, d);

		%disp(lines)

		% profile structure :
		% rect1 : (line1Left, line1Right, line2Left, line2Right...)
		% rect2 : (line1Left, line1Right, line2Left, line2Right...)
		% ...

		% offset corresponds to the place where we can insert in the profile matrix
		offset = 1;

		%for each line 
		for l=1:nbLines

			% searching the first black pixel of the line starting left

			column = rectangleCoords(i, 1);
			blackPixelFound = 0;

			index = 0;

			while blackPixelFound == 0
				if img(lines(l), column) == 0
					blackPixelFound = 1;
				else
					column += 1;
					index += 1;
				end
			end

			% we don't need to check if column > rectangle width
			% because the construction of rectangles ensure that
			% there is at least one black pixel per line
			
			profileVector(offset) = index;
			offset += 1;

			% searching the first black pixel of the line starting right
			column = rectangleCoords(i, 1) + rectangleCoords(i, 3);
			blackPixelFound = 0;

			index = rectangleCoords(i, 3);

			while blackPixelFound == 0
				if img(lines(l), column) == 0
				 	blackPixelFound = 1;
				else
					column -= 1;
					index -=1;
				end
			end		

			profileVector(offset) = index;
			offset += 1;
		end

		% the output is finally normalized
		profiles(i, :) = profileVector / rectangleCoords(i, 3);
	end
end