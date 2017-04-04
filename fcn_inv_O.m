function q = fcn_inv_O(delta,X,Y)
L1 = 0.12*(1 + delta);
L2 = 0.12*(1 - delta);

r = sqrt(X^2+Y^2);
th = atan2(Y,X);

A = acos((L1^2+r^2-L2^2)/(2*L1*r));
B = acos((L1^2+L2^2-r^2)/(2*L1*L2));

q1 = -(-th-A);

q2 = -(pi-B);

q = [q1,q2];


end