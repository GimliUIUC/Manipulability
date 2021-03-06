%% Leg Design based on Manipulability
close all
delta_span = linspace(-0.9,0.9,200);
ex_span = linspace(0.01,0.23,100);

[delta, extension] = meshgrid(delta_span,ex_span);

sig_min = zeros(size(ex_span,2),size(delta_span,2));
sig_rad = zeros(size(sig_min));
sig_lat = zeros(size(sig_min));
sig_minmax = zeros(size(sig_min));


for i = 3:size(ex_span,2)
    for j = 100-i+3:100+i-3
        % jacobian for vertical jumping leg
        J = Jcb_S(delta(i,j),extension(i,j));
        
        %% sensitivity
        [V,D] = eig(inv(J'*J));
        if D(1,1)>D(2,2)
            ind = 1;
        else
            ind = 2;
        end
%         ind = 1;
        v_maj = V(:,ind);               % major axis vector
        scale = 1;
        a = D(ind,ind)*scale;
        b = D(3-ind,3-ind)*scale;

        th = atan2(v_maj(2),v_maj(1));  % major axis angle
        
        sig_lat(i,j) = a*abs(cos(th))+b*abs(sin(th));
        sig_rad(i,j) = a*abs(sin(th))+b*abs(cos(th));
        
        sig_min = sqrt(min(eig(inv(J'*J))));
        sig_max = sqrt(max(eig(inv(J'*J))));
        sig_minmax(i,j) = sig_min/sig_max;

    end
end

%% sig_rad
pcolor(delta,extension,sig_rad)
shading flat
hold on
v_O = [100 150 200 300 400 600 10000];
v = v_O;
[C,H]=contour(delta,extension,sig_rad,v,'-k');
% [C,H]=contour(delta,extension,sig_rad,'-k','LevelStep',0.03);

clabel(C,H);
xlabel('\delta')
ylabel('extesion')
title('\sigma_{rad}')
colorbar
caxis([0 1000])
pbaspect([2 1 1])

%% sig_lat
figure
pcolor(delta,extension,sig_lat)
shading flat
hold on
v_O = [50 70 100 200 300];
v = v_O;
[C,H]=contour(delta,extension,sig_lat,v,'-k');

% [C,H]=contour(delta,extension,sig_lat,'-k','LevelStepMode','manual','LevelStep',[0 0.1 0.2]);
clabel(C,H);
xlabel('\delta')
ylabel('extesion')
title('\sigma_{lat}')
colorbar
caxis([0 800])
pbaspect([2 1 1])

%% sig_minmax
% figure
% pcolor(delta,extension,sig_minmax)
% shading flat
% hold on
% v_O = [0.002 0.005 0.007 0.01 0.02];
% v_P = [0 0.005 0.01 0.02 0.03];
% v_S = [0.005 0.01 0.03];
% v = v_S;
% [C,H]=contour(delta,extension,sig_minmax,'-k');
% clabel(C,H);
% xlabel('\delta')
% ylabel('extesion')
% title('\sigma_{min/max}')
% colorbar
% caxis([0 1])
% pbaspect([2 1 1])

%% 
N_S = 67;
N_O = 84;
N = 60;
figure
n = size(sig_rad,1);
r = linspace(0,0.3,n)';
theta = linspace(-pi,0,100);
X = r*cos(theta);
Y = r*sin(theta);
C = sig_rad(:,N)*ones(1,100);
pcolor(X,Y,C)
axis equal tight
shading flat
colorbar
caxis([0 800])
title('\sigma_{rad}')

%% 
figure
n = size(sig_lat,1);
r = linspace(0,0.3,n)';
theta = linspace(-pi,0,100);
X = r*cos(theta);
Y = r*sin(theta);
C = sig_lat(:,N)*ones(1,100);
pcolor(X,Y,C)
axis equal tight
shading flat
colorbar
caxis([0 800])
title('\sigma_{lat}')

%% 
figure
n = size(sig_lat,1);
r = linspace(0,0.3,n)';
theta = linspace(-pi,0,100);
X = r*cos(theta);
Y = r*sin(theta);
C = sig_rad(:,N)./sig_lat(:,N)*ones(1,100);
pcolor(X,Y,C)
axis equal tight
shading flat
colorbar
caxis([0 2])
title('\sigma_{rad}/\sigma_{lat}')

