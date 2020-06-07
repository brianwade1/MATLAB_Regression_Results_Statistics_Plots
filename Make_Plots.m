function Make_Plots(y_train, t_train, y_test, t_test)


% Find residuals
res_train = y_train-t_train;
res_test = y_test-t_test;

t_train_mean = mean(t_train); %average of target data
t_test_mean = mean(t_test);

% Sum of squares of error and total
SSE_train = sum((res_train).^2);
SST_train = sum((t_train - t_train_mean).^2);

SSE_test = sum((res_test).^2);
SST_test = sum((t_test - t_test_mean).^2);

% Find coefficient of determination (R^2)
R2_train = 1 - (SSE_train / SST_train);
R2_test = 1 - (SSE_test / SST_test);

% Find root mean squared error (RMSE)
RMSE_train = sqrt(mean(res_train.^2));
RMSE_test = sqrt(mean(res_test.^2));

% Find max absolute error (MAE)
MAE_train = mean(abs(res_train));
MAE_test = mean(abs(res_test));

% Find max observed error
max_error_train = max(abs(res_train));
max_error_test = max(abs(res_test));

% Prepare 45 degree and horizontal line for later plots
min_y = min(min(y_train),min(y_test));
max_y = max(max(y_train),max(y_test));
line = (min_y: .1 : max_y); % 45-degree line
hline = zeros(numel(line)); % horizonal line

% Make figure
figure('Renderer', 'painters', 'Position', [10 10 1600 900])

% Training set fit statistics
subplot(2,5,1)
text(0.1,0.9,'Fit Statistics - Training Data','fontweight','bold','fontsize',10)
text(0.3,0.7,['RMSE = ',num2str(RMSE_train)])
text(0.3,0.5,['MAE = ',num2str(MAE_train)])
text(0.3,0.3,['R2 = ',num2str(R2_train)])
text(0.3,0.1,['Max Error = ',num2str(max_error_train)])
set(gca,'visible','off')

% Actual v. predicted for training set
subplot(2,5,2)
hold on
plot(y_train,t_train,'x')
plot(line,line,'-')
hold off
title('RSM Regression - Training Set')
xlabel('Actual')
ylabel('Predicted')
xlim([min_y max_y])
ylim([min_y max_y])

% Residual v. predicted for training set
subplot(2,5,3)
hold on
plot(y_train,res_train,'x')
plot(line,hline)
hold off
title('Residuals - Training Set')
xlabel('Predicted')
ylabel('Residual')
xlim([min_y max_y])

% Residual histogram
subplot(2,5,4)
histogram(res_train)
title('Residuals - Training Set')
xlabel('Residual')

% Q-Q plot of residuals (check for normality)
subplot(2,5,5)
qqplot(res_train)
title('Normal Probability Plot - Training Set')
xlabel('Residual')
ylabel('Probability')

% Test data -----
% Test set fit statistics
subplot(2,5,6)
text(0.15,0.9,'Fit Statistics - Test Data','fontweight','bold','fontsize',10)
text(0.3,0.7,['RMSE = ',num2str(RMSE_test)])
text(0.3,0.5,['MAE = ',num2str(MAE_test)])
text(0.3,0.3,['R2 = ',num2str(R2_test)])
text(0.3,0.1,['Max Error = ',num2str(max_error_test)])
set(gca,'visible','off')

% Actual v. predicted for test set
subplot(2,5,7)
hold on
plot(y_test,t_test,'x')
plot(line,line,'-')
hold off
title('RSM Regression - Test Set')
xlabel('Actual')
ylabel('Predicted')
xlim([min_y max_y])
ylim([min_y max_y])

% Residual v. predicted for test set
subplot(2,5,8)
hold on
plot(y_test,res_test,'x')
plot(line,hline)
hold off
title('Residuals - Test Set')
xlabel('Predicted')
ylabel('Residual')
xlim([min_y max_y])

% Residual histogram for test set
subplot(2,5,9)
histogram(res_test)
title('Residuals - Test Set')
xlabel('Residual')

% Q-Q plot for test set (check for normality)
subplot(2,5,10)
qqplot(res_test)
title('Normal Probability Plot - Test Set')
xlabel('Residual')
ylabel('Probability')

saveas(gcf, 'Images/Regression_Fit_Charts.png')

