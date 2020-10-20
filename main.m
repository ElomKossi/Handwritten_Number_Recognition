% Load the image
pic = imread('app.tif');

% Determine the lines of the image
linesTab = getLines(pic);

% Determine for each row the columns
columnsTab  = getColumns(pic, linesTab)

% Determines the coordinates of each character
coordinatesTab = buildRectangle(pic, linesTab, columnsTab)