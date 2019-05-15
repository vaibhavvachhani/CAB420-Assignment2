X = load('data/iris.txt'); % load iris dataset
X= X(:,1:2);

%a) plot data for yourself
%{
figure(1)
plot(X,'rx')
grid

%b)
figure(2)
[z,c,sumd] = kmeans(X,5);
grid
figure(3)
[z1,c1,sumd1] = kmeans(X,20);
grid
%}

%c

[z3,join1] = agglomCluster(X,5,'min');
[z4, join2] = agglomCluster(X,20,'max');

[z5,join3] = agglomCluster(X,5,'max');
[z6, join4] = agglomCluster(X,20,'min');
