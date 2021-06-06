function [grid,prob] = Norm(N,mue,sigma,type)

% discretizes normal distribution with mean (mue)and SE (sigma), using N grid points.
% Returns the discreized state space (grid) and probability of occurence (prob) 

if nargin<=3 %default case
    type='importance';
end


switch type
    case{'importance'} %equi likely grid points
        grid_probs=linspace(0,1,N+1);   % generate equi-likely bins
        bounds=norminv(grid_probs);     % corresponding bin bounds
        % Calculate grid - centers
        grid = N*( normpdf(bounds(1:end-1)) - normpdf(bounds(2:end)) );
        grid=grid*sigma + mue;
        grid = grid';
        prob = repmat(1/N,N,1);
        
        
    case{'equi'} % use +-3 std equi-spaced grid
        step=6/(N-1); %Calculate Stepsize
        grid = -3:step:3; % generate Grid (bin centers)
        
        % calculate probability to be in each center
        bounds=[-Inf grid(1:end-1)+step/2 Inf]; % Bounds of Bins
        bounds(1)=bounds(2)-99999999999; 
        bounds(end)=bounds(end-1)+99999999999;
        
        prob = zeros(N,1);
        prob(1,1) = normcdf(bounds(2));
        for i = 2:N
            prob(i,1)=normcdf(bounds(i+1))-normcdf(bounds(i));
        end
        grid=grid*sigma + mue;
        grid = grid';
end


end