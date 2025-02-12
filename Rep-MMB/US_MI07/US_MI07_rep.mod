% US_MI07
% 
% Rep-MMB of the Macroeconomic Model Data Base (MMB)
% https://www.macromodelbase.com/rep-mmb
%
% This is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.

//**************************************************************************
// Model: US_MI07 - Rational Expectations version of Milani (2007)
//
// Further references:
// Milani, F. "Expectations, learning and macroeconomic persistence."
// Journal of Monetary Economics 54 (2007), pp. 2065-2082.
//
// Last edited: 11/08/01 by P. Kuang & D. Stijepic
//**************************************************************************



%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------
//Define endogenous variables
var i pi pi_tilde x x_tilde r_n u;

//Define exogenous variables
varexo v_r v_u;

//Define parameters
parameters
beta sigma gamma xi_p omega eta phi_r phi_u rho_i rho_pi rho_x;


%----------------------------------------------------------------
% 2. Calibration and Estimation
%----------------------------------------------------------------
beta = 0.9897;
sigma= 2.666; //sigma=1/(phi*(1-beta*eta)), where phi=3.813
gamma= 0.885;
xi_p=0.001;
omega=0.837;
eta=0.911;
phi_r=0.87;
phi_u=0.02;
rho_i =	0.914;
rho_pi =1.484;
rho_x =0.801;


%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------
model(linear);

// Original Model Code:
x_tilde=x_tilde(+1)-(1-beta*eta)*sigma*(i-pi(+1)-r_n);
pi_tilde=xi_p*(omega*x+((1-beta*eta)*sigma)^(-1)*x_tilde)+beta*pi_tilde(+1)+u;

pi_tilde=pi-gamma*pi(-1);
x_tilde=(x-eta*x(-1))-beta*eta*(x(+1)-eta*x);

r_n=phi_r*r_n(-1)+v_r;
u=phi_u*u(-1)+v_u;
i= rho_i*i(-1) + (1-rho_i)*(rho_pi*pi + rho_x*x);
end;


//Shocks
shocks;
var v_r= 1.67^2;
var v_u=1.15^2;
end;


//Simulation
//***************************
//The following was commented out for use in Rep-MMB
//Nov. 2024
//stoch_simul (AR=100,IRF=0, noprint,nograph);
//stoch_simul (irf = 0, ar=100, noprint);
//*****************************
stoch_simul (AR=0, IRF=0, order=1, noprint, nograph, nocorr, nodecomposition, nofunctions, nomoments, nomodelsummary);


