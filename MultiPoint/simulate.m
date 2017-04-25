%this is the main function that allows the simulation to run 
function Networks = simulate(Networks,pntForceFuncs,netwForceFuncs,interval,time,options,axisJ)
global ENDING; % sets global variable for the pause button called ENDING
global TICKTIME % sets global variable to allow the simulation to be slowed down and sped up
eTime = 0;
disp('simulation start');
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
        Networks(N) = moveNet(Networks(N),interval); %moves the networks
        Networks(N) = rotateNet(Networks(N),interval); %rotates the networks if torque is being applied
    end
    if length(Networks) ~= 1
        combos = nchoosek(1:length(Networks),2); % tests al of the combinations of the vertices to check if a collision is happening
        s = size(combos);
        for y = 1:(s(1))
            Networks = collision(Networks,combos(y,1),combos(y,2));
        end
    end
    eTime = eTime + interval;
    drawGUI(Networks,options,axisJ);
    if(ENDING)
        ENDING = 0;
        break;
    end
    ctime = clock-btime;
    pause(TICKTIME-ctime(end))
end
end
