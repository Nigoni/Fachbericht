%FFT Phasenanschnitt mit der Matlabfunktion
clear all,close all,clc
% Grundeinstellung der Berechnung
N=10000;
t=(1:N)/N;
f0=50;
figure;
window=zeros(1,N);
% Winkel des Phasenanschnittes eingeben 
alpha=pi/2;
% Berechnung der Funktion
show=100;
window((floor(alpha/(2*pi)*N)+1):N/2)=1;
window(floor((alpha+(pi))/(2*pi)*N):N)=1;
y = sin(2*pi*t*1).*window;
Y=fft(y);
% Anzeigen des Amplitudenspektrum
ax=subplot(2,1,1);
stem((0:(length(Y)/2/show)-11).*f0,abs(Y(1:(end/2/show)-10))./(N/2))
ax.Title.String='Amplitudenspektrum'
grid on
xlabel('Frequenz [Hz]')
ylabel('Amplitude')
% Anzeigen des Phasenspektrum
% ax=subplot(3,1,2)
% for-Schleife Bestimmung die 0-Werte des Phasenspektrum
% for i=1:length(Y)
%     if(abs(Y(i))<1)
%         Y(i)=0;
%     end
% end
% stem((0:(length(Y)/2/show)-11).*f0,angle(Y(1:(end/2/show)-10)))
% ax.Title.String='Phasenspektrum'
% grid on
% hold on
% Anzeigen der Funktion
subplot(2,1,2)
plot(t.*(2),y)
title('Funktion')
xlabel('Periodendauer')
ylabel('Amplitude')
grid on