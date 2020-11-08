function [] = trainingKNN(m, n)

    % Training

    % Load the image
    pkg load image
    pic = im2bw(imread('app.tif'), im2double(uint8(128)));

    % Compute linesTab, columnsTab, coordinatesTab
    % Show the image with rectangle
    [linesTab, columnsTab, coordinatesTab] = loadPicData(pic)

    % Get densities
    densities = getDensities(pic, linesTab, columnsTab, coordinatesTab, m, n)
    saveToFile('densities.mat', densities)

end