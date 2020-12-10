clear
clc

close all

trainingImg = im2bw(imread('app.tif'), im2double(uint8(128)));
testingImg = imread('test.tif');
m = n = 5;
k = 2;

launchEuclidian;
probEuclidian = load('probaEuclidian.mat','-ascii');

tmp = input("Appuyer sur \"entree\" pour passer au classifieur par densites + KPPV\n");

disp("\n==================================================================")
disp("==================================================================\n")

launchKNN;
probKNN = load('probaKNN.mat','-ascii');

disp("\n==================================================================")
disp("==================================================================\n")

tmp = input("Appuyer sur \"entree\" pour passer a la combinaison\n");

disp("=========== Combinaison des classifieurs ===========\n")

AddProbs = combineClassifier(probEuclidian, probKNN, 1);
disp('Resultats par la somme des probabilites calculees par chacun des classifieurs :');
[rates1, sol1] = getResults(AddProbs);
disp(sol1)

disp("\nTaux de reconnaissance par classe :")
disp(rates1)

ProdProbs = combineClassifier(probEuclidian, probKNN, 2);
disp("\nResultats par le produit des probabilites calculees par chacun des classifieurs :");
[rates2, sol2] = getResults(ProdProbs);
disp(sol2)

disp("\nTaux de reconnaissance par classe :")
disp(rates2)
