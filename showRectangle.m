function [] = showRectangle(linesTab, columnsTab)

    % On créé une fenêtre
    figure(); %3?
    % On y affiche l'image
    pic = imread('app.tif');
    imshow(pic);
    % Garde l'image actuelle afin d'y ajouter les rectangles
    hold on;

    nbeLines = size(linesTab, 1);
    nbeColumns = size(columnsTab, 2);

    k = 1;
    for i=1:nbeLines
        for j=1:2:nbeColumns-1
            % retrieve the character
            retrieveCharacter = getLines(pic(linesTab(i, 1):linesTab(i, 2), columnsTab(i, j):columnsTab(i, j+1)))

            % retrieve character coordinates
            x = columnsTab(1, j);
            y = retrieveCharacter(1, 1) + linesTab(i, 1);
            u = columnsTab(i, j+1);
            v = retrieveCharacter(1, 2) + linesTab(i, 1);

            rectangle('position',[x,y,u,v],'Edgecolor','g')

            k = k+1;
        end
    end

end