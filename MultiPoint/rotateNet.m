function net = rotateNet(net,interval)
angle = AngleTurn(net.avel,interval);
for iter = 1:length(net.pnts)
    net.pnts(iter) = rotatePoint(net.pnts(iter), angle );
end
net.avel= net.avel+ netTorq(net)/ net.mofi * interval;
net = net;
end

function theta = AngleTurn(w,t)
theta= w *t;
end

function pt = rotatePoint(pt, angle)
A= [ cos(angle), -1*sin(angle); sin(angle), cos(angle) ];
pt.loca = A*(pt.loca');
end
