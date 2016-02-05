clear all
close all

%Imputation of missing values



X=[1, NaN,3; NaN,100,10; 1,100,10; 1,100,NaN]
missing_values='NaN';
strategy='mean'
%Replace NaN with the mean value of that column 
X
[Ymean] = Imputer(X)

missing_values='NaN';
strategy='most_frequent'
%Replace NaN with the mostfrequent value of that column 
X
[Yfrequent] = Imputer(X,strategy)

X=[1000, 1,3;1000,100,10; 100,1000,10; 100,100,1]

missing_values=1000;
strategy='mean'
%Replace NaN with the mostfrequent value of that column 
X
[Y] = Imputer(X,strategy,missing_values)