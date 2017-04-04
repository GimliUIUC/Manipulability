L1 = 1;L2 = 0.5;
r = 1.2;
alpha = pi/4;
beta = acos((L1^2+r^2-L2^2)/(2*L1*r));
gamma = acos((L2^2+r^2-L1^2)/(2*L2*r));
th1 = alpha - beta;
th2 = gamma + beta;


P1 = [L1*cos(th1);L1*sin(th1)];
P2 = P1 + [L2*cos(th1+th2);L2*sin(th1+th2)];
plot([0 P1(1) P2(1)],[0 P1(2) P2(2)])
hold on
plot([0,r*cos(alpha)],[0,r*sin(alpha)])
axis([-0.2 1 -0.2 1])

J1 = ...
[ - sin(th1)*(L1 + L2*cos(th2)) - L2*cos(th1)*sin(th2), - L2*cos(th1)*sin(th2) - L2*cos(th2)*sin(th1);
    cos(th1)*(L1 + L2*cos(th2)) - L2*sin(th1)*sin(th2),   L2*cos(th1)*cos(th2) - L2*sin(th1)*sin(th2)];

th1 = alpha + gamma;
th2 = beta + gamma;
th2 = -th2;

temp = L1;
L1 = L2;
L2 = temp;

J2 = ...
[ - sin(th1)*(L1 + L2*cos(th2)) - L2*cos(th1)*sin(th2), - L2*cos(th1)*sin(th2) - L2*cos(th2)*sin(th1);
    cos(th1)*(L1 + L2*cos(th2)) - L2*sin(th1)*sin(th2),   L2*cos(th1)*cos(th2) - L2*sin(th1)*sin(th2)];

P1 = [L1*cos(th1);L1*sin(th1)];
P2 = P1 + [L2*cos(th1+th2);L2*sin(th1+th2)];
plot([0 P1(1) P2(1)],[0 P1(2) P2(2)])
