function [KNNClasses, KNN] = getKNN(maxK, densities, trainData)

    % densities = test data

    densitiesLine = size(densities, 1);
    trainDataLine = size(trainData, 1);
    distances=zeros(densitiesLine, trainDataLine);
    KNNClasses=zeros(densitiesLine, maxK);
    KNN=zeros(densitiesLine, 1);

    % Calculation of the distance from the point to be classified,
    % representing the shape to be recognized, to all the points of the learning base.
    % Assignment of the most represented class among the KNN at the point
    for i=1:densitiesLine
        for j=1:trainDataLine
            % Minkowski Distance => Euclidean Distance(for p = 2)
            vect=abs(densities(i,:)-trainData(j,:));
            distances(i,j) = sqrt(sum(vect.^2));
        end
    end

    % Search for K nearest neighbors
    for i=1:densitiesLine
        for j=1:maxK
            [~, index] = min(distances(i, :));
            KNNClasses(i,j)=floor((index-1)/20);
        end
    end

    % Search for the most present K
    for i=1:densitiesLine
        %  returns the same data as in KNNClasses, but with no repetitions.
        uniqueTab = unique(KNNClasses(i, :));
        % Counts each time a number present in uniqueTab is present in the current line
        nbePresent = histc(KNNClasses(i, :), uniqueTab);
        [~,index] = max(nbePresent);
        % the most present K
        KNN(i) = uniqueTab(index);
    end

end