% Load Data and Trim
load("../../data/processed/beams.mat")
printed = beams.printed;
upper_limit = 444; % Specimen fractures after this point, do not use subsequent data!

% Analysis
extension = printed.laser(1:upper_limit) - printed.laser(1);
MTS = printed.load(1:upper_limit) - printed.load(1);

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

