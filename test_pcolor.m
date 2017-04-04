n = 6;
r = (0:n)'/n;
theta = pi*(-n:n)/n;
X = r*cos(theta);
Y = r*sin(theta);
C = r*ones(1,13);
pcolor(X,Y,C)
axis equal tight


%% 
n = size(sig_rad,1);
r = linspace(0,0.3,n)';
theta = linspace(-pi,pi,100);
X = r*cos(theta);
Y = r*sin(theta);
C = sig_rad(:,70)*ones(1,100);
pcolor(X,Y,C)
axis equal tight
shading flat