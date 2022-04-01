b = 49.75e-3;
L = 211.5e-3;
t = 1.25e-3;
d = (32.13 - t) * 1e-3;
%length all in m
sigma_c = 1.01e6;
E_c = 67e3;
G_c = 19e3;
tau_c = 792e3; 

E_f = 70e6;
sigma_f_comp = 570e3;
sigma_f_tens = 600e3;
%all strength in Pa


micro = 4 * b * d * t *sigma_f_comp/L
core = 2*b*d*tau_c
wrink = 2 * b * t * d/L * (E_f * E_c * G_c)^1/3
indent_elas = b * t *(pi^2 * d * E_f * sigma_c^2/(3*L))^(1/3)
indent_plas = 2 * b * t*(sigma_c*sigma_f_tens)^(1/2)

