function [X Y] = netnetForce(network)
    X = 0;
    Y = 0;
    for P = network.pnts
        [x,y] = netForce(P);
        X = X + x;
        Y = Y + y;
    end
end