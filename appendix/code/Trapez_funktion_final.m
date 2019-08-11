% Trapez-funktion
clear all, close all, clc
syms x n;
assume(n,'integer')
% Werte Eingeben
% Wie lange der Wert 0 am Anfang und am Ende sein soll 
anfang=200;
% Wie lange es hinauffahren soll
gesauffahren=1050;
% Wie lange es den Wert 1 haben soll 
halten=500;
% Grundeinstellungen der Berechnungen
auffahren=anfang+gesauffahren;
runterfahren=auffahren;
ende=2*anfang+halten+2*gesauffahren;
ug = 0;
T = ende;
og=T;
w0=(2*pi)/T;
laenge_APS = 40;
% Berechnung der Trapez-Funktion
offset=1/(auffahren-anfang)*anfang;
f2_1(x)=1/(auffahren-anfang)*x-offset;
f2(x) = piecewise(x<anfang,0, anfang<x<auffahren, f2_1(x), 
auffahren<x<auffahren+halten,
1,auffahren+halten<x<auffahren+halten+gesauffahren,
-f2_1(x)+(f2_1(auffahren+halten))+1, 
auffahren+halten+gesauffahren<x<ende,0);
% Berechnung des Fourier-koefizienten a0 
a_0=2/T*(int(f2(x),x,ug,og));
a_0=simplify(a_0)
% Berechnung des Fourier-koefizienten b(n) 
b(n)=2/T*(int(f2(x)*sin(w0*n*x),x,ug,og));
b(n)=simplify(b(n))
% Berechnung der Fourier-koefizienten a(n)
a(n)=2/T*(int(f2(x)*cos(n*w0*x),x,ug,og));
a(n)=simplify(a(n))
% Anzeige der Trapez-Funktion
figure
subplot(1,2,1)
limits = [0 3000];
fplot(f2, limits)
axis([0 3000 0 3])
grid on
title('Trapez-Funktion')
xlabel('Zeit [ms]')
ylabel('Amplitude')
% Anzeige des Amplitudenspektrum
subplot(1,2,2)
c=stem(50,abs(a_0/2));
hold on
set(c,'Color','blue','MarkerSize',0.1,'LineWidth',2);
for n=1:laenge_APS
    A(n)=sqrt((b(n))^2+(a(n))^2);
    hold on
    d=stem(n+50,A(n),'o');
    set(d,'Color','blue','MarkerSize',0.1,'LineWidth',2);
end
title('Amplitudenspektrum')
grid on
xlabel('Frequenz [Hz]')
ylabel('Amplitude')
grid on