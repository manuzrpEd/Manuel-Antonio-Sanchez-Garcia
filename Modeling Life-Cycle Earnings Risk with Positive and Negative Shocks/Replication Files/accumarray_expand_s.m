function count = accumarray_expand_s(data,index,fcn)
%performs function (fcn specified of the type @(x)f(x) or @(x){f(x)}) on 
%group data with individual index and returns column vector of size(unique(index)) 

%find entries
index = order_index(index);  
fcn_count = @(x){ x(1:end) };
ind = accumarray(index, 1:numel(index), [max(index) 1],fcn_count);

%compute fcn and enter into corresponding indexes
indices = [index ones(length(index),1)]; 
sums = accumarray(indices,data,[],fcn);    

count = zeros(length(sums),1);
if iscell(sums) %sums is a cell array
    for i = 1:length(sums)
        count(i,1) = cell2mat(sums(i,1));
    end
else
    for i = 1:length(sums)
        count(i,1) = sums(i,1);
    end
end

end