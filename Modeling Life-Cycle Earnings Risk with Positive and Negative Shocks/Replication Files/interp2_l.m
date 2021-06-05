function f=interp2_l(x_g,y_g,V,x0,y0,xi,yi)
%performs the 2d interpolation of function V on
%grids x_g,y_g at function values x0,y0 and lower grid indexes xi, yi

num = ((x_g(xi+1)-x_g(xi)).*(y_g(yi+1)-y_g(yi)));
a00 = ((x_g(xi+1)-x0).*(y_g(yi+1)-y0))./num;
a01 = ((x_g(xi+1)-x0).*(y0-y_g(yi)))./num;
a10 = ((x0-x_g(xi)).*(y_g(yi+1)-y0))./num;
a11 = ((x0-x_g(xi)).*(y0-y_g(yi)))./num;


f = a00*V(xi,yi)+a01*V(xi,yi+1)...
    +a10*V(xi+1,yi)+a11*V(xi+1,yi+1);



