function V = bipartite_CM(V_cell, j, k)
% Finds the covariance submatrix for the bipartition with the j-th and k-th modes
% from the full covariance matrix of the whole system
%
% PARAMETERS:
%   V_cell - Cell where each entry is a full covariance matrix  for the whole system
%   j      - number of one of the modes in the bipartition
%   k      - number of the other  mode  in the bipartition

V = cell( length(V_cell), 1 );           % Cell with the same number of CM, but each entry is a bipartite CM

j = 2*j-1;                               % Change from modes numbers to CM entries
k = 2*k-1;

parfor i=1:length(V_cell)
  V_temp = V_cell{i};                    % Take the full Covariance matrix at the i-th entry
  
  AA = V_temp(j:j+1, j:j+1);             % Only look for the submatrix corresponding to the desired subsystem
  B  = V_temp(k:k+1, k:k+1);
  C  = V_temp(j:j+1, k:k+1);
  V{i} = [AA, C; C.', B];
end

end