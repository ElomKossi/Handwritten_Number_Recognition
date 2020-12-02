function [probs] = calculateProbsKNN(KNN,  k, densities)

    % Calculation of the probability that each number belongs to each of the 10 classes

    sizeDensities = size(densities(1));
    probs=zeros(sizeDensities, 10);

    for i=1:sizeDensities
        for j=1:10
            % Counts the number of values in  that are within each specified bin range (0:9)
            probs(i, j) = (histc(KNN(:), j))/k;
        end
    end

end