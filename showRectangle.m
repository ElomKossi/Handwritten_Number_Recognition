function [] = showRectangle(pic, coordinatesTab)

    % On créé une fenêtre
    figure(); %3?
    % On y affiche l'image
    imshow(pic);
    % Garde l'image actuelle afin d'y ajouter les rectangles
    hold on;

    nbRectangles = size(coordinatesTab, 1);

    % for each rectangle
    for i=1:nbRectangles
        x = coordinatesTab(i, 1);
        y = coordinatesTab(i, 2);
        u = coordinatesTab(i, 3);
        v = coordinatesTab(i, 4);

        rectangle('position',[x,y,u,v],'Edgecolor','g');
    end

    hold off;

end