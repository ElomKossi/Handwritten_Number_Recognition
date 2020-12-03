function [result] = combineClassifier(probEuclidian, probKNN, operator)

    disp(operator)
    if(isequal(size(probEuclidian), size(probKNN)))
        result = zeros(size(probEuclidian, 1),size(probEuclidian, 2));
        for i=1:size(probEuclidian, 1)
            for j=1:size(probEuclidian, 2)
                if(operator == 1)
                    result(i, j) = (probEuclidian(i,j) + probKNN(i,j)) ./ sum(probEuclidian(i, :) + probKNN(i, :));
                else
                    result(i, j) = (probEuclidian(i,j) * probKNN(i,j)) ./ sum(probEuclidian(i, :) .* probKNN(i, :));
                end
            end
        end
    else
        display('Les deux fichiers ne contiennent pas le même nombre d éléments.');
        result = zeros();
    end

end