%Polynomial regression
% Setup
clear; clc; close all

% Set seed for reproducibility
seed = rng(123);

% Load data
input_file = 'Data/Test_data.csv';
input = csvread(input_file,1,0);
x = input(:,1:6); %input data
y = input(:,7); %target outputs

test_perc = 0.2; %percent of data to randomly cast into test set

% Call function below that divides the data into train and test set
[x_train,x_test,t_train,t_test] = divide_data(x,y,test_perc);

% Fit a response surface to the data
mdl = fitlm(x_train,t_train,'quadratic');

% Predict the output (y_hat) for the training and test sets
y_train = predict(mdl,x_train);
y_test = predict(mdl,x_test);

% Call the make plots function
Make_Plots(y_train, t_train, y_test, t_test)


function [x_train,x_test,y_train,y_test] = divide_data(x,y,test_perc)
% This function randomly divides the x,y datasets into a training set that
% is (1-test_perc) large and a test set that is (test_perc) large.

Q=size(x,1); % Get data size

% Determine number of entries that should be in train set
Q1=floor(Q*(1-test_perc)); 
Q2=Q-Q1; % Remaining number of entries will be in test set

% Randomly order the indices of the full dataset
ind=randperm(Q);

ind1_test=ind(1:Q1); % Take the first Q1 indices for the train set 
ind2_test=ind(Q1+(1:Q2)); % Remaining indices for test set

% Cast data into train and test sets
x_train=x(ind1_test,:); 
x_test=x(ind2_test,:);
y_train = y(ind1_test);
y_test = y(ind2_test); 
end
