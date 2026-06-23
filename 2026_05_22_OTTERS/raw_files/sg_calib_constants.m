% Establishes glider calibration constants.
% edited Nina Luke (05/21/2026)

% This file is an example as well as documentation.
% Lines prefixed with %PARAM are parameters - remove "%PARAM " to enable
% Note - this file MUST be changed apprpriately for your vehicle and mission

id_str = '175';
mission_title ='2026_05_22_OTT3RS';
% OTTERS 3
% Last edited 24 May 2026 by Sophie Monterola
% Katie added % FM_ignore 25 may 2026
mass = 51.878; % (kg) scale weight value updated 22 May 2026
% Optional
%PARAM mass_comp = 0;

% NOTE:
% FlightModel will supply
%
% volmax = 51047
% vbdbias = 0.0
rho0 = 1023.5 % FM_ignore
% abs_compress = 4.4e-6
% therm_expan = 70.5e-6
temp_ref = 15 % FM_ignore
%
% ignoring any settings here and issue a warning, unless
% --skip_flight_model is set, in which case processing will use these
% variables. To suppress warnings about these variables, insert FM_ignore anywhere in a comment on the same
% line as the variable
% 
% hd_a = 0.003836 % On board 14 Apr 23
% hd_b = 0.01 % On board 14 Apr 23
% hd_c = 9.85e-6 % On board 14 Apr 23
%

% 27-May-2024 16:26:14 Fitting [vbdbias] RMS=1.5841 cm/s Dives: 1:4 6 7
% volmax = 51138.3;
% hd_a = 3.83600e-03;
% hd_b = 1.00000e-02;
% hd_c = 9.85000e-06;
hd_s = -2.50000e-01; % FM_ignore
abs_compress = 4.4000e-06; % FM_ignore
therm_expan  = 7.0500e-05; % FM_ignore

% 01-Jun-2025 17:08:33 Fitting [vbdbias] RMS=2.6334 cm/s Dives: 1:33 37 38 48 51 57 58 60
% volmax = 51179.5;

% 01-Jun-2025 17:16:01 Fitting [vbdbias,a,b] RMS=1.7967 cm/s Dives: 1:33 37 38 48 51 57 58 60
volmax = 51177.7; % FM_ignore
% hd_a = 2.02403e-03;
% hd_b = 9.09593e-03;

% 23-May-2026 18:48:00 Fitting [a,b,c] RMS=1.175 cm/s Dives: 1:27 28 29
% hd_a = 2.23872e-03;
% hd_b = 8.65964e-03;
% hd_c = 5.70000e-06;

% 24-May-2026 11:53:00 Fitting [a,b,c] RMS=2.956 cm/s Dives: 1:50
% hd_a = 0.000794328;
% hd_b = 0.0191095;
% hd_c = 5.7e-06;

% 24-May-2026 18:50:00 Fitting [a,b,c] RMS=1.560 cm/s Dives: 1:54
hd_a = 2.49e-03; % FM_ignore
hd_b = 9.10e-03; % FM_ignore
hd_c = 5.700e-06; % FM_ignore

% Seabird un-pumped CT
%
% calibcomm = 'SBE s/n 0117, calibration 24 April 2009';
% t_g = 4.32750101e-003
% t_h =  6.21436785e-004 ;
% t_i =  2.20853764e-005 ; 
% t_j =  2.22337487e-006 ;
% c_g = -1.00847610e+001 ;
% c_h =  1.15959222e+000 ;
% c_i = -1.01803171e-003 ;
% c_j =  1.73456684e-004 ;
% cpcor = -9.5700e-008 ;
% ctcor =  3.2500e-006 ;

% Seabird un-pumped CT (14jan2026 KF)
%
calibcomm = 'SBE s/n 0068, calibration 28 October 2025';
t_g = 4.31377410e-003
t_h =  6.28686703e-004 ;
t_i =  2.26913166e-005 ; 
t_j =  2.25867888e-006 ;
c_g = -1.00213286e+001 ;
c_h =  1.12369434e+000 ;
c_i = -1.36731686e-003 ;
c_j =  1.88088154e-004 ;
cpcor = -9.5700e-008 ;
ctcor =  3.2500e-006 ;

% Oxygen cal constants	(14jan2026 KF)			
% The values below are not fully updated. They were copied in as an example from sg195
optode_st_calphase = 31.011; % p1750003.eng
optode_st_temp = 14.691; % p1750003.eng
optode_st_slp = 1015.24; % paine field 05/22/2026

comm_oxy_type= 'Optode' ;
calibcomm_oxygen ='SN 205, 04.08.2019'; % SN and cal date

