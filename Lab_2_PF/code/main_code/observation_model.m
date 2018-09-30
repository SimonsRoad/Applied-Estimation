% function h = observation_model(S,W,j)
% This function is the implementation of the observation model
% The bearing should lie in the interval [-pi,pi)
% Inputs:
%           S           4XM
%           W           2XN
%           j           1X1
% Outputs:  
%           h           2XM
function h = observation_model(S,W,j)
% FILL IN HERE
M = size(S, 2);

% the observation function
dis = sqrt((W(1, j) * ones(1, M) - S(1, :)).^2 + (W(2, j) * ones(1, M) - S(2, :)).^2);
ang = atan2(W(2, j) * ones(1, M) - S(2, :), W(1, j) * ones(1, M) - S(1, :)) - S(3, :);

% put an angle in the range [-pi, pi]
ang = mod(ang + pi, 2 * pi) - pi;
h = [dis; ang];

end