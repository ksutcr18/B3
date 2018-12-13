function A = RectVander(x, n)
%RECTVANDER Compute rectangular Vandermonde matrix
%   Inputs:
%       x: Vector of length m
%       n: Scalar
%   Outputs:
%       V: m x n matrix, elements of x raised to powers 0, 1, ... (n-1)
    x = x(:);  % Column vector
    A = ones(length(x), n);
    for i = 2:n
        A(:, i) = x .* A(:, i-1);
    end
    A = fliplr(A);
end