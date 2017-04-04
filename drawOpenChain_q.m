function drawOpenChain_q(delta,q)

    %% draw link open chain
    L1 = 0.12*(1 + delta);
    L2 = 0.12*(1 - delta);
    th1 = q(1);
    th2 = q(2);

    P1 = rot(th1)*[L1;0];
    P2 = P1 + rot(th1+th2)*[L2;0];
    h = plot([0 P1(1) P2(1)],[0 P1(2) P2(2)]);
    set(h,'color',[0.8 0.8 0.8])


end