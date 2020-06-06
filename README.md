# MATLAB Regression Results Statistics and Plots

The function [Make_Plots](Make_Plots.m) will calculate summary fit statistics and make charts to understand how a supervised learning regression model was able to predict target data. It takes in the predicted and actual outputs from a training and test set and returns a figure with the fit statistics and fit plots. An example is below

![Sample_Results](/Images/Regression_Fit_Charts.png)

## Setup and Run

This function is designed for regression problems (not classification problems). The function is called with the command:

Make_Plots(y_train, t_train, y_test, t_test)

Where y_train and y_test are the predicted output from your regression model for the training and test sets of data. t_train and t_test are the actual (target) values of the outputs in both the training and test sets. Note that t_train should have been used during the training of your model (along with the input data of the training set). Typically, y_test is created after the model is training by calling the model to predict the input data for the test set (x_test).

## Fit Statistics and Charts

The function will calculate the root mean squared error (RMSE), coefficient of determination (R^2), and absolute maximum observed error for both the training and test sets. The function then creates a figure with two rows of charts. The top row is for the training data and the bottom row is for the test data. The first subplot in each row enumerates the RMSE, R^2, and Max Error for either the training or test data. The next subplot is the actual v. predicted chart plotted over a 45 degree best-fit line. The third subplot in each row is the residual (actual - predicted) and the fourth subplot is a histogram of the residuals. Finally, the last subplot in each row is a [q-q plot](https://www.mathworks.com/help/stats/qqplot.html) of the residuals to test for normality (this is an assumption of linear regression but not necessarily of other models such as neural nets).

## Other Files

This repo also has a sample script to make the sample output. This sample script, [SampleModel](SampleModel.m) load the [Test_Data.csv](Data/Test_Data.csv) file, divides the data into a training and test set, and creates a response surface function to estimate the response. Note that in the data, the first six columns are input features, and the seventh column is the target output feature.

## MATLAB Version and Toolboxes

This function was built in MATLAB 2019b, however, it should run with previous versions as well. The q-q plot function requires the statistics toolbox.
