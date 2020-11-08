function [] = trainingKNN(m, n)

    % Training
    test = false;

    % Load the image
    pkg load image
    pic = im2bw(imread('app.tif'), im2double(uint8(128)));

    % Determine the lines of the image
    linesTab = getLines(pic);

    % Determine for each row the columns
    columnsTab  = getColumns(pic, linesTab)

    % Determines the coordinates of each character
    coordinatesTab = buildRectangle(pic, linesTab, columnsTab)

    % Show image with rectangle
    % showRectangle(pic, coordinatesTab)

    % Get densities
    densities = getDensities(pic, linesTab, columnsTab, coordinatesTab, m, n)
    saveToFile('densities.mat', densities)

end