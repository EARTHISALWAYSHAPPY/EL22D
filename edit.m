clc
clear
W = logspace(1 , 4 , 1000); % W = 10-1000 rad/s
Vs = 12.*cos(W);            % Voltage
R = 100;                    % Resistor
L = 100e-3;                 % Inductor
C = 40e-6;                  % Capacitor

% init cal value
Zr = R;                     % ZR
Zl = 1j.*W.*L;              % ZL
Zc = 1./(1j.*W.*C);         % ZC
Zt = Zr + Zl + Zc;          % ZT(total)

% plot Zc vs W
figure(1)                    
abs_Zc = abs(Zc);
semilogx(W,abs_Zc);
xlabel("W (rad/s)");
ylabel("ZC (ohm)");
grid minor

% plot Zl vs W 
figure(2)
abs_Zl = abs(Zl);
semilogx(W,abs_Zl);
xlabel("W (rad/s)");
ylabel("ZL (ohm)");
grid minor
 %%%%
