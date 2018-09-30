% function [mu_bar,sigma_bar] = predict(mu,sigma,u,R)
% This function should perform the prediction step.
% Inputs:
%           mu(t-1)           3X1   the state of previous step   
%           sigma(t-1)        3X3   the covariance of previous step
%           u(t)              3X1   the odometry 
%           R                 3X3   the covariance of the process noise
% Outputs:   
%           mu_bar(t)         3X1   the predicted state
%           sigma_bar(t)      3X3   the predicted covariance 
function [mu_bar,sigma_bar] = predict(mu,sigma,u,R)

G = [1 0 -u(2); 0 1 u(1); 0 0 1];

sigma_bar = G * sigma * G' + R;
mu_bar = mu + u;    % g(u(t), mu(t-1)) = mu(t-1) + u(t);

end