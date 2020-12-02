pkg load image

clear
clc

trainingImg = im2bw(imread('app.tif'), im2double(uint8(128)));
testingImg = imread('test.tif');


rates = zeros(10, 10);

i = 1;

D=5:10:95;

for d = D
	fprintf("d = %d\n", d)

	disp("\t Entrainement en cours...")
	[centers, profilesTrain] = trainEuclidian(trainingImg, d, 10);
	disp("\t Entrainement termine")

	disp("\t Test en cours...")
	prob = testEuclidian(testingImg, centers, d);
	disp("\t Test termine")

	[r, sol] = getResults(prob);

	rates(i, :) = r;
	i += 1;
end

globalAccuracy = zeros(10, 1);

for j=1:10
	globalAccuracy(j, 1) = mean(rates(j, :));
end

figure
plot(D, globalAccuracy);
xlabel("d");
ylabel("Taux de reconnaissance global");
title("Taux de reconnaissance global en fonction de d");

figure

for j=1:10

	individualRate = rates(:, j);

	subplot(5, 2, j);
	plot(D, individualRate);
	xlabel("d")
	ylabel("Taux de reconnaissance")
	title(["Taux de reconnaissance du chiffre " num2str(j-1)])
	ylim([0 100])
end
