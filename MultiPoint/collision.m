function Networks = collision(Networks,a,b)
       if(isColliding(Networks(a),Networks(b)))
           v1fx = ( (Networks(a).mass - Networks(b).mass) * Networks(a).velo(1) + 2*Networks(b).mass*Networks(b).velo(1))/(Networks(a).mass + Networks(b).mass);
           v2fx = ( 2*Networks(a).mass*Networks(a).velo(1) - (Networks(a).mass-Networks(b).mass)*Networks(b).velo(1))/(Networks(a).mass+Networks(b).mass);
           v1fy = ( (Networks(a).mass - Networks(b).mass) * Networks(a).velo(2) + 2*Networks(b).mass*Networks(b).velo(2))/(Networks(a).mass + Networks(b).mass);
           v2fy = ( 2*Networks(a).mass*Networks(a).velo(2) - (Networks(a).mass-Networks(b).mass)*Networks(b).velo(2))/(Networks(a).mass+Networks(b).mass);
           Networks(a) = applyImpulse(Networks(a),[v1fx - Networks(a).velo(1),v1fy - Networks(a).velo(2)]*Networks(a).mass);
           Networks(b) = applyImpulse(Networks(b),[v2fx - Networks(b).velo(1),v2fy - Networks(b).velo(2)]*Networks(b).mass);
       end
end