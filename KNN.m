function probs2 = KNN(pic, m, n, maxK)

    % Densities + K-Nearest Neighbors

    % Compute linesTab, columnsTab, coordinatesTab
    % Show the image with rectangle
    [linesTab, columnsTab, coordinatesTab] = loadPicData(pic);

    % Get densities
    densities = getDensities(pic, linesTab, columnsTab, coordinatesTab, m, n);

    % Load training data
    trainData = load('densities.mat','-ascii');

    % KNN recovery
    %[KNNClasses, KNN] = getKNN(maxK, densities, trainData)
    KNNClasses = getKNN(maxK, densities, trainData);

    % Calculation of probabilities
    probs2 = calculateProbsKNN(KNNClasses, maxK);
    saveToFile('probaKNN.mat', probs2);
end