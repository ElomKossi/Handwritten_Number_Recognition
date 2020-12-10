trainingImg = im2bw(imread('app.tif'), im2double(uint8(128)));
testingImg = imread('test.tif');

disp("=========== Classifieur par densites + KPPV ===========\n")
disp("Note : executer ce script pour tester une configuration particuliere")
disp("Pour obtenir un benchmark de ce classifieur, executer benchmarkKNN\n")

m = n = input("Veuillez saisir une valeur pour m/n : ");
disp("Entrainement en cours...\n")

% training KNN classifier
trainKNN(m, n);
disp("Entrainement termine\n")
disp("Enregistrement des densites en cours...")

disp("Enregistrement termine")
disp("Les densites sont enregistres dans densities.mat\n");

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