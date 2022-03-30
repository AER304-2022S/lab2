% Set up variable/file names and data structure
beam_names = ["I3", "I4", "sandwich", "printed"];
file_names = ["aluminum_3point.txt", "aluminum_4point.txt"...
    "sandwich_beam.txt", "3D_printed_beam.txt"];
beams = struct;


% Load data and process everything
for i = 1:4
    A = readmatrix(...
        strcat("../../data/raw/", file_names(i)));
    A = A(10:end, 2:end-1); % Trim headers
    
    time = A(:, 1); % s
    load = A(:, 2); % N
    strain_1 = A(:, 5);
    strain_2 = A(:, 6);
    strain_3 = A(:, 7);
    strain_4 = A(:, 8);
    laser = A(:, 9); % mm

    % Assigns data to the struct like a dictionary
    beams.(beam_names(i)) = ...
        table(time, load, strain_1, strain_2, strain_3, strain_4, laser);
end
save ../../data/processed/beams.mat beams