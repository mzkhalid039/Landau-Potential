syms alpha1 alpha11 alpha111 alpha12 alpha112 C11 C44 ex ey exy Px Py Q11 Q44 Ex Ey

% Define the function F
GL_threefold = alpha112 * cos(3 * atan(Px/Py));

fL = alpha1 * (Px^2 + Py^2) + alpha11 * (Px^4 + Py^4) + alpha111 * (Px^6 + Py^6) + alpha12 * Px^2 * Py^2 + alpha112 * (Px^4 * Py^2 + Px^2 * Py^4) +  GL_threefold - Ex*Px - Ey*Py;
fe = (1/2) * (C11 * (ex^2 + ey^2) + 2 * (C11 - 2 * C44) * ex * ey + 4 * C44 * ey^2) + Q11 * (ex^2 * Px^2 + ey^2 * Py^2) + (Q11 - 2 * Q44) * (ex * Py^2 + ey * Px^2) + 4 * Q44 * exy * Px * Py;

F = fL + fe;

% Calculate the first-order partial derivatives
dF_dPx = diff(F, Px);
dF_dPy = diff(F, Py);

dF_dex = diff(F, ex);
dF_dey = diff(F, ey);

% Display the results
disp(['Partial derivative of F with respect to Px: dF/dPx = ' char(dF_dPx)]);
disp(['Partial derivative of F with respect to Py: dF/dPy = ' char(dF_dPy)]);
disp(['Partial derivative of F with respect to ex: dF/dex = ' char(dF_dex)]);
disp(['Partial derivative of F with respect to ey: dF/dey = ' char(dF_dey)]);
