function  = KNN(pic, linesTab, columnsTab, coordinatesTab, m, n)

    % Densities + K-Nearest Neighbors

    % Get densities
    densities = getDensities(pic, linesTab, columnsTab, coordinatesTab, m, n)

    % Load training data
    trainData = load('densities.mat','-ascii');

    % KNN recovery
    [KNNClasses, KNN] = getKNN(maxK, densities, trainData)

    % Calculation of probabilities
    probs2 = calculateProbsKNN(KNNClasses, maxK)
    saveToFile('probaKNN.mat', probs2);
end