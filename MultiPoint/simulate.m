%function takes inputs and runs the simulation 
function Networks = simulate(Networks,pntForceFuncs,netwForceFuncs,interval,time,options,axisJ)
    global ENDING;
    global TICKTIME
    eTime = 0;
        
    while eTime < time
        btime = clock;
        for N = 1:length(Networks)
            Networks(N).forc = [ 0 0 ];
            for P = 1:length(Networks(N).pnts)
                Networks(N).pnts(N).forc = [0 0];
            end
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
        drawGUI(Networks,options,axisJ);
        if(ENDING)
            break;
        end
        ctime = clock-btime;
        pause(TICKTIME-ctime(end))
   end
end
