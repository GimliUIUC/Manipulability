function void = drawParallel(delta,ext)
rot = @(th)[cos(th) -sin(th);sin(th) cos(th)];
    %% draw link open chain
    L2 = 0.15*(1 + delta);
    L1 = 0.15*(1 - delta);
    th1 = acos((L1^2+ext^2-L2^2)/(2*L1*ext));
    alp = acos((L1^2+L2^2-ext^2)/(2*L1*L2));
    th2 = -(pi-alp);
    P1 = rot(th1)*[L1;0];
    P2 = P1 + rot(th1+th2)*[L2;0];
    P3 = rot(th2+th1)*[L2;0];
    P1 = rot(-pi/2)*P1;
    P2 = rot(-pi/2)*P2;
    P3 = rot(-pi/2)*P3;
    h = plot([0 P1(1) P2(1) P3(1) 0],[0 P1(2) P2(2) P3(2) 0])
    set(h,'color',[0.8 0.8 0.8])



end