clear; clc;
load("../../data/processed/beams.mat")
beam = beams.I4;
load = beam.load;
strain1 = beam.strain_1;
strain2 = beam.strain_2;
strain3 = beam.strain_3;
strain4 = beam.strain_4;
laser = beam.laser;

% Moment of Inertia
A = [(5+12.16)/2*64.06;58.89*9.02;(5+12.16)/2*64.06];
d = [76.05-8.58/2;76.05/2;8.58/2];

y_bar = (dot(A, d))/(sum(A));

d_bar = d - y_bar;
A_d_2 = A.*d_bar.^2;
I_i = [64.06*8.58^3/12;9.02*58.89^3/12;64.06*8.58^3/12];

I = sum(A_d_2) + sum(I_i);

% Theoretical Strain
L = 400; % in mm
y = 38.025; % bottom to Neutral axis in mm
E = 72000; % MPa 
strain_theo = load*(L/2-30)*y/2/I/E;
newcolors = {'#0072BD','#D95319','#EDB120','#7E2F8E','#77AC30','#4DBEEE','#A2142F'};

figure
hold on
plot(load, strain_theo,'black', 'LineStyle', '--')
set(gca, 'Ydir', 'reverse');
set(gca, 'Xdir', 'reverse');
grid;
xlabel("Load, $P$,(N)", "Interpreter", "latex");
ylabel("Engineering Strain, $\epsilon$, (mm/mm)", "Interpreter", "latex");
title("4 Point Loading, Strain vs. Loading Curve", "Interpreter", "latex");

% Strain Gauge 1
plot(load, strain1,'color', '#7E2F8E')

%Strain Gauge 2
plot(load, strain2, 'color', '#77AC30')

%Strain Gauge 3
plot(load, strain3, 'color', '#4DBEEE')

% Strain Gauge 4
plot(load, strain4, 'color', '#A2142F')

legend('Theoretical Engineering Strain', 'Strain gauge 1', 'Strain gauge 2', 'Strain gauge 3', 'Strain gauge 4', "location", "Northwest", "Interpreter", "latex");

hold off
saveas(gcf, 'Four_point_load.pdf')
