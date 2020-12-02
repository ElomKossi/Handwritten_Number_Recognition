function [densities_2d] = getDensities(pic, linesTab, columnsTab, coordinatesTab, m, n)

    % This classifier is based on the KPPV method (K closest neighbor).
    % The numbers are cut out of the image in the same way,
    % and the white pixel density of the number is calculated in a number of areas.
    % m = n = 5

    nbeLines = size(linesTab, 1);
    nbeColumns = size(columnsTab, 2) / 2;

    sizeCoordTab = size(coordinatesTab);

    densities = zeros(nbeLines * nbeColumns, m, n);

    for i=1:sizeCoordTab(1)
        % Return the character
        subPic = pic(coordinatesTab(i, 2):coordinatesTab(i, 4) + coordinatesTab(i, 2), ...
            coordinatesTab(i, 1):coordinatesTab(i, 3) + coordinatesTab(i, 1));
        [line, column] = size(subPic);

        % Returns a row vector of n+1(m+1) evenly spaced points between 1 and line(column).
        % Rounds each element to the nearest integer less than or equal to that element.
        startLine = 1;
        startColumn = 1;
        endLine = round(line/m);
        endColumn = round(column/n);

        % Compute of the area to calculate the density of white pixels
        areaZone = line * column;

        % Density Calculation
        vect = zeros(m, n);

        % For each area
        for j=1:m % m - Vertical
            for l=1:n % n - Horizontal
                % Extraction of pixels from the area
                zone = subPic(startLine:endLine, startColumn:endColumn);

                % Sum of the elements of the area
                % binary image -> is the number of white pixels in the image
                whitePixel = sum(zone(:));

                % Move to the next area in column
                startColumn = startColumn + round(column/n);
                endColumn = endColumn + round(column/n);

                % If we are in the last zone, we make sure to finish on the last pixel of this one
                if startColumn + round(column/n) > column
                    endColumn = column - 1;
                end

                % Given that the numbers do not have the same size, we normalize them
                vect(j, l) = (whitePixel*100)/areaZone;
            end

            % Move to the next line // m+=1 && n=1
            startLine = endLine + 1;
            startColumn = 1;
            endLine = endLine + round(line/m);
            endColumn = round(column/n);

            % Last pixel check
            if startLine + round(line/m) > line
                endLine = line - 1;
            end
        end
        densities(i,:,:) = vect;
    end

    % convert a 3d matrix to a 2d matrix
    %densities_2d = reshape(densities,[nbeColumns*10, m*n]);
    densities_2d = reshape(densities,[],size(densities,2),1);

end