% Load the image
pkg load image
img = imread('app.tif');
pic = im2bw(img, im2double(uint8(128)));

% Determine the lines of the image
linesTab = getLines(pic);

% Determine for each row the columns
columnsTab  = getColumns(pic, linesTab)

% Determines the coordinates of each character
coordinatesTab = buildRectangle(pic, linesTab, columnsTab)

showRectangle(pic, linesTab, columnsTab)