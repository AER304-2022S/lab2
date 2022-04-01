clear
load("../../data/processed/beams.mat")
beam = beams.I3;
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
strain_theo = load*L*y/4/I/E;

figure
hold on
plot(load, strain_theo,'black')
xlabel("Load (N)", "Interpreter", "latex");
ylabel("Strain", "Interpreter", "latex");
title("Strain as a function of Load", "Interpreter", "latex");

% Strain Gauge 1
plot(load, strain1, 'b')

%Strain Gauge 2
plot(load, strain2, 'r')

%Strain Gauge 3
plot(load, strain3, 'y')

% Strain Gauge 4
plot(load, strain4, 'g')

legend('Theoretical strain (on neutral axis at midspan)', 'Strain gauge 1', 'Strain gauge 2', 'Strain gauge 3', 'Strain gauge 4', "location", "Southeast", "Interpreter", "latex");

hold off
saveas(gcf, 'Three_point_load.pdf')
