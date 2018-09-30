% function S = systematic_resample(S_bar)
% This function performs systematic re-sampling
% Inputs:   
%           S_bar(t):       4XM
% Outputs:
%           S(t):           4XM
function S = systematic_resample(S_bar)
% FILL IN HERE

cdf = cumsum(S_bar(4, :));
[N, M] = size(S_bar);
S_X = zeros(N-1, M);
r_0 = rand / M;

for m = 1 : M
    i = find(cdf >= r_0 + (m-1) / M, 1, 'first'); 
    if i > 0
      S_X(:,m) = S_bar(1:3, i);
    end
end

S = [S_X; repmat(1/M, 1, M)];

end