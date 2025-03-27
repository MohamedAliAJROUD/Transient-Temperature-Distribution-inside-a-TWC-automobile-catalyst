# Transient-Temperature-Distribution-inside-a-TWC-automobile-catalyst
MATLAB code for solving Transient Temperature Distribution inside a TWC automobile catalyst
# Transient Temperature Distribution in Monolith

## Overview

This MATLAB project simulates the transient temperature distribution in a monolithic catalyst reactor using analytical methods. The script solves for the temperature distribution considering heat generation, gas flow temperature, and convective heat transfer.

## Features

- Solves for eigenvalues using transcendental equation
- Computes temperature distribution as a function of radius and time
- Generates 2D surface plot of temperature distribution
- Plots initial and final temperature profiles
- Uses Bessel functions for analytical solution

## Prerequisites

- MATLAB (R2020a or later recommended)
- Signal Processing Toolbox
- Symbolic Math Toolbox

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/monolith-temperature-distribution.git
```

2. Open the project in MATLAB

## Usage

Run the `monolith_temperature_distribution.m` script directly in MATLAB. The script will generate two figures:
- A heatmap of temperature distribution over time and radius
- A line plot comparing initial and final temperature profiles

## Parameters

Key parameters in the script:
- `Q_react`: Heat generation rate (W/m³)
- `T_gas_flow`: Gas temperature (K)
- `h`: Convection coefficient (W/m²K)
- `k`: Thermal conductivity (W/mK)
- `R`: Monolith radius (m)
- `N`: Number of modes to compute

## Theoretical Background

The temperature distribution is solved using:
- Eigenvalue analysis
- Bessel function solutions
- Analytical heat transfer equations

## Results Interpretation

- The heatmap shows how temperature evolves across the monolith radius over time
- The line plot compares initial and final temperature profiles

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## Contact

Mohamed Ali AJROUD - mohamedali.ajroud03@gmail.com
