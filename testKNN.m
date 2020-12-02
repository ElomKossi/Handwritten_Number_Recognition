function [probs] = testKNN(pic, m, n, k)

    % Densities + K-Nearest Neighbors


    % Compute linesTab, columnsTab, coordinatesTab
    % Show the image with rectangle
    [linesTab, columnsTab, coordinatesTab] = loadPicData(pic);

    % Get densities
    densities = getDensities(pic, linesTab, columnsTab, coordinatesTab, m, n);
    densities_3d = reshape(densities,[10*10, m,n]);

    % Load training data
    trainData = load('densities.mat','-ascii');
    % convert a 2d matrix to a 3d matrix
    trainData_3d = reshape(trainData,[20*10, m,n]);

    % KNN recovery
    %[KNNClasses, KNN] = getKNN(k, densities, trainData)
    probs = getKNN(k, densities_3d, trainData_3d, m, n);

    % Calculation of probabilities
    %probs2 = calculateProbsKNN(KNN, k);
    %saveToFile('probaKNN.mat', probs2);
end