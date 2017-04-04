function A_sweep = sweepArea_O(L1,L2,r)


A = acos((L1^2+L2^2-r^2)/(2*L1*L2));
A_sweep = 1/2*L1*L2*sin(A);
end