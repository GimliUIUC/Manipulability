function J = fcn_JS(q,delta)
L1 = 0.12*(1 + delta);
L2 = 0.12*(1 - delta);

th1 = q(1);
th2 = q(2);

J = ...
[ - cos(th1/2 + th2/2)*((L1*sin(th1/2 - th2/2))/2 + (L1^2*cos(th1/2 - th2/2)*sin(th1/2 - th2/2))/(2*(L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2))) - (sin(th1/2 + th2/2)*(L1*cos(th1/2 - th2/2) + (L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))/2, cos(th1/2 + th2/2)*((L1*sin(th1/2 - th2/2))/2 + (L1^2*cos(th1/2 - th2/2)*sin(th1/2 - th2/2))/(2*(L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2))) - (sin(th1/2 + th2/2)*(L1*cos(th1/2 - th2/2) + (L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))/2;
   (cos(th1/2 + th2/2)*(L1*cos(th1/2 - th2/2) + (L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))/2 - sin(th1/2 + th2/2)*((L1*sin(th1/2 - th2/2))/2 + (L1^2*cos(th1/2 - th2/2)*sin(th1/2 - th2/2))/(2*(L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2))), (cos(th1/2 + th2/2)*(L1*cos(th1/2 - th2/2) + (L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))/2 + sin(th1/2 + th2/2)*((L1*sin(th1/2 - th2/2))/2 + (L1^2*cos(th1/2 - th2/2)*sin(th1/2 - th2/2))/(2*(L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))];
 
end