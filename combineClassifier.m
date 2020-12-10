function [result] = combineClassifier(probEuclidian, probKNN, operator)

    if(isequal(size(probEuclidian), size(probKNN)))

        result = zeros(size(probEuclidian, 1),size(probEuclidian, 2));
        
        if(operator == 1) 
            
            for i=1:size(probEuclidian, 1)
                for j=1:size(probEuclidian, 2)
                    result(i, j) = (probEuclidian(i,j) + probKNN(i,j)) ./ sum(probEuclidian(i, :) + probKNN(i, :));
                end
            end

        else
            for i=1:size(probEuclidian, 1)
                for j=1:size(probEuclidian, 2)
                    result(i, j) = (probEuclidian(i,j) * probKNN(i,j)) ./ sum(probEuclidian(i, :) .* probKNN(i, :));
                end
            end
        end
    else
        display('Les deux fichiers ne contiennent pas le meme nombre d elements.');
        result = zeros();
    end

end