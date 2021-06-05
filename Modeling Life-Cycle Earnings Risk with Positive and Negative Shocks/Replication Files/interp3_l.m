function f=interp3_l(x_g,y_g,z_g,V,x0,y0,z0,xi,yi,zi)
%performs for the vectors of length N the 3d interpolation of function V on
%grids x_g,y_g,z_g at function values x0,y0,z0, and lower grid indexes xi, yi, zi

num = ((x_g(xi+1)-x_g(xi)).*(y_g(yi+1)-y_g(yi)).*(z_g(zi+1)-z_g(zi)));
a000 = ((x_g(xi+1)-x0).*(y_g(yi+1)-y0).*(z_g(zi+1)-z0))./num;
a001 = ((x_g(xi+1)-x0).*(y_g(yi+1)-y0).*(z0-z_g(zi)))./num;
a010 = ((x_g(xi+1)-x0).*(y0-y_g(yi)).*(z_g(zi+1)-z0))./num;
a011 = ((x_g(xi+1)-x0).*(y0-y_g(yi)).*(z0-z_g(zi)))./num;
a100 = ((x0-x_g(xi)).*(y_g(yi+1)-y0).*(z_g(zi+1)-z0))./num;
a101 = ((x0-x_g(xi)).*(y_g(yi+1)-y0).*(z0-z_g(zi)))./num;
a110 = ((x0-x_g(xi)).*(y0-y_g(yi)).*(z_g(zi+1)-z0))./num;
a111 = ((x0-x_g(xi)).*(y0-y_g(yi)).*(z0-z_g(zi)))./num;

    f = a000*V(xi,yi,zi)+a001*V(xi,yi,zi+1)...
        +a010*V(xi,yi+1,zi)+a011*V(xi,yi+1,zi+1)...
        +a100*V(xi+1,yi,zi)+a101*V(xi+1,yi,zi+1)...
        +a110*V(xi+1,yi+1,zi)+a111*V(xi+1,yi+1,zi+1);