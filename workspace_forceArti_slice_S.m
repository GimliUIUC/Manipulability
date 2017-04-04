%% Leg Design based on Manipulability
close all
delta = -0.3;
L1 = 0.12*(1 + delta);
L2 = 0.12*(1 - delta);
r_min = abs(L1-L2);

r_span = linspace(r_min,0.24,100);
th_span = linspace(-pi,0,100);
X = r_span'*cos(th_span);
Y = r_span'*sin(th_span);

[r, th] = meshgrid(r_span,th_span);

sig_min = zeros(size(th_span,2),size(r_span,2));
sig_hor = zeros(size(sig_min));
sig_ver = zeros(size(sig_min));
A_sweep = zeros(size(sig_min));

for i = 2:size(X,2)-2
    for j = 2:size(Y,2)-2

        X_temp = X(i,j);
        Y_temp = Y(i,j);
        r_temp = sqrt(X_temp^2+Y_temp^2);
        q_temp = fcn_inv_S(delta,X_temp,Y_temp);
        J = fcn_JS(q_temp,delta);
        P_temp = [X_temp;Y_temp];
        
        A_sweep(i,j) = sweepArea_S(L1,L2,r_temp);

[V,D,th] =  DrawEllip(J,P_temp);
%             drawOpenChain_q(delta,q_temp)
%             drawAxis(V,D,P_temp)
        
        v_maj = V(:,1);               % major axis vector
        a = D(1,1);
        b = D(2,2);
        
        sig_hor(i,j) = abs(a*cos(th))+abs(b*sin(th));
        sig_ver(i,j) = abs(a*sin(th))+abs(b*cos(th));
        

    end
end
%% horizontal
pcolor(X,Y,sig_hor./A_sweep)
axis equal tight
shading flat
hold on
colorbar
caxis([0 2e5])
title('\sigma_{horizontal}')


%% vertical
figure
pcolor(X,Y,sig_ver./A_sweep)
axis equal tight
shading flat
colorbar
caxis([0 2e5])
title('\sigma_{vertical}')

% %% sweep area
% figure
% pcolor(X,Y,A_sweep)
% axis equal tight
% shading flat
% colorbar
% caxis([0 0.01])
% title('Sweep Area')

