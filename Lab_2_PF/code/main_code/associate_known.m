% function [outlier,Psi] = associate_known(S_bar,z,W,Lambda_psi,Q,known_associations)
%           S_bar(t)            4XM
%           z(t)                2Xn
%           W                   2XN
%           Lambda_psi          1X1
%           Q                   2X2
%           known_associations  1Xn
% Outputs: 
%           outlier             1Xn
%           Psi(t)              1XnXM
function [outlier,Psi] = associate_known(S_bar,z,W,Lambda_psi,Q,known_associations)
n = size(z, 2);
N = size(W, 2);
M = size(S_bar, 2);

Psai = zeros(n, N, M);
Psi = zeros(1, n, M);
outlier = zeros(1, n);
z_hat = zeros(2, M, N);
norm = (2 * pi * sqrt(det(Q)));
for i = 1 : n
    for m = 1 : M
        for k = 1 : N 
            z_hat = observation_model(S_bar, W, k);
            nu = z(:, i) - z_hat(:, m);
            nu(2) = mod(nu(2) + pi, 2 * pi) - pi;
            Psai(i, k, m) = 1 / norm * exp(-0.5 * nu' * inv(Q) * nu);
        end
        Psi(1, i, m) = Psai(i, known_associations(i), m);
    end
    Psi_bar = mean(Psi(1,i,:));
    outlier(i) = (Psi_bar <= Lambda_psi);
end

end
