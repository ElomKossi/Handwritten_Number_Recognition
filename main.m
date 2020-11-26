clc
clear all
close all
% Constants
% m = 5
% n = 5
% maxK = 5

% -----------------------------------------------------------------------------------------
% Training
% disp("Training KNN classifier...")
% trainingKNN(m, n);
% disp("Training done")
% -----------------------------------------------------------------------------------------
% Test

pic = imread('test.tif');

% The expected result of the classification
% nbeLines = size(linesTab,1);
% nbeColumns = size(columnsTab,2)/2;
% expectedResult = zeros(nbeLines * nbeColumns, 1); % 10 * 10
% for i=0:9
%     expectedResult(i*nbeColumns+1 : i*nbeColumns+nbeColumns)=i;
% end

space = ' ';
for m=1:15
    for k=1:15
        m
        k
        dlmwrite('rate.dat',m,'-append');
        dlmwrite('rate.dat',k,'-append');
        trainingKNN(m, m);
        prob = KNN(pic, m, m, k);
        rates = showResults(prob);
        s = 0;
        for i=1:10
            s = s + rates(1, i);
        end
        r = s/10
        dlmwrite('rate.dat',r,'-append');
        dlmwrite('rate.dat',space,'-append');
    end
end

% disp("Testing KNN classifier...")
% % Densities + K-Nearest Neighbors
% prob = KNN(pic, m, n, maxK);
% rates = showResults(prob)
% s = 0;
% for i=1:10
%     s = s + rates(1, i);
% end
% r = s/10;

% disp("Testing done")

% recognition statistics
%drawStatistics(maxK, m, n, expectedResult, KNN, nbeColumns, nbeLines);