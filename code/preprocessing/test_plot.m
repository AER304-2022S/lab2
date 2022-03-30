load("../../data/processed/beams.mat")

I_3 = beams.I3;

plot(-I_3.strain_1, -I_3.load, -I_3.strain_2, -I_3.load,...
    -I_3.strain_3, -I_3.load, -I_3.strain_4, -I_3.load)
grid
legend("Gauge 1", "Gauge 2", "Gauge 3", "Gauge 4", "Location", "Best")