function [linesTab] = getLines(pic)

    % This function returns an array containing the start and end indexes of each line
    % pic: the image

    % Count the black pixels
    % Replace by 1 all numbers that exceed 50 - vertical
    picData = sum(pic<50,2);

    % Count the number of lines
    nbeLines = size(pic, 1);
    i = 1;
    j = 1;

    % Matrix creation with the number of levels
    % Matrix corresponding to the index of the first pixel and the last pixel of each line
    linesTab = zeros(10,2);

    % Store black pixel line index
    while i <= nbeLines
        if picData(i) != 0
            % Stock index
            % The index of the first black pixel
            linesTab(j, 1) = i;

            % It looks for the index of the last black pixel
            while (i<= nbeLines && picData(i) ~= 0)
               i = i+1;
            end

            if i<= nbeLines
                % The index of the last pixel
                linesTab(j, 2) = i;
                j = j+1;
            end
         end
         i= i +1;
    end

end