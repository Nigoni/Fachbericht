% Fourieranalyse von Hand
clear all, close all, clc
syms x n pi;
assume(n,'integer') 
% Grundeinstellungen
laenge_APS = 40;
T=2*pi;
w0=(2*pi)/T;
ug = 0;
og = 2*pi;
% Winkel eingeben
winkel=pi/3; 
% Berechnung des Phasenanschnittes
if winkel== 0
    f(x) = sin(x)
elseif winkel > 0
   f(x) = piecewise(x<winkel, 0, winkel<x<pi, 
   sin(x), pi<x<pi+winkel, 0, pi+winkel<x<2*pi, sin(x), x>2*pi, 0 );
end
% Anzeigen des Phasenanschnittes
figure
limits = [0 7];
fplot(f, limits)
grid on
title('Funktion')
% Berechnung des Fourier-koefizienten a0 
a_0=1/(2*pi)*(int(f(x),x,ug,og));
a_0=simplify(a_0)
% Berechnung des Fourier-koefizienten b(n) 
b(n)=2/T*(int(f(x)*sin(w0*n*x),x,ug,og));
b(n)=simplify(b(n))
% Berechnung der Fourier-koefizienten a(n)
a(n)=2/T*(int(f(x)*cos(n*w0*x),x,ug,og));
a(n)=simplify(a(n))
% Anzeigen und Berechnen des Amplitudenspektrum
figure 
subplot(1,2,1)
c=stem(0,abs(a_0));
set(c,'Color','blue','MarkerSize',0.1,'LineWidth',2);
for n=1:laenge_APS
    A(n)=sqrt((b(n))^2+(a(n))^2);  
end
d=stem(A,'o');
set(d,'Color','blue','MarkerSize',0.1,'LineWidth',2);
title('Amplitudenspektrum')
grid on
% Anzeigen und Berechnen des Phasenspektrum
subplot(1,2,2)
for n=1:laenge_APS 
    if(mod(n,2) == 0)
        P(n) = 0;
    else
    P(n)=atan2(a(n),b(n));
    end
end
d=stem(P,'o');
set(d,'Color','blue','MarkerSize',0.1,'LineWidth',2);
title('Phasenspektrum')
grid on
% Berechnung des Rekonstruierten Signals mit Hilfe des Amplituden- und
% Phasenspektrums
sym x
buff(x) = 0 * x;
for n=1:1:laenge_APS
   buff(x) = buff(x) + double(A(n)) * sin(n*w0*x + double(P(n)));
end
f_r(x) = buff(x);
f_r(x) = simplify(f_r);
% Anzeigen des Rekonstruierten Signals
figure;
fplot(f_r);
grid on;
axis([0 7 -1 1])