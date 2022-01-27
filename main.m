clc
clear all;
close all;

syms t
syms s

A_t = [0 1 ; 0 0];
F_t = [0 ; 1];
v_t = 0;
Q_c = 100;


p = [0 0 0]';
I = eye(length(p));
dotp = [0 0 0]';
x_init = [p ; dotp];
K_init = 0;
t_init = 0;
delta_t = 0.01;
T = t_init:delta_t:10;
length(T)
mu_init = 0;

tf = transfer_function(t,s,I);
% Construct trajectories
for i = 1:length(T)

    x(i) = tf(T(i),t_init)*x_init+int(subs(tf,[t],[T(i)])*(v_t),t_init,T(i));

end

% Iteration for convergence
for i=1:100
    %     Q_mat = Q_matrix(delta_t,Q_c,T,K_init)
    Q = Q_matrix(delta_t,Q_c,T,t_init,K_init,tf);
    %     function A_mat = A_matrix(tf,T)
    A = A_matrix(T,t_init,tf);
    %     function v_vec = v_vector(T,V,mu_init)
    v = v_vector(T,t_init,v_t,mu_init,tf);

    % Now calculate
    mu = A*v;
    K = A*Q*transpose(A);
%     deltaX = 
end

