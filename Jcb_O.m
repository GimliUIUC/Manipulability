function JO = Jcb_O(delta,ex)
L1 = 0.12*(1 + delta);
L2 = 0.12*(1 - delta);

temp = (L1*L1+L2*L2-ex*ex)/(2*L1*L2);
th2 = -(pi - acos(temp));

temp2 = (L1*L1+ex*ex-L2*L2)/(2*L1*ex);
th1 = -(pi/2 - acos(temp2));

JO = ...
[-L1*sin(th1)-L2*sin(th1+th2),-L2*sin(th1+th2);
  L1*cos(th1)+L2*cos(th1+th2), L2*cos(th1+th2)];
end