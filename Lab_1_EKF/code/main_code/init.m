% function [mu,sigma,R,Q,Lambda_M] = init()
% This function initializes the parameters of the filter.
% Outputs:
%			mu(0):			3X1
%			sigma(0):		3X3
%			R:				3X3
%			Q:				2X2
function [mu,sigma,R,Q,Lambda_M] = init()
mu = [0;0;0]; % initial estimate of state
sigma = 1e-10*diag([1 1 1]); % initial covariance matrix
% delta_m = 0.999;
delta_m = 1.0;
Lambda_M = chi2inv(delta_m,2);
% Fill In This Part
%%  1
% R = diag([0.01^2 0.01^2 (pi/180)^2]);
% Q = diag([0.01^2 (pi/180)^2]);
%%  2
% R = diag([0.01^2 0.01^2 (pi/180)^2]);
% Q = diag([0.2^2 0.2^2]);
%  3
R = diag([1^2 1^2 1^2]);
Q = diag([0.1^2 0.1^2]);
end