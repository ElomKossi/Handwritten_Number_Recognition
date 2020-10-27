function [coordinates] = buildRectangle(pic, linesTab, columnsTab)

    % Transforms row and column index lists into a table containing the upper left and lower right coordinates on the same row for each character.

    nbeLines = size(linesTab, 1);
    nbeColumns = size(columnsTab, 2);
    coordinates = zeros(200, 4);

    % For each number we determine the sides of the rectangle enclosing it.
    k = 1;
    for i=1:nbeLines
        for j=1:2:nbeColumns-1
            % retrieve the character
            retrieveCharacter = getLines(pic(linesTab(i, 1):linesTab(i, 2), columnsTab(i, j):columnsTab(i, j+1)))

            % retrieve character coordinates
            coordinates(k, 1) = columnsTab(i, j);
            coordinates(k, 2) = retrieveCharacter(1, 1) + linesTab(i, 1);
            coordinates(k, 3) = columnsTab(i, j+1) - columnsTab(i, j);
            coordinates(k, 4) = retrieveCharacter(1, 2) + linesTab(i, 1) - linesTab(i, 1);

            k = k+1;
        end
    end

end