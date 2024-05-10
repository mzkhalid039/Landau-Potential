![image](https://github.com/mzkhalid039/Landau-Potential/assets/52278972/34ee38ae-ead2-4da2-845c-ed72fb390e3d)   ![image](https://github.com/mzkhalid039/Landau-Potential/assets/52278972/6247209f-944d-403e-b877-c363793262f9)



# MATLAB Code for Plotting a 1D & 3D Surface of Gibbs Free Energy Landscape

This repository contains a MATLAB script that generates a 3D surface plot of a Gibbs free energy landscape. The script utilizes various coefficients and variables to compute the Gibbs free energy, which is then plotted using a 3D surface plot.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Code Description](#code-description)
- [License](#license)

## Installation

To run the script, you need to have MATLAB installed on your system. You can download MATLAB [here](https://www.mathworks.com/products/matlab.html).

## Usage

1. Clone this repository to your local machine:
    ```shell
    git clone https://github.com/your-username/repository-name.git
    ```

2. Open the MATLAB script (`filename.m`) in MATLAB.

3. Run the script using the Run button in the MATLAB interface or by typing the script name in the Command Window.

## Code Description

- The script begins by clearing the MATLAB workspace (`clear; clc; close all;`).
- It creates a meshgrid of points (`[Px, Py]`) within a defined scale.
- Various coefficients  (`alpha0`, `alpha1`, `alpha11`, `alpha12`, `alpha111`, `alpha112`, `beta1`, `beta11`) are defined for computations.
- The code scales the coefficients by a factor of `1e7`.
- The script calculates the Gibbs free energy (`G_GL`) based on the defined coefficients and meshgrid points.
- A 3D surface plot is generated using the `surf` function to visualize the Gibbs free energy landscape.
- The plot is customized using various MATLAB functions (`colormap`, `gca`, `xlabel`, `ylabel`, `zlabel`) to set properties such as colormap, axis labels, and font size.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
