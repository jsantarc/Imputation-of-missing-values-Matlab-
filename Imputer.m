
function [Y] = Imputer(X,strategy,missing_values)

%For many reasons, real world datasets contain missing values, often encoded NaNs or other placeholders. 
%Insstrad  discard row columns containing missing values that comes a price of losing data which may be valuable 
%One can impute the missing values, i.e., to infer them from the known part of the data.
%The Imputer function provides basic strategies for imputing missing values, either using the mean, 
%the median or the most frequent value of the column in which the missing values are located. 
%baced on Imputer classs scikit-learn:
%scikit-learn.org/stable/modules/generated/sklearn.preprocessing.Imputer.html#sklearn.preprocessing.Imputer

%ImputerImputation transformer for completing missing values.
%Input
%strategy : string, optional (default=”mean”)
%The imputation strategy.
%If 'mean', then replace missing values using the mean along Column.
%If 'median', then replace missing values using the median along the Column.
%If 'most_frequent', then replace missing using the most frequent value along the Column.

%missing_values : integer or “NaN”, optional (default=”NaN”)
%The placeholder for the missing values. All occurrences of missing_values will be imputed. For missing values
%Output 
%Y clean data 

%check default values
switch nargin
    case 1
        strategy='mean';
        missing_values='NaN';
    case 2
        missing_values='NaN';
end


%size of matix
[numberSamples,dimensions] =size(X);

%find index values of NaN
if  strcmp(missing_values,'NaN')
    
    Location=isnan(X);
else
    
    Location=(X==missing_values);
end
ReplaceValue=0;

for n=1:dimensions;
    
    if sum(Location(:,n))>0
        
        % Calculate statistic (mean, median or mostfrequent) of all values
        %Non missing values for every column or row
        ReplaceValue=Strategy(X(~Location(:,n),n),strategy);
        
        %Replace value
        X(Location(:,n),n)=ReplaceValue;
    end  
end

Y=X;

end


function [ out] = Strategy(input,strategy)
%This function input the imputation strategy
%input: input vector
%strategy
%“mean” calculate mean of vector
%“median” calculate median vector
% “most_frequent  most frequent value along the axis.
switch strategy
    case 'mean'
        out=mean(input);
    case'median'
        out=median(input);
        
    case'most_frequent'
        out=mode(input);
        
end
end