optode_TempCoef0 =  2.55733e+01;
optode_TempCoef1 = -3.10647e-02;
optode_TempCoef2 =  3.04740e-06;
optode_TempCoef3 = -4.40518e-09;
optode_TempCoef4 = 0.0;
optode_TempCoef5 = 0.0;

optode_PhaseCoef0 = 0.0;
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
%
% Legato CTD
%

% Required
%PARAM sg_ct_type = 4;  % Indicates
%PARAM calibcomm = 'Legato s/n 0041, calibration 25 April 2016';

% Required for Legato as logdev or on the truck
%PARAM legato_sealevel = 10082.0; % Where this is sealevel presure setting.

% For Kongsberg/HII gliders with legato as a logdev device
%PARAM legato_config=191;

% where the values to be logical or'd together are
% channel			flag
% -----------------------------------
% conductivity      0x01        1
% temperature       0x02        2
% pressure          0x04        4
% sea pressure      0x08        8
% depth             0x10        16
% salinity          0x20        32
% counts            0x40        64
% cond cell temp    0x80       128

% Misc legato settings

% ignore any legato columns from the truck
%PARAM ignore_truck_legato = 1; 

% Optode

%
% Wetlabs
%

% iRobot/Kongsberg/HII followed differnt naming conventions for wetlabs column names.  If wetlabs data is to
% be propagated to the netcdf file, the columns must be remapped per the basestation system of naming
% See the list below for the canonical instrument names and calibration constant names

%PARAM remap_wetlabs_eng_cols="oldval1:newval1,oldval2:newval2"

% Note - in the "oldval", any "." should be converted to "_".
% So, if the column in the .eng file is "wlbb2fl.BB1ref", use "wlbb2fl_BB1ref" as value for the oldval.

% Example
% remap_wetlabs_eng_cols = "wlbbfl2_BB1ref:wlbbfl2_ref700nm,wlbbfl2_BB1sig:wlbbfl2_sig700nm,wlbbfl2_FL1ref:wlbbfl2_ref695nm,wlbbfl2_FL1sig:wlbbfl2_sig695nm,wlbbfl2_FL2ref:wlbbfl2_ref460nm,wlbbfl2_FL2sig:wlbbfl2_sig460nm" 
% where the channels are 700nm, Chl and CDOM

% If present, the basestation will add additional columns to apply the "standard" correction to
% the wetlabs data per the cal sheet. Format for these entries is:
%
% <instrument>_<channelname>_dark_counts = <dark_counts>;
% <instrument>_<channelname>_max_counts = <max_counts>;
% <instrument>_<channelname>_resolution_counts = <resolution_counts>;
% <instrument>_<channelname>_scale_factor = <scale_factor>;

% Example

% wlbbfl2_sig695nm_dark_counts = 49.0;
% wlbbfl2_sig695nm_max_counts = 4130.0;
% wlbbfl2_sig695nm_resolution_counts = 1.0;
% wlbbfl2_sig695nm_scale_factor = 0.0121;

% Here is the complete list of canonical names and associated calibration constants for WETLabs instruments

