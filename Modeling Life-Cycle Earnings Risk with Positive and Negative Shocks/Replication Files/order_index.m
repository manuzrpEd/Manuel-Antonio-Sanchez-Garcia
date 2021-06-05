function index = order_index(index)
%assures that index is ordered from 1:N

index = [index zeros(length(index),1)];
index(2:end,2) = diff(index(:,1));
index(1,2) = 1;
index(:,2) = index(:,2)~=0;
index(:,1) = cumsum(index(:,2));
index(:,2) = [];

end