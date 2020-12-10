trainingImg = im2bw(imread('app.tif'), im2double(uint8(128)));
testingImg = imread('test.tif');

disp("=========== Classifieur par distance euclidienne ===========\n")

disp("Note : executer ce script pour tester une configuration particuliere")
disp("Pour obtenir un benchmark de ce classifieur, executer benchmarkEuclidian\n")

d = input("Veuillez saisir une valeur pour d : ")
disp("Entrainement en cours...\n")

% training with Euclidian distance classifier
[centers, profilesTrain] = trainEuclidian(trainingImg, d, 10);
disp("Entrainement termine\n")
disp("Enregistrement des centres en cours...")
saveToFile('euclidianCenters.mat', centers);
disp("Enregistrement termine")
disp("Les centres sont enregistres dans euclidianCenters.mat\n");

centers = load('euclidianCenters.mat','-ascii');
% testing Euclidian distance classifier
disp("Test en cours...")
probEuclidian = testEuclidian(testingImg, centers, d);
disp("Test termine\n")

disp("Les probabilites sont enregistres dans probaEuclidian.mat\n");

disp("Resultats :")
[rates, sol] = getResults(probEuclidian);
disp(sol)

disp("\nTaux de reconnaissance par classe :")
disp(rates)