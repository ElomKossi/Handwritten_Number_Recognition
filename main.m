clc
clear all
close all

trainingImg = im2bw(imread('app.tif'), im2double(uint8(128)));
testingImg = imread('test.tif');
d = 35;
m = n = 5;
k = 2;

disp("=========== Classifieur par distance euclidienne ===========\n")


disp("Note : executer ce script pour tester une configuration particuliere")
disp("Pour obtenir un benchmark de ce classifieur, executer benchmarkEuclidian\n")

trainEucli = input("Faut-il entrainer le classifieur ? Non si le fichier a deja ete genere (o/n) :", "s");

if trainEucli == "o"
	d = input("Veuillez saisir une valeur pour d : ");
	disp("Entrainement en cours...\n")

	% training with Euclidian distance classifier
	[centers, profilesTrain] = trainEuclidian(trainingImg, d, 10);
	disp("Entrainement termine\n")
	disp("Enregistrement des centres en cours...")
	saveToFile('euclidianCenters.mat', centers);
	disp("Enregistrement termine")
	disp("Les centres sont enregistres dans euclidianCenters.mat\n");

	else
		centers = load('euclidianCenters.mat','-ascii');
		d = size(centers, 2)

end

centers = load('euclidianCenters.mat','-ascii');
% testing Euclidian distance classifier
disp("Test en cours...")
probEuclidian = testEuclidian(testingImg, centers, d);
disp("Test termine\n")
disp("Resultats :")
[rates, sol] = getResults(probEuclidian);
disp(sol)

disp("\nTaux de reconnaissance par classe :")
disp(rates)

disp("==================================================================\n")

disp("=========== Classifieur par densités + KPPV ===========\n")
disp("Note : executer ce script pour tester une configuration particuliere")
disp("Pour obtenir un benchmark de ce classifieur, executer benchmarkKNN\n")

trainEucli = input("Faut-il entrainer le classifieur ? Non si le fichier a deja ete genere (o/n) :", "s");

if trainEucli == "o"
	m = n = input("Veuillez saisir une valeur pour m/n : ");
	disp("Entrainement en cours...\n")

	% training KNN classifier
	trainKNN(m, n);
	disp("Entrainement termine\n")
	disp("Enregistrement des densités en cours...")

	disp("Enregistrement termine")
	disp("Les densités sont enregistres dans densities.mat\n");

	else
		densities = load('euclidianCenters.mat','-ascii');
		m = n = size(densities, 2);

end

% testing KNN classifier
k = input("Veuillez saisir une valeur pour k : ");
disp("Test en cours...")
probKNN = testKNN(testingImg, m, n, k);
disp("Test termine\n")
disp("Resultats :")
[rates, sol] = getResults(probKNN);
disp(sol)

disp("\nTaux de reconnaissance par classe :")
disp(rates)

disp("==================================================================\n")

disp("=========== Combinaison des classifieurs ===========\n")

AddProbs = combineClassifier(probEuclidian, probKNN, 1);
disp('Résultats par la somme des probabilités calculées par chacun des classifieurs :');
ratio = getClassesFromProb(AddProbs);
display(ratio)

ProdProbs = combineClassifier(probEuclidian, probKNN, 2);
disp('Résultats par le produit des probabilités calculées par chacun des classifieurs :');
ratio = getClassesFromProb(ProdProbs);
display(ratio)
