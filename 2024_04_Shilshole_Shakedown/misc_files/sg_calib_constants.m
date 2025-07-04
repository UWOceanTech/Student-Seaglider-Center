% sg_calib_constants.m
% values for basestation calculations, diveplot.m, etc.
% last edited 27-Sept-2013 by F.Stahr, UW-SFC 
% last edited 19-Apr-2024 by K. Kohlman

% basic glider and mission params
id_str 	=	'194'	;

%mass 	=	58.592	; % in kg, for Puget Sound
% mass	=	58.852	; % in kg, for Cuddy Survey 23oct2013 spreadsheet
mass_comp=	0	; % in kg, for Puget Sound
mass = 53.536;	% 05 April 2024

%volmax =	57480	; % in cc, from tank for PS
volmax =       	58351	; % in cc, from PS regressions
%volmax	=	57xxx	; % in cc, from projection for ocean ballast
%volmax = 57903; % Cuddy dives 2:4 25oct13
%volmax = 57893; % Cuddy dives 4:17 25-28oct13
% volmax = 57898; % Cuddy dives 4:18 25-28oct13 nominal abs_compress, therm_espan
volmax = 58351; % tank 12 Dec 2017

%mission_title = 'Puget-Sound';	
mission_title	= 'Shilshole Shakedown';

rho0 	= 	1023.2	; % in kg/m3 for PS
%rho0	=	1027.7	; % for open ocean waters 

% regressed hydrodynamic modeland expansion parameters				
%hd_a = 3.46015e-03;
%hd_b = 1.05517e-02;
%hd_c = 8.91183e-05;

hd_a = 3.91313e-03;% Cuddy dives 4:18 25-28oct13 nominal abs_compress, therm_espan
hd_b = 1.06076e-02;
hd_c = 4.97013e-06;

abs_compress = 4.4e-6;  % SG vehicle compressibility
therm_expan = 70.5e-6;    % SG thermal expansion coeff [/degree C]

% 31-Jan-2018 16:20:31 Fitting [vbdbias] RMS=1.9006 cm/s Dives: 2:4
volmax = 58330.4;
hd_a = 3.91313e-03;
hd_b = 1.06076e-02;
hd_c = 4.97013e-06;
abs_compress = 4.4000e-06;
therm_expan  = 7.0500e-05;

temp_ref = 15;  % reference temperature for SG thermal expansion calculation
pitchbias = 0;	% pitch reference in regressions

% CT sensors cal constants (19 Apr 2024 KK)
calibcomm ='SN 0238, cal 01-Aug-20';	% SN and cal date
t_g 	=	4.39369977e-03	;	
t_h 	=	6.30855428e-04	;	
t_i 	=	2.38607629e-05	;	
t_j 	=	2.79367400e-06	;	
c_g 	=	-9.90310552e+00	;	
c_h 	=	1.15887126e+00	;	
c_i 	=	-1.71334330e-03	;	
c_j 	=	2.09814035e-04	;	
				
% Oxygen cal constants				
comm_oxy_type= 'Optode 4831' ;
calibcomm_oxygen ='SN 166, cal 17-Apr-13'; % SN and cal date
optode_st_calphase = 34.01; % pt1940012.eng
% optode_st_temp =  3.86; % pt1940012.eng REALLY??
optode_st_slp = 1023.4; % UW atmospheric sciences

optode_st_calphase = 32.92; % deck 12/12/2017 1900 p1940004.eng
optode_st_temp =  8.32; % deck 12/12/2017 1900 p1940004.eng
optode_st_slp = 1033.1; % UW atmospheric sciences

optode_TempCoef0 =  2.18764e+01;
optode_TempCoef1 = -3.08265e-02;
optode_TempCoef2 =  2.91954e-06;
optode_TempCoef3 = -4.20034e-09;
optode_TempCoef4 = 0.0;
optode_TempCoef5 = 0.0;

optode_PhaseCoef0 = 0.0;
optode_PhaseCoef1 = 1.0;
optode_PhaseCoef2 = 0.0;
optode_PhaseCoef3 = 0.0;

optode_FoilCoefA0 = -2.988314e-06;
optode_FoilCoefA1 = -6.137785e-06;
optode_FoilCoefA2 =  1.684659e-03;
optode_FoilCoefA3 = -1.857173e-01;
optode_FoilCoefA4 =  6.784399e-04;
optode_FoilCoefA5 = -5.597908e-07;
optode_FoilCoefA6 =  1.040158e+01;
optode_FoilCoefA7 = -5.986907e-02;
optode_FoilCoefA8 =  1.360425e-04;
optode_FoilCoefA9 = -4.776977e-07;
optode_FoilCoefA10 = -3.032937e+02;
optode_FoilCoefA11 =  2.530496e+00;
optode_FoilCoefA12 = -1.267045e-02;
optode_FoilCoefA13 =  1.040454e-04;

optode_FoilCoefB0 = -3.560390e-07;
optode_FoilCoefB1 =  3.816713e+03;
optode_FoilCoefB2 = -4.475507e+01;
optode_FoilCoefB3 =  4.386164e-01;
optode_FoilCoefB4 = -7.146342e-03;
optode_FoilCoefB5 =  8.906236e-05;
optode_FoilCoefB6 = -6.343012e-07;
optode_FoilCoefB7 = 0.0;
optode_FoilCoefB8 = 0.0;
optode_FoilCoefB9 = 0.0;
optode_FoilCoefB10 = 0.0;
optode_FoilCoefB11 = 0.0;
optode_FoilCoefB12 = 0.0;
optode_FoilCoefB13 = 0.0;

% this glider carries WET Labs sensor BB2FL-VMT SN 856, cal date 19-Sep-11
 
% end of file
