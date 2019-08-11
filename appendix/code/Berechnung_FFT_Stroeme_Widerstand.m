%Phasenanschnitt 60 Grad
clc,clear all, close all hidden
subplot(4,1,1);
N= csvread('Phasenanschnitt_Widerstand_S_Stroeme_60grad_lang.csv');
plot(N(:,1),N(:,2),N(:,1),N(:,3),N(:,1),N(:,4))
title('Stromsignal')
xlabel('Zeit [s]')
ylabel('Strom [A]')
axis([-0.05 0.02 -2.5 2.5])
hold on
grid on
box on

subplot(4,1,2); 
hold on
box on
grid on
% Berechnung FFT Originalstrom
X=[N(:,2)' N(:,2)'];
T=  mean(diff(N(:,1)));
Fs = 1/T;                    
L = numel(X); 
LL=1:1:L;
window=1;
Y = fft(X.*window);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
FFT2= plot(f,P1); 
FFT2.Color = 'blue';
title('FFT vom Stromsignal Phase 1')
xlabel('Frequenz [Hz]')
ylabel('Amplitude')
axis([0 1e3 0 2])

subplot(4,1,3)
% Hochrechnen Stroeme auf 16A
hold on
grid on
box on
plot(N(:,1),N(:,2)*(11.14541277),N(:,1),
N(:,3)*(11.14541277),N(:,1),N(:,4)*(11.14541277));
title('Stromsignal')
xlabel('Zeit [s]')
ylabel('Strom [A]')
axis([-0.05 0.02 -30 30])

subplot(4,1,4)
% Berechnung FFT der hochgerechneten Stroeme
hold on
grid on
box on
X=[N(:,2)' N(:,2)'];
X1=[X*(11.14541277)];
T=  mean(diff(N(:,1)));
Fs = 1/T;                         
L = numel(X1);             
LL=1:1:L;
window=1;
Y = fft(X1.*window);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
FFT2= plot(f,P1); 
FFT2.Color = 'blue';
title('FFT vom Stromsignal Phase 1')
xlabel('Frequenz [Hz]')
ylabel('Amplitude')
axis([0 1e3 0 25])