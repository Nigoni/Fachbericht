clc, clear all
%Leistungsfaktor
%Phasenanschnitt
clc, clear all, close all hidden
alpha= linspace(0, 180, 180); 
alpha1= deg2rad(alpha);
ProzentAlpha= alpha1/(pi)*100;

lambda_prov= sqrt(1-alpha1/pi+1/(2*pi)*sin(2*alpha1));
%lambda_p= real(lambda_prov);
VP = 1-alpha1/pi+1/(2*pi)*sin(2*alpha1);
hold on
subplot(1,2,1)
plot(VP,lambda_prov)
%plot(lambda_p)
axis([0 1 0 1])
grid on
%ax1= gca;
%ax1_pos=ax1.Position;
%ax2= axes('Position', ax1_pos, 'XAxisLocation', 'top', 'Color', 'none')
title('Phasenanschnitt')
xlabel('Einschaltverhaeltnis [P_{\alpha}/P_{0}]')
ylabel('Leistungsfaktor [\lambda]')

% Schwingungspaketsteuerung
a= linspace(0.1, 1, 10 );

lambda_s= sqrt(a);
subplot(1,2,2)
plot(a,lambda_s)
grid on
axis([0 1 0 1])
title('Schwingungspaket')
xlabel('Einschltverhaeltnis [a]')
ylabel('Leistungsfaktor [\lambda]')

%Differenz ausprobieren
%x= fsolve(lambda_s lambda_p)