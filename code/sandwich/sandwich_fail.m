clear
b = 49.75e-3;
L = 211.5e-3;
t = 1.25e-3;
c = 32.13* 1e-3;
d = c - t;
%length all in m
E_f = 70e9;
s_f_comp = 570e6;
s_f_tens = 600e6;

E_c = 67e6;
G_c = 19e6;
tau_c = 792e3; 
s_c = 1.01e6;
%all strength in Pa

micro = 4 * b * d * t *s_f_comp/L
core = 2*b*d*tau_c
wrink = 2 * b * t * d/L * (E_f * E_c * G_c)^1/3
indent_elas = b * t *(pi^2 * d * E_f * s_c^2/(3*L))^(1/3)
%indent_plas not needed anymore because it is not applicable to our
%material

EI_eq = E_f*b*t*d^2/2 + E_f*b*t^3/6 + E_c*b*c^3/12;
AG_eq = b*d^2*G_c/c;

fail = [micro; core; wrink;indent_elas];

fail = fail/1e3;
P = min(fail)*1e3;

delta = P*L^3/(48*EI_eq) + P*L/(4*AG_eq)