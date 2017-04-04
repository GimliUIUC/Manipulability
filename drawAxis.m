function drawAxis(V,D,P)
scale = 1e-2;
v1 = V(:,1)*scale;
v2 = V(:,2)*scale;

d11 = D(1,1);
d22 = D(2,2);


plot([P(1) P(1)+v1(1)],[P(2) P(2)+v1(2)])


