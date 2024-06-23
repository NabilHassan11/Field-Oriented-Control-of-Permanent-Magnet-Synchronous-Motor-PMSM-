R = 0.05;
L = 0.000635;
t_s = L/R;
V_s = 1/R;
t_o = 0.00004;
Kp = 7.9375;
T_n = t_s;
G_c = Kp*tf([T_n 1],[T_n 0]);
G_s = V_s*tf(tf(1,[t_s 1])*tf(1,[t_o 1]),1);
L_s = G_c*G_s
gamma = (t_o/t_s)*V_s*Kp
L_s = gamma*(tf(1,[t_o 0])*tf(1,[t_o 1]))
T_Ls = feedback(L_s,1)
W_o = (sqrt(gamma)/t_o)
d = 1/(2*sqrt(gamma))
figure
step(G_c)
grid on
figure
step(T_Ls)
figure
bode(T_Ls)