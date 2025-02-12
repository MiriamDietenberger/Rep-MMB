% US_OR03
% 
% Rep-MMB of the Macroeconomic Model Data Base (MMB)
% https://www.macromodelbase.com/rep-mmb
%
% This is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.

//**************************************************************************
// Further references:
// Orphanides, A. 2003. "The quest for prosperity without inflation."
// Journal of Monetary Economics 50 (2003) 633-663
//
// Last edited: 10/09/07 by S. Schmidt
//**************************************************************************


%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------
//Define endogenous variables
var y pi f;

//Define exogenous variables
varexo e u interest_;

//Define parameters
parameters

b0 bpi1 bpi2 bpi3 bpi4 by1 by2 by3 by4 bf1 bf2 bf3 bf4 api1 api2 api3 api4 ay0 ay1 ay2 ay3 ay4;


%----------------------------------------------------------------
% 2. Calibration and Estimation
%----------------------------------------------------------------
b0 = 0.175638173; //intercept; has to be dropped possibly
bpi1 = 0.023509403;
bpi2 = -0.018273476;
bpi3 = -0.009214318;
bpi4 = 0.085793876;
by1 = 1.108346534;
by2 = 0.111102286;
by3 = -0.184403424;
by4 = -0.090084761;
bf1 = -0.021894643;
bf2 = -0.325769155;
bf3 = 0.261153539;
bf4 = 0.004694774;

api1 = 0.3280;
api2 = 0.3034;
api3 = 0.2584;
api4 = 0.1102;
ay0 = 0.2835;
ay1 = 0.0273;
ay2 = -0.3418;
ay3 = 0.2986;
ay4 = -0.1245;


%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------
model(linear);

// Original Model Code:

y = b0 + bpi1*pi(-1) + bpi2*pi(-2) + bpi3*pi(-3) + bpi4*pi(-4) + by1*y(-1) + by2*y(-2) + by3*y(-3) + by4*y(-4) + bf1*f(-1) + bf2*f(-2) + bf3*f(-3) + bf4*f(-4) + u;
pi = api1*pi(-1) + api2*pi(-2) + api3*pi(-3) + api4*pi(-4) + ay0*y + ay1*y(-1) + ay2*y(-2) + ay3*y(-3) + ay4*y(-4) + e;

// original interest rate rules
f = 2 + pi + 0.5*(pi - 2) + 0.5*y + interest_; //Taylor rule
//f = 2 + pi + 0.5*(pi - 2) + 1.0*outputgap + interest_; //Revised Taylor rule

end;


//Shocks
shocks;
var u = 0.771025149^2;
var e = 1.4069906748^2;
var interest_ = 0;
end;


//Simulation
//***************************
//The following was commented out for use in Rep-MMB
//Nov. 2024
//stoch_simul (AR=100,IRF=0, noprint,nograph);
//stoch_simul (irf = 60);
//*****************************
stoch_simul (AR=0, IRF=0, order=1, noprint, nograph, nocorr, nodecomposition, nofunctions, nomoments, nomodelsummary);


