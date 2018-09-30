% function [outlier,Psi] = associate(S_bar,z,W,Lambda_psi,Q)
%           S_bar(t)            4XM
%           z(t)                2Xn
%           W                   2XN
%           Lambda_psi          1X1
%           Q                   2X2
% Outputs: 
%           outlier             1Xn
%           Psi(t)              1XnXM
function [outlier,Psi] = associate(S_bar,z,W,Lambda_psi,Q)
% FILL IN HERE
%BE SURE THAT YOUR innovation 'nu' has its second component in [-pi, pi]
%%
n = size(z, 2); % the number of measurements
N = size(W, 2); % the number of landmarks
M = size(S_bar, 2); % the number of particles
%%
z_hat = zeros(2, N, M);
Psi = zeros(1, n, M);
for k = 1 : N
    z_hat(:, k, :) = observation_model(S_bar, W, k);   
end
norm = (2 * pi * sqrt(det(Q))); 
Q = repmat(diag(Q), 1, N, M);
%%
for i = 1 : n
    nu = z(:, i) - z_hat;
    nu(2, :) = mod(nu(2, :) + pi, 2 * pi) - pi;
    Psi(:, i, :) = max(1/norm * prod(exp(-0.5 .* nu ./ Q .* nu)));
end
%%
outlier = (mean(reshape(Psi, n, M), 2) <= Lambda_psi); 
end