%PARAM wlbb2fl_sig470nm_dark_counts = 0.0; % For blue scattering channel
%PARAM wlbb2fl_sig470nm_scale_factor = 0.0; % For blue scattering channel
%PARAM wlbb2fl_sig470nm_resolution_counts = 0.0; % For blue scattering channel
%PARAM wlbb2fl_sig470nm_max_counts = 0.0; % For blue scattering channel
%PARAM wlbb2fl_sig532nm_dark_counts = 0.0; % For green scattering channel
%PARAM wlbb2fl_sig532nm_scale_factor = 0.0; % For green scattering channel
%PARAM wlbb2fl_sig532nm_resolution_counts = 0.0; % For green scattering channel
%PARAM wlbb2fl_sig532nm_max_counts = 0.0; % For green scattering channel
%PARAM wlbb2fl_sig700nm_dark_counts = 0.0; % For red scattering channel
%PARAM wlbb2fl_sig700nm_scale_factor = 0.0; % For red scattering channel
%PARAM wlbb2fl_sig700nm_resolution_counts = 0.0; % For red scattering channel
%PARAM wlbb2fl_sig700nm_max_counts = 0.0; % For red scattering channel
%PARAM wlbb2fl_sig880nm_dark_counts = 0.0; % For infrared scattering channel
%PARAM wlbb2fl_sig880nm_scale_factor = 0.0; % For infrared scattering channel
%PARAM wlbb2fl_sig880nm_resolution_counts = 0.0; % For infrared scattering channel
%PARAM wlbb2fl_sig880nm_max_counts = 0.0; % For infrared scattering channel
%PARAM wlbb2fl_sig460nm_dark_counts = 0.0; % For CDOM fluorescence channel
%PARAM wlbb2fl_sig460nm_scale_factor = 0.0; % For CDOM fluorescence channel
%PARAM wlbb2fl_sig460nm_resolution_counts = 0.0; % For CDOM fluorescence channel
%PARAM wlbb2fl_sig460nm_max_counts = 0.0; % For CDOM fluorescence channel
%PARAM wlbb2fl_sig530nm_dark_counts = 0.0; % For uranine fluorescence channel
%PARAM wlbb2fl_sig530nm_scale_factor = 0.0; % For uranine fluorescence channel
%PARAM wlbb2fl_sig530nm_resolution_counts = 0.0; % For uranine fluorescence channel
%PARAM wlbb2fl_sig530nm_max_counts = 0.0; % For uranine fluorescence channel
%PARAM wlbb2fl_sig570nm_dark_counts = 0.0; % For phycoerythrin/rhodamine fluorescence channel
%PARAM wlbb2fl_sig570nm_scale_factor = 0.0; % For phycoerythrin/rhodamine fluorescence channel
%PARAM wlbb2fl_sig570nm_resolution_counts = 0.0; % For phycoerythrin/rhodamine fluorescence channel
%PARAM wlbb2fl_sig570nm_max_counts = 0.0; % For phycoerythrin/rhodamine fluorescence channel
%PARAM wlbb2fl_sig680nm_dark_counts = 0.0; % For phycocyanin fluorescence channel
%PARAM wlbb2fl_sig680nm_scale_factor = 0.0; % For phycocyanin fluorescence channel
%PARAM wlbb2fl_sig680nm_resolution_counts = 0.0; % For phycocyanin fluorescence channel
%PARAM wlbb2fl_sig680nm_max_counts = 0.0; % For phycocyanin fluorescence channel
%PARAM wlbb2fl_sig695nm_dark_counts = 0.0; % For chlorophyll fluorescence channel
%PARAM wlbb2fl_sig695nm_scale_factor = 0.0; % For chlorophyll fluorescence channel
%PARAM wlbb2fl_sig695nm_resolution_counts = 0.0; % For chlorophyll fluorescence channel
%PARAM wlbb2fl_sig695nm_max_counts = 0.0; % For chlorophyll fluorescence channel
%PARAM wlbbfl2_sig470nm_dark_counts = 0.0; % For blue scattering channel
%PARAM wlbbfl2_sig470nm_scale_factor = 0.0; % For blue scattering channel
%PARAM wlbbfl2_sig470nm_resolution_counts = 0.0; % For blue scattering channel
%PARAM wlbbfl2_sig470nm_max_counts = 0.0; % For blue scattering channel
%PARAM wlbbfl2_sig532nm_dark_counts = 0.0; % For green scattering channel
%PARAM wlbbfl2_sig532nm_scale_factor = 0.0; % For green scattering channel
%PARAM wlbbfl2_sig532nm_resolution_counts = 0.0; % For green scattering channel
%PARAM wlbbfl2_sig532nm_max_counts = 0.0; % For green scattering channel
%PARAM wlbbfl2_sig700nm_dark_counts = 0.0; % For red scattering channel
%PARAM wlbbfl2_sig700nm_scale_factor = 0.0; % For red scattering channel
%PARAM wlbbfl2_sig700nm_resolution_counts = 0.0; % For red scattering channel
%PARAM wlbbfl2_sig700nm_max_counts = 0.0; % For red scattering channel
%PARAM wlbbfl2_sig880nm_dark_counts = 0.0; % For infrared scattering channel
%PARAM wlbbfl2_sig880nm_scale_factor = 0.0; % For infrared scattering channel
%PARAM wlbbfl2_sig880nm_resolution_counts = 0.0; % For infrared scattering channel
%PARAM wlbbfl2_sig880nm_max_counts = 0.0; % For infrared scattering channel
%PARAM wlbbfl2_sig460nm_dark_counts = 0.0; % For CDOM fluorescence channel
%PARAM wlbbfl2_sig460nm_scale_factor = 0.0; % For CDOM fluorescence channel
%PARAM wlbbfl2_sig460nm_resolution_counts = 0.0; % For CDOM fluorescence channel
%PARAM wlbbfl2_sig460nm_max_counts = 0.0; % For CDOM fluorescence channel
%PARAM wlbbfl2_sig530nm_dark_counts = 0.0; % For uranine fluorescence channel
%PARAM wlbbfl2_sig530nm_scale_factor = 0.0; % For uranine fluorescence channel
%PARAM wlbbfl2_sig530nm_resolution_counts = 0.0; % For uranine fluorescence channel
%PARAM wlbbfl2_sig530nm_max_counts = 0.0; % For uranine fluorescence channel
%PARAM wlbbfl2_sig570nm_dark_counts = 0.0; % For phycoerythrin/rhodamine fluorescence channel
%PARAM wlbbfl2_sig570nm_scale_factor = 0.0; % For phycoerythrin/rhodamine fluorescence channel
%PARAM wlbbfl2_sig570nm_resolution_counts = 0.0; % For phycoerythrin/rhodamine fluorescence channel
%PARAM wlbbfl2_sig570nm_max_counts = 0.0; % For phycoerythrin/rhodamine fluorescence channel
%PARAM wlbbfl2_sig680nm_dark_counts = 0.0; % For phycocyanin fluorescence channel
%PARAM wlbbfl2_sig680nm_scale_factor = 0.0; % For phycocyanin fluorescence channel
%PARAM wlbbfl2_sig680nm_resolution_counts = 0.0; % For phycocyanin fluorescence channel
%PARAM wlbbfl2_sig680nm_max_counts = 0.0; % For phycocyanin fluorescence channel
%PARAM wlbbfl2_sig695nm_dark_counts = 0.0; % For chlorophyll fluorescence channel
%PARAM wlbbfl2_sig695nm_scale_factor = 0.0; % For chlorophyll fluorescence channel
%PARAM wlbbfl2_sig695nm_resolution_counts = 0.0; % For chlorophyll fluorescence channel
%PARAM wlbbfl2_sig695nm_max_counts = 0.0; % For chlorophyll fluorescence channel
%PARAM wlbb3_sig470nm_dark_counts = 0.0; % For blue scattering channel
%PARAM wlbb3_sig470nm_scale_factor = 0.0; % For blue scattering channel
%PARAM wlbb3_sig470nm_resolution_counts = 0.0; % For blue scattering channel
%PARAM wlbb3_sig470nm_max_counts = 0.0; % For blue scattering channel
%PARAM wlbb3_sig532nm_dark_counts = 0.0; % For green scattering channel
%PARAM wlbb3_sig532nm_scale_factor = 0.0; % For green scattering channel
%PARAM wlbb3_sig532nm_resolution_counts = 0.0; % For green scattering channel
%PARAM wlbb3_sig532nm_max_counts = 0.0; % For green scattering channel
%PARAM wlbb3_sig700nm_dark_counts = 0.0; % For red scattering channel
%PARAM wlbb3_sig700nm_scale_factor = 0.0; % For red scattering channel
%PARAM wlbb3_sig700nm_resolution_counts = 0.0; % For red scattering channel
%PARAM wlbb3_sig700nm_max_counts = 0.0; % For red scattering channel
%PARAM wlbb3_sig880nm_dark_counts = 0.0; % For infrared scattering channel
%PARAM wlbb3_sig880nm_scale_factor = 0.0; % For infrared scattering channel
%PARAM wlbb3_sig880nm_resolution_counts = 0.0; % For infrared scattering channel
%PARAM wlbb3_sig880nm_max_counts = 0.0; % For infrared scattering channel
%PARAM wlbb3_sig460nm_dark_counts = 0.0; % For CDOM fluorescence channel
%PARAM wlbb3_sig460nm_scale_factor = 0.0; % For CDOM fluorescence channel
%PARAM wlbb3_sig460nm_resolution_counts = 0.0; % For CDOM fluorescence channel
%PARAM wlbb3_sig460nm_max_counts = 0.0; % For CDOM fluorescence channel
%PARAM wlbb3_sig530nm_dark_counts = 0.0; % For uranine fluorescence channel
%PARAM wlbb3_sig530nm_scale_factor = 0.0; % For uranine fluorescence channel
%PARAM wlbb3_sig530nm_resolution_counts = 0.0; % For uranine fluorescence channel
%PARAM wlbb3_sig530nm_max_counts = 0.0; % For uranine fluorescence channel
%PARAM wlbb3_sig570nm_dark_counts = 0.0; % For phycoerythrin/rhodamine fluorescence channel
%PARAM wlbb3_sig570nm_scale_factor = 0.0; % For phycoerythrin/rhodamine fluorescence channel
%PARAM wlbb3_sig570nm_resolution_counts = 0.0; % For phycoerythrin/rhodamine fluorescence channel
%PARAM wlbb3_sig570nm_max_counts = 0.0; % For phycoerythrin/rhodamine fluorescence channel
%PARAM wlbb3_sig680nm_dark_counts = 0.0; % For phycocyanin fluorescence channel
%PARAM wlbb3_sig680nm_scale_factor = 0.0; % For phycocyanin fluorescence channel
%PARAM wlbb3_sig680nm_resolution_counts = 0.0; % For phycocyanin fluorescence channel
%PARAM wlbb3_sig680nm_max_counts = 0.0; % For phycocyanin fluorescence channel
%PARAM wlbb3_sig695nm_dark_counts = 0.0; % For chlorophyll fluorescence channel
%PARAM wlbb3_sig695nm_scale_factor = 0.0; % For chlorophyll fluorescence channel
%PARAM wlbb3_sig695nm_resolution_counts = 0.0; % For chlorophyll fluorescence channel
%PARAM wlbb3_sig695nm_max_counts = 0.0; % For chlorophyll fluorescence channel
%PARAM wlfl3_sig470nm_dark_counts = 0.0; % For blue scattering channel
%PARAM wlfl3_sig470nm_scale_factor = 0.0; % For blue scattering channel
%PARAM wlfl3_sig470nm_resolution_counts = 0.0; % For blue scattering channel
%PARAM wlfl3_sig470nm_max_counts = 0.0; % For blue scattering channel
%PARAM wlfl3_sig532nm_dark_counts = 0.0; % For green scattering channel
%PARAM wlfl3_sig532nm_scale_factor = 0.0; % For green scattering channel
%PARAM wlfl3_sig532nm_resolution_counts = 0.0; % For green scattering channel
%PARAM wlfl3_sig532nm_max_counts = 0.0; % For green scattering channel
%PARAM wlfl3_sig700nm_dark_counts = 0.0; % For red scattering channel
%PARAM wlfl3_sig700nm_scale_factor = 0.0; % For red scattering channel
%PARAM wlfl3_sig700nm_resolution_counts = 0.0; % For red scattering channel
%PARAM wlfl3_sig700nm_max_counts = 0.0; % For red scattering channel
%PARAM wlfl3_sig880nm_dark_counts = 0.0; % For infrared scattering channel
%PARAM wlfl3_sig880nm_scale_factor = 0.0; % For infrared scattering channel
%PARAM wlfl3_sig880nm_resolution_counts = 0.0; % For infrared scattering channel
%PARAM wlfl3_sig880nm_max_counts = 0.0; % For infrared scattering channel
%PARAM wlfl3_sig460nm_dark_counts = 0.0; % For CDOM fluorescence channel
%PARAM wlfl3_sig460nm_scale_factor = 0.0; % For CDOM fluorescence channel
%PARAM wlfl3_sig460nm_resolution_counts = 0.0; % For CDOM fluorescence channel
%PARAM wlfl3_sig460nm_max_counts = 0.0; % For CDOM fluorescence channel
%PARAM wlfl3_sig530nm_dark_counts = 0.0; % For uranine fluorescence channel
%PARAM wlfl3_sig530nm_scale_factor = 0.0; % For uranine fluorescence channel
%PARAM wlfl3_sig530nm_resolution_counts = 0.0; % For uranine fluorescence channel
%PARAM wlfl3_sig530nm_max_counts = 0.0; % For uranine fluorescence channel
%PARAM wlfl3_sig570nm_dark_counts = 0.0; % For phycoerythrin/rhodamine fluorescence channel
%PARAM wlfl3_sig570nm_scale_factor = 0.0; % For phycoerythrin/rhodamine fluorescence channel
%PARAM wlfl3_sig570nm_resolution_counts = 0.0; % For phycoerythrin/rhodamine fluorescence channel
%PARAM wlfl3_sig570nm_max_counts = 0.0; % For phycoerythrin/rhodamine fluorescence channel
%PARAM wlfl3_sig680nm_dark_counts = 0.0; % For phycocyanin fluorescence channel
%PARAM wlfl3_sig680nm_scale_factor = 0.0; % For phycocyanin fluorescence channel
%PARAM wlfl3_sig680nm_resolution_counts = 0.0; % For phycocyanin fluorescence channel
%PARAM wlfl3_sig680nm_max_counts = 0.0; % For phycocyanin fluorescence channel
%PARAM wlfl3_sig695nm_dark_counts = 0.0; % For chlorophyll fluorescence channel
%PARAM wlfl3_sig695nm_scale_factor = 0.0; % For chlorophyll fluorescence channel
%PARAM wlfl3_sig695nm_resolution_counts = 0.0; % For chlorophyll fluorescence channel
%PARAM wlfl3_sig695nm_max_counts = 0.0; % For chlorophyll fluorescence channel

