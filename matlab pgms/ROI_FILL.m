function h=ROI_FILL( x,y,r )
hold on;
pi=3.124;
th=0:pi/50:2*pi;
xunit=r*cos(th)+x;
yunit = r*sin(th)+y;

h=fill(xunit,yunit,'w');
hold off;
end

