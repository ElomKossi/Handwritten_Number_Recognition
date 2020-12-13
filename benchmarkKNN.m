pkg load image

clear
clc

trainingImg = im2bw(imread('app.tif'), im2double(uint8(128)));
testingImg = imread('test.tif');


% rates = zeros(10, 10);

i = 1;

M = N = 1:1:15
K = 1:1:15

for m = M
    for k = K

        fprintf("m = n = %d\n", m)
        fprintf("k = %d\n", k)

        disp("\t Entrainement en cours...")
        trainKNN(m, m);
        disp("\t Entrainement termine")

        disp("\t Test en cours...")
        prob = testKNN(testingImg, m, m, k);
        disp("\t Test termine")

        [r, sol] = getResults(prob);

        rates(k, :, m) = r;
        i += 1;
    end
end

disp("\t Préparation et affichage des données")

for m = M
    for k = K
	    globalAccuracy(k, m) = mean(rates(k, :, m));
	    %globalAccuracy(k, m) = mean(rates(k, m));
    end
end

[X,Y] = meshgrid(0.5:1:15);
figure, surf(X, Y, globalAccuracy);
xlabel("m/n");
ylabel("k");
zlabel("Taux de reconnaissance global");
title("Taux de reconnaissance global en fonction de m/n et k");

figure

for m = M
    for k = K

	individualRate = rates(:, j);

	subplot(5, 2, j);
	plot3(M, K, individualRate);
    xlabel("m/n");
    ylabel("k");
    zlabel("Taux de reconnaissance global");
	title(["Taux de reconnaissance du chiffre " num2str(j-1)])
	ylim([0 100])
end
end

disp("\t Affichage des données terminée")