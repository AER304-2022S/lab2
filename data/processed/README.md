# Working with the processed data
1. Load the .mat file into your code. You can do this automatically by doing something along the lines of `load("../../data/processed/beam.mat")`.
2. The data is stored in the variable `beams` as a struct with named fields. This is a special type of data structure that works sort of like a Python class.
3. Each field in the struct corresponds to one beam. Each beam is further stored as a MATLAB table.
4. To access the fields in the table, you can do e.g. `beams.I3.load`, to get the load data for the I beam in 3-point loading.


# Data format
```
beams = 

  struct with fields:

          I3: [244×7 table]   <- 3-point loading I-beam - all data channels are useful
          I4: [168×7 table]   <- 4-point loading I-beam - all data channels are useful
    sandwich: [323×7 table]   <- Sandwich beam - strain gauges were not installed
     printed: [452×7 table]   <- 3d printed beam  - strain gauges were not installed
```

```
>> beams.I3

  244×7 table

     time       load       strain_1       strain_2       strain_3       strain_4        laser  
    ______    ________    ___________    ___________    ___________    ___________    _________

         0      188.19     1.8275e-06     2.0855e-06     1.8673e-06     2.4795e-06     0.050581
     0.792      176.91     1.9519e-06     2.1901e-06     1.8883e-06     2.6991e-06     0.062796
     1.792      186.37     2.1801e-06     2.5564e-06      2.108e-06      1.758e-06     0.067556
...
```