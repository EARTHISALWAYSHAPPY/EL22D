clear
clc

Num = 10;
Denom = [2 5 10];
H = 1;
Gs = tf(Num, Denom); % define transfer function G(s) = 10 / (2s^2 + 5s + 10)

kp = 1.5;
ki = 5.2;
kd = 5;
G_ctr = pid(kp, ki, kd); % define pid control 
graph_ctr = feedback(Gs * G_ctr, H); %cal closed-loop transfer function

graph_open = Gs;
t = 0:0.1:50; 

[y_open_noctr, t_out] = lsim(graph_open, ones(size(t)), t); %no control 
[y_closed_ctr, ~] = lsim(graph_ctr, ones(size(t)), t); %control 

figure;
plot(t_out, y_closed_ctr, 'b', 'LineWidth', 3);
hold on;
plot(t_out, y_open_noctr, 'r', 'LineWidth', 1);
title('Apply Matlab with PID Tuner');
xlabel('เวลา "Time" (seconds)');
ylabel('การตอบสนอง "Amplitude"');
legend('PID Control', 'No Control');
grid on;