%Berechnung FFT Spannungen Phasenanschnitt 60 Grad
clc,clear all, close all
subplot(2,1,1);
N= csvread('Phasenanschnitt_S_60grad_kurz.csv');
plot(N(:,1),N(:,2),N(:,1),N(:,3),N(:,1),N(:,4))
title('Spannungssignal')
xlabel('Zeit [s]')
ylabel('Spannung [V]')
axis([0 0.2 -350 350])

subplot(2,1,2); 
hold on
box on
%Berechnung vom FFT
X=[N(:,2)' N(:,2)'];
T=  mean(diff(N(:,1)));
Fs = 1/T;                              
L = numel(X);      
LL=1:1:L;
window=1;
axis([0 2e3 0 400])
Y = fft(X.*window);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1)
FFT1= plot(f,P1); 
FFT1.Color = 'blue';
title('FFT vom Spannungssignal Phase 1')
xlabel('Frequenz [Hz]')
ylabel('Amplitude')
