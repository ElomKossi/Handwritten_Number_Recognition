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

% The expected result of the classification
nbeLines = size(linesTab,1)
nbeColumns = size(columnsTab,2)/2
expectedResult = zeros(nbeLines * nbeColumns, 1); % 10 * 10
for i=0:9
    expectedResult(i*nbeColumns+1 : i*nbeColumns+nbeColumns)=i;
end

% -----------------------------------------------------------------------------------------
% Densities + K-Nearest Neighbors

% Get densities
densities = getDensities(pic, linesTab, columnsTab, coordinatesTab, m, n)

% Load training data
trainData=load('densities.mat','-ascii');

% KNN recovery
[KNNClasses, KNN] = getKNN(maxK, densities, trainData)

% Calculation of probabilities
probs2 = calculateProbsKNN(KNNClasses, maxK)
saveToFile('probaKNN.mat', probs2);