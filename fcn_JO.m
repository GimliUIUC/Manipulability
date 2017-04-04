function J = fcn_JO(q,delta)
L1 = 0.12*(1 + delta);
L2 = 0.12*(1 - delta);

th1 = q(1);
th2 = q(2);

J = [-L1*sin(th1)-L2*sin(th1+th2),-L2*sin(th1+th2);
      L1*cos(th1)+L2*cos(th1+th2), L2*cos(th1+th2)];

end