function J = Jcb_S(delta,ex)
L1 = 0.12*(1 + delta);
L2 = 0.12*(1 - delta);
temp = acos((L1*L1-L2*L2+ex*ex)/(2*L1*ex));
th1 = -(pi/2 - temp);
th2 = -(pi/2+temp);

J = ...
[ - cos(th1/2 + th2/2)*((L1*sin(th1/2 - th2/2))/2 + (L1^2*cos(th1/2 - th2/2)*sin(th1/2 - th2/2))/(2*(L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2))) - (sin(th1/2 + th2/2)*(L1*cos(th1/2 - th2/2) + (L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))/2, cos(th1/2 + th2/2)*((L1*sin(th1/2 - th2/2))/2 + (L1^2*cos(th1/2 - th2/2)*sin(th1/2 - th2/2))/(2*(L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2))) - (sin(th1/2 + th2/2)*(L1*cos(th1/2 - th2/2) + (L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))/2;
   (cos(th1/2 + th2/2)*(L1*cos(th1/2 - th2/2) + (L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))/2 - sin(th1/2 + th2/2)*((L1*sin(th1/2 - th2/2))/2 + (L1^2*cos(th1/2 - th2/2)*sin(th1/2 - th2/2))/(2*(L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2))), (cos(th1/2 + th2/2)*(L1*cos(th1/2 - th2/2) + (L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))/2 + sin(th1/2 + th2/2)*((L1*sin(th1/2 - th2/2))/2 + (L1^2*cos(th1/2 - th2/2)*sin(th1/2 - th2/2))/(2*(L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))];
 
% [ - cos(th1/2 + th2/2)*((L1*sin(th1/2 - th2/2))/2 + (L1^2*cos(th1/2 - th2/2)*sin(th1/2 - th2/2))/(2*(L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2))) - (sin(th1/2 + th2/2)*(L1*cos(th1/2 - th2/2) + (L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))/2, cos(th1/2 + th2/2)*((L1*sin(th1/2 - th2/2))/2 + (L1^2*cos(th1/2 - th2/2)*sin(th1/2 - th2/2))/(2*(L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2))) - (sin(th1/2 + th2/2)*(L1*cos(th1/2 - th2/2) + (L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))/2;
%     (cos(th1/2 + th2/2)*(L1*cos(th1/2 - th2/2) + (L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))/2 - sin(th1/2 + th2/2)*((L1*sin(th1/2 - th2/2))/2 + (L1^2*cos(th1/2 - th2/2)*sin(th1/2 - th2/2))/(2*(L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2))), (cos(th1/2 + th2/2)*(L1*cos(th1/2 - th2/2) + (L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))/2 + sin(th1/2 + th2/2)*((L1*sin(th1/2 - th2/2))/2 + (L1^2*cos(th1/2 - th2/2)*sin(th1/2 - th2/2))/(2*(L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))];
%  
end