function drawStatistics(maxK, m, n, expectedResult, KNN, nbeColumns, nbeLines)

    % dim = size(expectedResult, 1);
    % rates = zeros(nbeLines, 1);
    % % 0:10:90
    % for i=0:nbeColumns:dim-nbeColumns
    %     rates((i/nbeColumns)+1) = (nbeColumns - nnz(expectedResult(i+1:i+nbeColumns) - KNN(i+1:i+nbeColumns)))*100/nbeColumns;
    % end

    % figure
    % bar(0:nbeLines-1, transpose(rates));

    % title({['Recognition rate per digit with k=',num2str(maxK),', m=',num2str(m),', n=',num2str(n)]});

    % xlabel('Number to be recognized');
    % ylabel('Number recognition rate');

end