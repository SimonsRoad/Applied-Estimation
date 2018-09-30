% function [S_bar] = predict(S,u,R)
% This function should perform the prediction step of MCL
% Inputs:
%           S(t-1)              4XM
%           v(t)                1X1
%           omega(t)            1X1
%           R                   3X3
%           delta_t             1X1
% Outputs:
%           S_bar(t)            4XM
function [S_bar] = predict(S,v,omega,R,delta_t)
% FILL IN HERE
% using algorithm 3 Systematic Re-sampling

[N M] = size(S);    % the number of particles
S_bar_X = S(1:3,:);
u = delta_t * [v * cos(S(3, :)); v * sin(S(3,:)); repmat(omega, 1, M)];

applying_motion = S_bar_X + u;  % applying motion
diffusion = [normrnd(0, R(1,1), 1, M);
    normrnd(0, R(2,2), 1, M); normrnd(0, R(3,3), 1, M)];    % diffusion 

S_bar = applying_motion + diffusion;
S_bar = [S_bar; S(4,:)];    % S_bar + weights

end

