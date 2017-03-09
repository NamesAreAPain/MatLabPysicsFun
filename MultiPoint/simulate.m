%function takes inputs and runs the simulation 
function Networks = simulate(Networks,pntForceFuncs,netwForceFuncs,interval,time,options)
    %al = animatedline;
    %axis([-10,10,-10,10])
    eTime = 0;
        
    while eTime < time
        for N = 1:length(Networks)
            for F = 1:length(pntForceFuncs)
                Networks = genericForceApplication(Networks(N),Networks,pntForceFuncs(F));
            end
            for F = 1:length(netwForceFuncs)
                Networks(N) = netwForceFuncs{F}(Networks(N));
            end
            Networks(N) = moveNet(Networks(N),interval);
            Networks(N) = rotateNet(Networks(N),interval);
        end
        
        combos = nchoosek(1:length(Networks),2);
        s = size(combos);
        for y = 1:(s(1))
            Networks = collision(Networks,combos(y,1),combos(y,2));
        end
        
        eTime = eTime + interval;
        %al = drawGUI(Networks,options,al);
        %drawnow
   end
end
