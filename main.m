clc
clear all
close all

disp("=========== Classifieur par densités + KPPV ===========\n")
disp("Note : executer ce script pour tester une configuration particuliere")
disp("Pour obtenir un benchmark de ce classifieur, executer benchmarkEuclidian\n")

m = n = input("Veuillez saisir une valeur pour m/n : ");
k = input("Veuillez saisir une valeur pour k : ");

disp("Entrainement en cours...\n")
% training KNN classifier
trainKNN(m, n);

disp("Entrainement termine\n")
disp("Enregistrement des densités en cours...")

disp("Enregistrement termine")
disp("Les densités sont enregistres dans densities.mat\n");

% testing KNN classifier
disp("Test en cours...")
testingImg = imread('test.tif');
prob = testKNN(testingImg, m, n, k);
disp("Test termine\n")
disp("Resultats :")
[rates, sol] = getResults(prob);
disp(sol)

disp("\nTaux de reconnaissance par classe :")
disp(rates)