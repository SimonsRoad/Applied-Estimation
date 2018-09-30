% function S_bar = weight(S_bar,Psi,outlier)
%           S_bar(t)            4XM
%           outlier             1Xn
%           Psi(t)              1XnXM
% Outputs: 
%           S_bar(t)            4XM
function S_bar = weight(S_bar,Psi,outlier)
% FILL IN HERE

%BE CAREFUL TO NORMALIZE THE FINAL WEIGHTS

% pick out the valid Psi
valid = find(~outlier);
Psi = Psi(1, valid,:);
p = prod(Psi, 2);

% normaliza the final weights
norm = sum(p);
p = p / norm;
S_bar(4,:) = p;

end
