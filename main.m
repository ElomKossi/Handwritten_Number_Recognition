% Constants
m = 5;
n = 5;
maxK = 5

% -----------------------------------------------------------------------------------------
% Training

trainingKNN(m, n)
% -----------------------------------------------------------------------------------------
% Test

pic = imread('test.tif');

% Compute linesTab, columnsTab, coordinatesTab
% Show the image with rectangle
[linesTab, columnsTab, coordinatesTab] = loadPicData(pic)

% The expected result of the classification
nbeLines = size(linesTab,1)
nbeColumns = size(columnsTab,2)/2
expectedResult = zeros(nbeLines * nbeColumns, 1); % 10 * 10
for i=0:9
    expectedResult(i*nbeColumns+1 : i*nbeColumns+nbeColumns)=i;
end

% Densities + K-Nearest Neighbors
KNN(pic, linesTab, columnsTab, coordinatesTab, m, n)

% recognition statistics
drawStatistics(maxK, m, n, expectedResult, KNN, nbeColumns, nbeLines);