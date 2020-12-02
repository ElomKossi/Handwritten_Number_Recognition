function [probs] = getKNN(k, densities, trainData, m, n)

    % densities = test data

    densitiesLine = size(densities, 1);
    trainDataLine = size(trainData, 1);

    distances=zeros(densitiesLine(1), trainDataLine(1));
    % For each figure to be classified
    for i=1:densitiesLine(1)
        % Comparison with all the figures of the training base
        for j=1:trainDataLine(1)
            distance = 0;
            % We sum the distances for all the zones of this figure
            for u=1:m
                for v=1:n
                    distance = distance + abs(trainData(j, u, v) - densities(i, u, v));
                end
            end
            % We have the distance separating each of the digits of the test from the learning digits
            distances(i, j) = distance;
        end
    end

    probs = zeros(densitiesLine(1), 10);
    sizeDistances = size(distances);

    for i=1:sizeDistances(1)
        KNN = zeros(k, 2);

        % Initialization of the vectors of the nearest neighbors with the first ones values associated with this row
        for u=1:k
            KNN(u,1) = floor(((i-1)/20)+1);
            KNN(u,2) = distances(i, u);
        end

        % Replacement of the furthest neighbor by the nearest one
        for j=(k+1):sizeDistances(2)
            [maxKNN, idx] = max(KNN(:,2));

            if distances(i,j) < maxKNN
                KNN(idx,1) = (floor((j-1)/20)+1);
                KNN(idx,2) = distances(i,j);
            end
        end

        for iProb=1:10
            % Counts the number of values in  that are within each specified bin range (0:9)
            probs(i, iProb) = (histc(KNN(:), iProb))./k;
        end
    end

    saveToFile('probaKNN.mat', probs);

end