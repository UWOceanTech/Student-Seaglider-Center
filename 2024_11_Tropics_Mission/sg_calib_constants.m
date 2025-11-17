% sg_calib_constants.m			
% values for basestation calculations, diveplot.m, etc.
% last edited 27-Sept-2013 by F.Stahr, UW-SFC 
% last edited 05-Apr-2024 by C.Eriksen
% last edited 19-Nov-2024 by K. Kohlman

% basic glider and mission params				
id_str 	=	'195'	;	
%mass 	=	53.765; % in kg, for Puget Sound
% mass = 53.765;  % 21oct13 spreadsheet
%mass = 53.765;% 05apr2024
%mass = 53.692% as of 
mass = 54.002;% as of 17-oct-2024

%mass	=	59.xxx	; % for open ocean waters
% mass_comp=	3.988	; % in kg, for Puget Sound
mass_comp= 0.;
%volmax =	58500	; % in cc, from tank for PS
%volmax =    58483   ; % in cc, from PS regressions
%volmax	=	585xx	; % in cc, from projection for ocean ballast
%volmax = 58517; % dives 3:6 Shilshole 22oct13
%volmax = 58521; % dives 3:21 Shilshole 22-23oct13
%volmax = 58512; % Cuddy dives 4:6 25oct13
%volmax = 58529; % Cuddy dives 4:17 25-28oct13
%volmax = 58522; % Cuddy dives 4:20 25-28oct13
% volmax = 58486; % Cuddy dives 50:72 Oct13
%volmax = 58431; % tank 12 Dec 2017
%volmax = 53112; % cce calculation 15 May 2024
%volmax = 53169; % cce calculation MOTIVE dives 1:5 20 Nov 2024

% 22-Nov-2024 12:36:26 Fitting [vbdbias,a,b] RMS=1.1966 cm/s Dives: 5:13
%volmax = 53159;
%hd_a = 3.48353e-03;
%hd_b = 1.01052e-02;

%rho0	=	1023.0	; % for open Puget Sound 
rho0	=	1027.7	; % for open ocean waters 

mission_title = 'MOTIVE 2024';

% regressed hydrodynamic model & expansion parameters				
% hd_a = 2.35583e-03;
% hd_b = 1.05161e-02;
% hd_c = 2.89944e-05;
% abs_compress = 8.1943e-06;
% therm_expan  = 3.2978e-07;
%hd_a = 3.00177e-03; % Shilshole shakedown 22-23oct13 dives 3:21
%hd_b = 9.90824e-03;
%hd_c = 2.41810e-05;

%hd_a = 2.58828e-03; % Cuddy dives 4:20 25-28oct13
%hd_b = 1.37521e-02;
%hd_c = 7.37599e-06;

%hd_a = 3.31775e-03; % Cuddy dives 50:72 Oct13
%hd_b = 1.17335e-02;
%hd_c = 8.14577e-06;

% 25-Nov-2024 13:35:27 Fitting [vbdbias,a,b] RMS=1.1399 cm/s Dives: 6:28
%volmax = 53165.0;
%hd_a = 3.17143e-03;
%hd_b = 1.06394e-02;
%hd_c = 8.14577e-06;

% 28-Nov-2024 14:20:00 Fitting [vbdbias,a,b] RMS=1.1399 cm/s Dives: 6:40
volmax = 53169.0;
hd_a = 1.82e-03;
hd_b = 1.663e-02;
hd_c = 5.700e-06;

abs_compress = 4.4e-6;  % SG vehicle compressibility
therm_expan = 70.5e-6;    % SG thermal expansion coeff [/degree C]

temp_ref = 15;  % reference temperature for SG thermal expansion calculation
pitchbias = 0;	% pitch reference in regressions

% CT sensors cal constants (15apr2024 KK)
calibcomm ='SN 0325, cal 14-Aug-19';	% SN and cal date
t_g 	=	4.41786733E-03	;	
t_h 	=	6.48180756E-04	;	
t_i 	=	2.67790067E-05	;	
t_j 	=	3.36672319E-06	;	
c_g 	=	-1.00982154E+01	;	
c_h 	=	1.14540177E+00	;	
c_i 	=	-2.12762524E-03	;	
c_j 	=	2.55321145E-04	;	
cpcor 	=	-9.5700000E-08	;	
ctcor 	=	3.2500000E-06	;	
				
% Oxygen cal constants	(14oct2024 KK)			
optode_st_calphase = 31.91; % pt1950018.eng
optode_st_temp =  7.47; % pt1950018.eng
optode_st_slp = 1023.4; % UW atmospheric sciences

comm_oxy_type= 'Optode' ;
calibcomm_oxygen ='SN 1170, 02.05.2024'; % SN and cal date

optode_TempCoef0 =  2.30489e+01;
optode_TempCoef1 = -3.08604e-02;
optode_TempCoef2 =  2.82481e-06;
optode_TempCoef3 = -4.15754e-09;
optode_TempCoef4 = 0.0;
optode_TempCoef5 = 0.0;

optode_PhaseCoef0 = -1.4;
optode_PhaseCoef1 = 1.0;
optode_PhaseCoef2 = 0.0;
optode_PhaseCoef3 = 0.0;

optode_FoilCoefA0 = -2.68e-06;
optode_FoilCoefA1 = -7.48e-06;
optode_FoilCoefA2 =  1.96e-03;
optode_FoilCoefA3 = -2.07e-01;
optode_FoilCoefA4 =  6.01e-04;
optode_FoilCoefA5 = -6.60e-07;
optode_FoilCoefA6 =  1.12e+01;
optode_FoilCoefA7 = -5.15e-02;
optode_FoilCoefA8 =  6.90e-05;
optode_FoilCoefA9 = 8.47e-07;
optode_FoilCoefA10 = -3.14e+02;
optode_FoilCoefA11 =  2.05e+00;
optode_FoilCoefA12 = -2.99e-03;
optode_FoilCoefA13 =  -4.45e-06;

optode_FoilCoefB0 = -1.86e-06;
optode_FoilCoefB1 =  3.81e+03;
optode_FoilCoefB2 = -3.22e+01;
optode_FoilCoefB3 = -1.68e-01;
optode_FoilCoefB4 = 1.89e-02;
optode_FoilCoefB5 =  -6.90e-04;
optode_FoilCoefB6 = 1.04e-05;
optode_FoilCoefB7 = 0.0;
optode_FoilCoefB8 = 0.0;
optode_FoilCoefB9 = 0.0;
optode_FoilCoefB10 = 0.0;
optode_FoilCoefB11 = 0.0;
optode_FoilCoefB12 = 0.0;
optode_FoilCoefB13 = 0.0;

% this glider carries WET Labs sensor BB2FL-VMT SN 1014, cal date 6-Dec-2012
 
% end of file
