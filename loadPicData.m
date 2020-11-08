function [linesTab, columnsTab, coordinatesTab] = loadPicData(pic)

    % Compute linesTab, columnsTab, coordinatesTab
    % Show the image with rectangle

    % Determine the lines of the image
    linesTab = getLines(pic);

    % Determine for each row the columns
    columnsTab  = getColumns(pic, linesTab)

    % Determines the coordinates of each character
    coordinatesTab = buildRectangle(pic, linesTab, columnsTab)

    % Show image with rectangle
    % showRectangle(pic, coordinatesTab)

end