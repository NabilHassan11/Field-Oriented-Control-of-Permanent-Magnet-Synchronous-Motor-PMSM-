J = 0.011; % rotor inertia
B = 0.001889;
R = 0.05;  %stator resistance
L = 0.000635; %stator inductance
K = (3/2)*0.191*4;
P = 4;
Lambda_m = 0.191;
t_s = L/R; %stator time constant 
Te = 0.02544; %Total time delay
Tn = 4*Te;
Kp = J/(2*Te);
G = tf(1,[Te 1])*tf(1,[J B])*K
C = tf([Kp*Tn Kp],[Tn 0])
T = feedback(C*G,1)
figure
step(T);grid on;