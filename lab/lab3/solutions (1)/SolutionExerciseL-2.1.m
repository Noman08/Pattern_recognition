% Iris data processing script
 

load "/Uebungen/PAT/2016/Exercise3/Practical/data/iris_data.mat"
load "/Uebungen/PAT/2016/Exercise3/Practical/data/iris_species.mat"
 

%% Task 1: Organize the data in a 50 x 4 x 3 arry named iris
setosa_indices = strcmp("setosa",species);
setosa = meas(setosa_indices,:);
 
versicolor_indices = strcmp('versicolor',species);
versicolor = meas(versicolor_indices,:);
 
virginica_indices = strcmp('virginica',species);
virginica = meas(virginica_indices,:);
 
iris = cat(3,setosa,versicolor,virginica);
 
%% Task 2: Combine data with additional meta data in a cell array named iris1
iris1 = cell(51,5,3); % Container variable
 
% { in {'Obs'} is required to obtain the string 'Obs' (with ')
obsnames = strcat({'Obs'},num2str((1:50)','%d')); % '%d' is a format string
iris1(2:end,1,:) = repmat(obsnames,[1 1 3]);
 
varnames = {"SepalLength","SepalWidth",...
            "PetalLength","PetalWidth"};
iris1(1,2:end,:) = repmat(varnames,[1 1 3]);
 
% convert the plant data to cell format and insert it into the array
iris1(2:end,2:end,1) = num2cell(setosa);
iris1(2:end,2:end,2) = num2cell(versicolor);
iris1(2:end,2:end,3) = num2cell(virginica);
 
iris1{1,1,1} = "Setosa";
iris1{1,1,2} = "Versicolor";
iris1{1,1,3} = "Virginica";

%% Task 4: Define container variables setosa, versicolor and virginica and fill them

% get data subsets from cell array
setosa = reshape([iris1{2:51, 2:5, 1}], 50, 4);
versicolor = reshape([iris1{2:51, 2:5, 2}], 50, 4);
virginica = reshape([iris1{2:51, 2:5, 3}], 50, 4);

%% Task 5: Compute mean and variance of Iris Versicolors sepal length and width and write them to cell array mv_array.
mv_array = cell(3, 5);
mv_array(2:3,1) = {"mean", "variance"}';  % '
 
mv_array(2,2:5) = num2cell(mean(double(versicolor(:,1:4))));
mv_array(3,2:5) = num2cell(var(double(versicolor(:,1:4))));
 
% label the different variables
mv_array(1,2:5) = varnames;

% print cell array
printcell(mv_array);

%% Task 6: Generate scatter plots

% setosa versus versicolor
% sepal length and width
figure(1);
hold on;
plot(setosa(:,1),setosa(:,2),"bo");
plot(versicolor(:,1),versicolor(:,2),"gx");
xlabel("Sepal Length");
ylabel("Sepal Width");
title("Setosa and Versicolor");
legend("Setosa", "Versicolor");

% setosa versus virginica
% sepal length and width
figure(2);
hold on;
plot(setosa(:,1),setosa(:,2),"bo");
plot(virginica(:,1),virginica(:,2),"r*");
xlabel("Sepal Length");
ylabel("Sepal Width");
title("Setosa and Virginica");
legend("Setosa", "Virginica");
 
% versicolor versus virginica
% sepal length and width
figure(3);
hold on;
plot(versicolor(:,1),versicolor(:,2),"gx");
plot(virginica(:,1),virginica(:,2),"r*");
xlabel("Sepal Length");
ylabel("Sepal Width");
title("Virginica and Versicolor");
legend("Versicolor", "Virginica");

% setosa versus virginica
% sepal length and width
figure(4);
hold on;
plot(setosa(:,1),setosa(:,2),"bo");
plot(versicolor(:,1),versicolor(:,2),"gx");
plot(virginica(:,1),virginica(:,2),"r*");
xlabel("Sepal Length");
ylabel("Sepal Width");
title("Setosa and Versicolor and Virginica");
legend("Setosa", "Versicolor", "Virginica");
 
