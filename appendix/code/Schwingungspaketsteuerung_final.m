% Schwingungspaketsteuerung 
clear all, close all, clc
syms x n;
assume(n,'integer')
% Werte des duty cycle eingeben
duty_cycle = 0.5;
% Grundeinstellungen
laenge_APS = 100;
T=5*20*pi;
w0=((2*pi)/T);
packet_ausgeschaltet=10-(duty_cycle*10);
Periden_laenge = 20*pi;
ug = 0;
og = 5*20*pi;
packetkomplet = 2*pi*packet_ausgeschaltet;
% Berechnung der Schwingungspaket-Funktion
if packetkomplet== 0
    f(x) = sin(x)
elseif packetkomplet > 0
   f(x) = piecewise(x < packetkomplet, 0, 
   packetkomplet< x <Periden_laenge, sin(x), 
   x < packetkomplet+1*Periden_laenge, 
   0, packetkomplet+1*Periden_laenge< x <Periden_laenge+1*Periden_laenge, sin(x), 
   x < packetkomplet+2*Periden_laenge, 0,
   packetkomplet+2*Periden_laenge< x <Periden_laenge+2*Periden_laenge, sin(x),
   x < packetkomplet+3*Periden_laenge, 0,
   packetkomplet+3*Periden_laenge< x <Periden_laenge+3*Periden_laenge, sin(x),
   x < packetkomplet+4*Periden_laenge, 0, 
   packetkomplet+4*Periden_laenge< x <Periden_laenge+4*Periden_laenge, sin(x));
end
% Anzeigen der Funktion
figure
limits = [0 315];
fplot(f, limits)
grid on
title('Funktion')
% Berechnung des Fourier-koefizienten a0 
a_0=2/T*(int(f(x),x,ug,og));
a_0=simplify(a_0);
% Berechnung des Fourier-koefizienten b(n) 
b(n)=2/T*(int(f(x)*sin(w0*n*x),x,ug,og));
b(n)=simplify(b(n));
% Berechnung der Fourier-koefizienten a(n) 
a(n)=2/T*(int(f(x)*cos(n*w0*x),x,ug,og));
a(n)=simplify(a(n));
% Berechnung und Anzeige des Amplitudenspektrum von 0 - 100 Hz
figure 
subplot(1,2,1)
c=stem(0,abs(a_0));
set(c,'Color','blue','MarkerSize',0.1,'LineWidth',2);
for n=1:laenge_APS
    A(n)=sqrt((b(n))^2+(a(n))^2);
    hold on
    d=stem(n,A(n),'o');
    set(d,'Color','blue','MarkerSize',0.1,'LineWidth',2);
end
title('Absolute, linear 0 - 100 Hz')
xlabel('Frequenz [Hz]')
axis ([0 laenge_APS 0 1])
grid on
% Berechnung und Anzeige des Amplitudenspektrum von 0 - 1000 Hz 
subplot(1,2,2)
c=stem(0,abs(a_0));
set(c,'Color','blue','MarkerSize',0.1,'LineWidth',2);
for n=1:1000
    A(n)=sqrt((b(n))^2+(a(n))^2);
    hold on
    d=stem(n,A(n),'o');
    set(d,'Color','blue','MarkerSize',0.1,'LineWidth',2);
end
axis ([0 1000 0 1])
xlabel('Frequenz [Hz]')
title('Absolute, linear 0 - 1000 Hz')
grid on
% Berechnung und Anziege des Absoluten logarithmzus in db
figure 
c=stem(0,abs(a_0));
set(c,'Color','blue','MarkerSize',0.1,'LineWidth',2);
for  n=5:5:laenge_APS
   A(n) = sqrt((b(n))^2+(a(n))^2);
   B(n)= (20*log10(A(n)));
   if B(n)==-Inf
      B(n)=-100;
   end
   hold on
   C(n)=n*0-60;
   hold on
   d=stem(n,C(n),'o');
   v=stem(n,B(n),'o');
   set(d,'Color','blue','MarkerSize',0.1,'LineWidth',0.00001);
   set(v,'Color','white','MarkerSize',0.1,'LineWidth',0.00001);
   grid on
end
title('Absolut logarithmic')
xlabel('Frequenz [Hz]')
axis([0 100 -60 0])
ylabel('Dezibel [dB]')
grid on
