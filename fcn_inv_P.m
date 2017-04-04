function q = fcn_inv_P(h,param)
% p is the position of the hip
% foot position is assumed to be [dx;0]

l1 = param.L1;
l2 = param.L2;


% h: vertical position of the hip

numA = l1^2+h^2-l2^2;
denA = 2*h*l1;
A = acos(numA/denA);

q1 = pi/2 - A;

numB = l1^2+l2^2-h^2;
denB = 2*l1*l2;
B = acos(numB/denB);
q2 = pi - B + q1;

q = [q1,q2];


end