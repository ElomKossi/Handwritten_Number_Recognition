function [columnsTab]  = getColumns(pic, linesTab)

    % This function returns for each row the columns that make it up.
    % pic: the image
    % linesTab: Table of indices for the beginning and end of each line

    nbeLines = size(linesTab, 1);
    nbeColumns = size(pic, 2);

    % Matrix corresponding to the index of the first pixel and the last pixel of each column of each line
    % 40 because there are 20 columns and for each column we have to return the index at the beginning and end of each column
    %columnsTab = zeros(nbeLines, 40)

    for i = 1:nbeLines
        % Retrieve the column corresponding to each row of the matrix returned by the line function (for each start and end index)
        colomnData = pic(linesTab(i,1):linesTab(i,2), 1:nbeColumns);
        % Count the number of black pixels on each column
        picData = sum(colomnData<1)

        j = 1;
        k = 1;
        % Stores column indices
        while j <= nbeColumns
            if picData(j) ~= 0
                % Saves the index of the first pixel of the character
                columnsTab(i, k) = j;

                % It looks for the index of the last black pixel
                while (j <= nbeColumns && picData(j) ~= 0)
                    j = j+1;
                end

                if j <= nbeColumns
                    k = k+1; % Position on the index to save the last pixel
                    % Saves the index of the last pixel of the character
                    columnsTab(i, k) = j;
                    k = k+1; % Position yourself on the index to record the first pixel of the next character.
                end
            end
            j = j+1;
        end
    end

end