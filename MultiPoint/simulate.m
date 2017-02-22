%function takes inputs and runs the simulation 
function Networks = simulate(Networks,pntForceFuncs,interval,time,options)
    eTime = 0;
    
    for P = 1:length(Networks)
        Networks(P) = construct(Networks(P));
    end
    
    while eTime < time
        for N = 1:length(Networks)
            for F = 1:length(pntForceFuncs)
                Networks = pntForceFuncs{F}(Networks);
            end
            for F = 1:length(netwForceFuncs)
                Networks(N) = netwForceFuncs{F}(Networks(N));
            end
            Networks(N) = moveNet(Networks(N),interval);
            Networks(N) = rotateNet(Networks(N),interval);
            Networks(N) = Networks(N);
        end
        eTime = eTime + interval;
        drawGUI(networks,options);
   end
end
