function [ x, res ] = polyfilter( A, b, order)
%POLYFILTER Fit polynomial basis function to data.
%   Inputs:
%       Observations: n x m
%       b: Labels (n x 1)
%       order: Order of the polynomial. Must be less than n.
%   Outputs:
%       x - Solution (m x 1) evaluated along the polynomial
    
    m = size(A, 2);
    
    Psi = RectVander(linspace(0, 1, m), order + 1);  % m x (order+1)
    xi = (A * Psi) \ b;
    x = Psi * xi;
    res = norm(A*x - b, 2);
end

