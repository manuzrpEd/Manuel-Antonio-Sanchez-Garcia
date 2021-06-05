function yi = interp1_l(x,y,xi)
%INTERP1 1-D interpolation (table lookup)
%   interpolates a column vector xi (with length ni) on a column vector y 
%   (with length ny) created by a
%   column vector x linearly. x is non-equispaced. Extrapolation is
%   performed linearly. All security checks are shut down

%%

h = diff(x);

% Interpolate

%yi = zeros(ni,1);
ni = length(xi);
p = 1:ni;
ny = length(y);
% Find indices of subintervals, x(k) <= u < x(k+1),
% or u < x(1) or u >= x(m-1).

[~,k] = histc(xi,x);
k(xi<x(1)) = 1;
k(xi>=x(ny)) = ny-1;
s = (xi - x(k))./h(k);

yi(p,1) = y(k,1) + s.*(y(k+1,1)-y(k,1));

%varargout{1} = yi;
  

end 