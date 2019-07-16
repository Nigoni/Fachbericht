%Leistungsfaktor
%Phasenanschnitt
clc, clear all, close all hidden
alpha= linspace(0, 180, 180); 
alpha1= deg2rad(alpha);
ProzentAlpha= alpha1/(pi)*100;

lambda_prov= sqrt(1-alpha1/pi+1/(2*pi)*sin(2*alpha1));
lambda_p= real(lambda_prov);
VP = 1-alpha1/pi+1/(2*pi)*sin(2*alpha1);
hold on
subplot(1,2,1)
plot(lambda_p)
axis([0 180 0 1])
grid on

title('Phasenanschnitt')
xlabel('Zuendwinkel in Grad')
ylabel('Leistungsfaktor')

% Schwingungspaketsteuerung
a= linspace(0.001, 1, 100);

lambda_s= sqrt(a);
subplot(1,2,2)
plot(lambda_s)
grid on
%axis([0 1 0 1])
title('Schwingungspaket')
xlabel('Einschaltzeitverhaeltnis [%]')
ylabel('Leistungsfaktor')

