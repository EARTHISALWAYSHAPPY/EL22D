clear
clc

kp = 1.5;
ki = 5.2;
kd = 5;

Num = 10;
Denom = [2 5 10];
H = 1;  
Gs = tf(Num, Denom);

G_ctr = pid(kp, ki, kd);
graph_ctr = feedback(Gs * G_ctr, H);

graph_open = Gs;
t = 0:0.1:50;

[y_closed, t_out] = lsim(graph_ctr, ones(size(t)), t);
[y_open, ~] = lsim(graph_open, ones(size(t)), t);

figure;
plot(t_out, y_closed, 'b', 'LineWidth', 3);  
hold on;
plot(t_out, y_open, 'r', 'LineWidth', 1);  
title('Apply Matlab with PID Tuner');
xlabel('Time (seconds)');
ylabel('Response');
legend('PID Control', 'No Control');
grid on;