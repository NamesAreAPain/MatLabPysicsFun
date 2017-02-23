function network = construct(network)
    netMass = 0;
    Xs = zeros(length(network.pnts),1);
    Ys = zeros(length(network.pnts),1);
    iter = 1;
    for P = network.pnts
        netMass = netMass + P.mass;
        Xs(iter) = P.loca(1);
        Ys(iter) = P.loca(2);
        iter = iter + 1;
    end
    Xs = Xs';
    Ys = Ys';
    network.mass = netMass;
    network.loca = centerOfMass(network);
    network.mofi = momentOfInertia(network);
    [A,network.area] = convhull(Xs,Ys,'simplify',true);
    

    network.boun = A;

    network = network;
end