function mousePosition (hObject,eventdata,mass)
global clickcounter
global bin 
global arrow

C = get (gca, 'CurrentPoint');
X = C(1,1);
Y = C(1,2);

clickcounter = clickcounter + 1;
disp(clickcounter)
if clickcounter <= 3
 bin(clickcounter) = plot(X,Y,'o','MarkerSize',12,'MarkerFaceColor','k');
  arrow = annotation('arrow',[X/40 Y/40],...  %location of arrow is not working
      'color','g','LineWidth',1.5,...
  'ButtonDownFcn', @startArrowFcn);
  set (gcf, 'WindowButtonUpFcn', {@mouseStop});
end




% pointsnet(mass,NaN,[X Y])
end
