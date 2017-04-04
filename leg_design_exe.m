close all
delta_span = linspace(-0.99,0.99,200);
ex_span = linspace(0.01,0.29,100);
sig_min = zeros(size(ex_span,2),size(delta_span,2));
sig_max = zeros(size(sig_min));
sig_mean = zeros(size(sig_min));
sig_minmax = zeros(size(sig_min));
sig_new = zeros(size(sig_min));

[delta, extension] = meshgrid(delta_span,ex_span);
len_del = length(delta_span);
%% open chain sig_min
for i = 1:size(ex_span,2)
    for j = -(i-3)+100:i-3+100
        J = Jcb_O(delta(i,j),extension(i,j));
        %% velocity ellipsoid
        [V,D] = eig(inv(J*J'));
        v1 = V(:,1);
        v2 = V(:,2);
        scale = 1e-4;
        % scale = 1;
        a = D(1,1)*scale;
        b = D(2,2)*scale;
        th = atan2(v1(2),v1(1));
        DrawEllip(J,[0,0]);
        axis([-0.7 0.7 -0.2 0.2])
        
        sig_min(i,j) = sqrt(min(eig((J*J'))));
        sig_max(i,j) = sqrt(max(eig((J*J'))));
        clf
        
        if sig_max(i,j)>1
            sig_max(i,j) = 1;
        end
        sig_mean(i,j) = 1/2*trace(J*J');
        if sig_mean(i,j)>0.1
            sig_mean(i,j) = 0.1;
        end
        sig_minmax(i,j) = sig_min(i,j)/sig_max(i,j);
        sig_new(i,j) = sig_max(i,j)/sig_min(i,j)-1;
%         sig_new(i,j) = log(sig_new(i,j));
    end
end
%% sig_min
pcolor(delta,extension,sig_min)
shading flat
hold on
[C,H]=contour(delta,extension,sig_min,'-k','LevelStep',0.02);
clabel(C,H);
xlabel('\delta')
ylabel('extesion')
title('\sigma_{min}')
colorbar
caxis([0 0.2])
pbaspect([2 1 1])

%% sig_max
figure
pcolor(delta,extension,sig_max)
shading flat
hold on
[C,H]=contour(delta,extension,sig_max,'-k','LevelStep',0.02);
clabel(C,H);
xlabel('\delta')
ylabel('extesion')
title('\sigma_{max}')
colorbar
caxis([0 0.5])
pbaspect([2 1 1])

%% sig_mean
figure
pcolor(delta,extension,sig_mean)
shading flat
hold on
[C,H]=contour(delta,extension,sig_mean,'-k','LevelStep',0.01);
clabel(C,H);
xlabel('\delta')
ylabel('extesion')
title('\sigma_{mean}')
colorbar
caxis([0 0.06])
pbaspect([2 1 1])

%% sig_minmax
figure
pcolor(delta,extension,sig_minmax)
shading flat
hold on
[C,H]=contour(delta,extension,sig_minmax,'-k');%,'LevelStep',0.01);
colorbar
% caxis([0 0.06])
clabel(C,H);
xlabel('\delta')
ylabel('extesion')
title('\sigma_{min}/\sigma_{max}')
pbaspect([2 1 1])
% title('\sigma_{max}/\sigma_{min}-1')

%% sig_new
figure
pcolor(delta,extension,sig_new)
shading flat
hold on
[C,H]=contour(delta,extension,sig_new,'-k','LevelStep',1);
colorbar
caxis([0 8])
clabel(C,H);
xlabel('\delta')
ylabel('extesion')
title('\sigma_{new}')
pbaspect([2 1 1])


%%
% title('\sigma_{max}/\sigma_{min}-1')

% %% symmetric five_bar (S)
% figure
% for i = 1:size(ex_span,2)
%     for j = 1:i
%         del = delta(i,j);
%         exten = extension(i,j);
%         J = Jcb_S(delta(i,j),extension(i,j));
%         sig_min(i,j) = sqrt(min(eig((J*J'))));
%         sig_max(i,j) = sqrt(max(eig((J'*J))));
%     end
% end
% 
% pcolor(delta,extension,sig_min)
% shading flat
% hold on
% [C,H]=contour(delta,extension,sig_min,'-k');
% clabel(C,H);
% 
% figure
% mesh(delta,extension,sig_min)



