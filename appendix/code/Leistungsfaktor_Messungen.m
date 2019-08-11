%Leistungsfaktor Widerstand mit Phasenanschnitt 60
clc,clear all, close all
subplot(2,1,1);     %Herauslesen und plotten Spannung
N= csvread('Test_Leistungsfaktor_Widerstand_Phas60.csv');
plot(N(:,1),N(:,2)) 
title('Spannungssignal')
xlabel('Zeit [s]')
ylabel('Spannung [V]')
hold on
grid on
box on
axis([0 0.2 -400 400])

subplot(2,1,2); %Herauslesen und plotten Strom
hold on
grid on
box on
plot(N(:,1),N(:,3)+0.0804)  %Offset eliminieren
title('Stromsignal')
xlabel('Zeit [s]')
ylabel('Strom [A]')
axis([0 0.2 -2 2])

U= N(:,2);  %U(t) Werte herauslesen
I = (N(:,3)+0.0804);    %I(t) Werte herauslesen und Offset eliminieren
P= U.*I;    %Wirkleistung berechnen
P0 = mean(P); %Mittelwert der Wirkleistung

Ueff= sqrt(mean(U.^2)); %Effektivspannung berechenen
Ieff= sqrt(mean(I.^2));     %Effektivspannung berechenen

lambda= P0/(Ieff*Ueff)  %Leistungsfaktor berechnen & ausgeben
Wirkleistung= P0   %Wirkleistung ausgeben
Scheinleistung= mean(Ueff*Ieff)  %Scheinleistung berechnen & ausgeben
Spannung= Ueff    %Effektivspannung  ausgeben
Strom= Ieff %Effektivstrom ausgeben