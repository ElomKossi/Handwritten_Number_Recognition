function [probs] = calculateProbsKNN(KNNClasses, maxK)

    % Calculation of the probability that each number belongs to each of the 10 classes

    line = size(KNNClasses, 1);
    probs=zeros(100, 10);

    for i=1:line
        % Counts the number of values in  that are within each specified bin range (0:9)
        N = histc(KNNClasses(i,:), 0:9);
        probs(i, :) = N./maxK;
    end

end