% MATLAB Script to solve and plot the transient temperature distribution
clc; clear; close all;

% Given parameters
Q_react = 5e5;      % Heat generation, W/m^3
T_gas_flow = 800;   % Gas temperature, K
h = 200;            % Convection coefficient, W/m^2K
k = 2;              % Thermal conductivity, W/mK
R = 5e-4;           % Monolith radius, m
alpha = k;          % Simplified thermal diffusivity assumption
N = 5;              % Number of modes to compute

% Solve for lambda_n using fsolve
syms lambda
transc_eq = @(lambda) -k * lambda * besselj(1, lambda * R) - h * besselj(0, lambda * R);

% Initial guesses using Bessel function zeros
lambda_guesses = linspace(1e3, 1e6, 10) / R;
lambda_n_values = double(vpasolve(transc_eq(lambda), lambda_guesses));
lambda_n_values = unique(lambda_n_values(lambda_n_values > 0));

% Compute A_n coefficients
A_n = zeros(length(lambda_n_values), 1);
for i = 1:length(lambda_n_values)
    lambda_n = lambda_n_values(i);
    num = integral(@(r) r .* besselj(0, lambda_n * r), 0, R);
    denom = integral(@(r) r .* (besselj(0, lambda_n * r)).^2, 0, R);
    A_n(i) = num / denom;
end

% Define temperature function T(r,t)
r_vals = linspace(0, R, 50); % Radial positions
t_vals = linspace(0, 0.01, 50); % Time values
T = zeros(length(r_vals), length(t_vals));

for j = 1:length(t_vals)
    t = t_vals(j);
    for i = 1:length(r_vals)
        r = r_vals(i);
        T_s = Q_react * (R^2 - r^2) / (4 * k); % Steady-state solution
        T_t = sum(A_n .* besselj(0, lambda_n_values * r) .* exp(-alpha * lambda_n_values.^2 * t));
        T(i, j) = T_s + T_t;
    end
end

% Plot results
figure;
surf(t_vals, r_vals, T, 'EdgeColor', 'none');
colorbar;
xlabel('Time (s)'); ylabel('Radius (m)'); zlabel('Temperature (K)');
title('Temperature Distribution T(r,t)');
view(2); % Heatmap view

figure;
plot(r_vals, T(:, end), 'r', 'LineWidth', 2);
hold on;
plot(r_vals, T(:, 1), 'b--', 'LineWidth', 2);
xlabel('Radius (m)'); ylabel('Temperature (K)');
legend('Final Temperature Profile', 'Initial Temperature Profile');
title('Temperature Distribution in the Monolith');