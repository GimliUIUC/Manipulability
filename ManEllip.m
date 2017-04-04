%% Manipulability Ellipsoid

delta = 0.1;
% draw ellipsoid

for ext = linspace(0.05,0.22,5)
    
    P = [0;-ext];

% % open chain
%     JO = Jcb_O(delta,ext);
%     DrawEllip(JO,P);
%     drawOpenChain(delta,ext);


% % paralle five bar
%     JP = Jcb_P(delta,ext);
%     DrawEllip(JP,P);
%     drawParallel(delta,ext);


% symmetric five bar
    JS = Jcb_S(delta,ext)
    DrawEllip(JS,P);
    drawSymmetric(delta,ext);

end


%% det(inv(JJ^T))
