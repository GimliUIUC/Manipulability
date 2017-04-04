syms L1 L2 th1 th2
th = [th1 th2];

%% open chain
gO = rot(th1)*[L1+L2*cos(th2);L2*sin(th2)];

%% paralle five bar
gP = rot(th1)*([L1;0] + rot(th2-th1)*[L2;0]);


%% symmetric five bar
alpha1 = (th1+th2)/2;
alpha2 = (th1-th2)/2;       % alpha2 is positive values
extension_S = L1*cos(alpha2) + sqrt(L2^2-(L1*sin(alpha2))^2);
gS = rot(alpha1)*[extension_S;0];
gS = simplify(gS);

% ysq = 2*L1^2-2*L1^2*cos(th2-th1);
% beta = acos((2*L2^2-ysq)/(2*L2^2));
% gamma = 1/2*(th2-th1-beta);
% % gS = rot(th1)*([L1;0] + rot(gamma)*[L2;0]);
% % gS = rot(alpha1)*[L1*cos(-alpha2)+sqrt(L2^2-(L1*sin(-alpha2))^2);0];
% beta = -alpha2;
% % gS = rot(alpha1)*[L1*cos(beta)+sqrt(L2^2-(L1*sin(beta))^2);0];
% gS = rot(alpha1)*[L1*cos(alpha2)+sqrt(L2^2-L1^2*(sin(alpha2))^2);0];

JO = jacobian(gO,th);
JP = jacobian(gP,th);
JS = simplify(jacobian(gS,th))


