%% Sandwich Exp Fail.

clc; clear;

% Load Data and Trim
load("../../data/processed/beams.mat")
sandwich = beams.sandwich;
upper_limit = 278; % Specimen fractures after this point, do not use subsequent data!
lower_limit = 41; % Specimen isn't loaded at this point!

% Analysis
extension = sandwich.laser(lower_limit:upper_limit) - sandwich.laser(lower_limit);
MTS = sandwich.load(lower_limit:upper_limit) - sandwich.load(lower_limit);

[max_load, idx] = max(-MTS);
failure_displ = extension(idx);

% Plotting
plot(extension, MTS)
set(gca, 'Ydir', 'reverse'); set(gca, 'Xdir', 'reverse'); grid;
xlabel("Midspan Deflection, $\delta$, (mm)", "Interpreter", "latex")
ylabel("MTS Load, $P$, (N)", "Interpreter", "latex")
title("Loading of 3D Printed Beam", "Interpreter", "latex")
hold on
yline(-max_load, "--k", sprintf("%g N", max_load),...
    "LabelHorizontalAlignment", "left",...
    "LabelVerticalAlignment", "bottom", "interpreter", "latex");
ylim([-900, 0])

fprintf("Failure Load: %g N\n", max_load);
fprintf("Midspan Deflection at Failure: %g mm\n", failure_displ);


saveas(gcf, "../../figures/printed_beam.pdf")