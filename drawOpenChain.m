function void = drawOpenChain(delta,ext)
rot = @(th)[cos(th) -sin(th);sin(th) cos(th)];
    %% draw link open chain
    L2 = 0.12*(1 + delta);
    L1 = 0.12*(1 - delta);
    th1 = pi/2 - acos((L1^2+ext^2-L2^2)/(2*L1*ext));
    th2 = pi - acos((L1^2+L2^2-ext^2)/(2*L1*L2));

    P1 = rot(th1)*[L1;0];
    P2 = P1 + rot(th1+th2)*[L2;0];
    h = plot([0 P1(1) P2(1)],[0 -P1(2) -P2(2)])
    set(h,'color',[0.8 0.8 0.8])


end