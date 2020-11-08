% Constants
m = 5;
n = 5;
maxK = 5
test = true;
% -----------------------------------------------------------------------------------------
% Test

pic = imread('test.tif');

% Determine the lines of the image
linesTab = getLines(pic);

% Determine for each row the columns
columnsTab  = getColumns(pic, linesTab)

% Determines the coordinates of each character
coordinatesTab = buildRectangle(pic, linesTab, columnsTab)

% Shox image with rectangle
showRectangle(pic, coordinatesTab)

% Get densities
densities = getDensities(pic, linesTab, columnsTab, coordinatesTab, m, n)

% Load training data
trainData=load('densities.mat','-ascii');