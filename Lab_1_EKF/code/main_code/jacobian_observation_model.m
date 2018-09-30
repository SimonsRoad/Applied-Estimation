% function H = jacobian_observation_model(mu_bar,M,j,z,i)
% This function is the implementation of the H function
% Inputs:
%           mu_bar(t)   3X1
%           M           2XN
%           j           1X1 which M column
%           z_hat       2Xn
%           i           1X1  which z column
% Outputs:  
%           H           2X3
function H = jacobian_observation_model(mu_bar,M,j,z_hat,i)

H11 = (mu_bar(1) - M(1,j)) / z_hat(1,i);
H12 = (mu_bar(2) - M(2,j)) / z_hat(1,i);
H21 = -(mu_bar(2) - M(2,j)) / (z_hat(1,i))^2;
H22 = (mu_bar(1) - M(1,j)) / (z_hat(1,i))^2;

H = [H11 H12 0; H21 H22 -1];
end
