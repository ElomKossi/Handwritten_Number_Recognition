function [ratio] = getClassesFromProb(probs)

    [rates, sol] = getResults(probs);
    disp(sol)
    disp("\nTaux de reconnaissance par classe :")
    disp(rates)

    sizeProbs = size(probs);
    nbCorrect = 0;
    for i=1:sizeProbs(1)
            prob = probs(i,:);
            realClass = floor((i-1)/10);

            [~,indice_max] = max(prob);
            detectedClass = indice_max -1;

             if(realClass == detectedClass)
                nbCorrect = nbCorrect + 1;
            end
    end
    ratio = nbCorrect * 100 / (10 * 10);

end