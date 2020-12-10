function [] = showRectangle(pic, rectangleCoords)

    % On créé une fenêtre
    figure(); %3?
    % On y affiche l'image
    imshow(pic);
    % Garde l'image actuelle afin d'y ajouter les rectangles
    hold on;

    nbRectangles = size(rectangleCoords, 1);

    % for each rectangle
    for i=1:nbRectangles
        x = rectangleCoords(i, 1);
        y = rectangleCoords(i, 2);
        u = rectangleCoords(i, 3);
        v = rectangleCoords(i, 4);

        rectangle('position',[x,y,u,v],'Edgecolor','r');
    end

    hold off;

end