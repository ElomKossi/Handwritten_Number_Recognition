function [densities] = getDensities(pic, linesTab, columnsTab, coordinatesTab, m, n)

    % This classifier is based on the KPPV method (K closest neighbor).
    % The numbers are cut out of the image in the same way,
    % and the white pixel density of the number is calculated in a number of areas.
    % m = n = 5

    nbeLines = size(linesTab, 1);
    nbeColumns = size(columnsTab, 2) / 2;

    densities = zeros(nbeLines * nbeColumns, m * n);

    for i=1:nbeLines * nbeColumns
        % Return the character
        subPic = pic(coordinatesTab(i, 2):coordinatesTab(i, 4) + coordinatesTab(i, 2), ...
            coordinatesTab(i, 1):coordinatesTab(i, 3) + coordinatesTab(i, 1));
        [line, column] = size(subPic);

        % Returns a row vector of n+1(m+1) evenly spaced points between 1 and line(column).
        % Rounds each element to the nearest integer less than or equal to that element.
        startLine = floor(linspace(1, line, n+1));
        startColumn = floor(linspace(1, column, m+1));

        endLine = size(startLine, 2) - 1;
        endColumn = size(startColumn, 2) - 1;

        % Density Calculation
        k = 1;
        vect = ones(1, m*n);

        % For each area
        for j=1:endColumn
            for l=1:endLine
                % Calculation of the total number of pixel on the area
                nbePixel = (startLine(l+1) - startLine(l) + 1) * (startColumn(j+1) - startColumn(j) + 1);
                % Calculation of the white pixel percentage of the area (non zeri element on matrix)
                vect(1, k)=(nbePixel - nnz(subPic(startLine(l):startLine(l+1), startColumn(l):startColumn(l+1))))/nbePixel;
                k += 1;
            end
        end
        densities(i,:) = vect;
    end

end




%if test == true
%    figure
%    imshow(pic);
%    hold on

%    for j=1:endColumn + 1
%        for l=1:endLine
%            plot([coordinatesTab(i,1)+startColumn(l),coordinatesTab(i,1)+startColumn(l)],[coordinatesTab(i,2)+1,coordinatesTab(i,2)+line],'Color','r','LineWidth',2);
%            plot([coordinatesTab(i,1)+1,coordinatesTab(i,1)+column],[coordinatesTab(i,2)+startLine(j),coordinatesTab(i,2)+startLine(j)],'Color','r','LineWidth',2);
%        end
%    end

%    hold off
%end