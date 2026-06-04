# Student-Seaglider-Center
SSC Seaglider Data Mission: 
The University of Washington Student Seaglider Center (SSC) manages a fleet of Seagliders for student-directed research. Assisted by experienced mentors, students conduct technical testing, dive planning, and piloting. The goal of the Center is to create an opportunity for students to get hands-on experience with producing meaningful, accessible data that contributes both to local environmental research and to the worldwide oceanography community.

In this repository, each folder is a mission. Test missions are conducted in Puget Sound, WA and are labled as such. If the mission had multiple gliders, each glider has a subfolder.

Contents: 
- Shilshole Test (04/05/2024)
- Shilshole Test (04/30/2024)
- Shilshole Test (04/30/2024)
- Colvos, Colvos Passage Triple Glider Mission (05/31/2024)
- Shilshole Test (10/11/2024)
- Tropics, Tropics Mission (11/19/2024-06/05/2025)
- Shilshole Test (02/21/2025)
- Edmonds Test (04/18/2025)
- Elliot Bay, BIG 10 Commerical (05/17/2024)
- Summer Time Series Mission (2025)
- Winter Time Series Mission (2026)

Sensors:
- All missions have temperature, conductivity (salinity), and depth data at minimum. If there is oxygen and wetlabs data it will be in the clean data file as well as the raw data.
- Oxygen corrected for salinity and depth is named dissolved_oxygen when cleaned and aanderaa4330_dissolved_oxygen in the raw data. Oxygen corrected for salinity is named instrument_dissolved_oxygen when cleaned and aanderaa4330_instrument_dissolved_oxygen in the raw data.
- Blue light scattering is named when PAR_470nm cleaned and eng_wlbb2fl_sig470nm in the raw data. Red light scattering is named particle_concentration_700nm when cleaned and eng_wlbb2fl_sig700nm in the raw data. Chlorophyll fluorescence is named chlorophyll_695nm when cleaned and eng_wlbb2fl_sig695nm in the raw data.

Naming Conventions:
- Missions are named with their date of deployment YYYY_MM_DD and their mission name.
- Missions named " Test" are training deployments and do not aim to answer a scientific question. 

Folder Structure: 
- clean_data: netcdf & csv files with variables renamed for clarity and the time adjusted and the code used to clean and produce these files
- raw_files: the rest of the files sorted by file type
- mission_metadata_glider#: mission, glider, and sensor details
- mission_plan (if applicable): detailed account of the mission objectives and plan

Downloading & Plotting: 
- In each mission there is a netcdf and a csv file for plotting in the clean_data folder. These files have data throughout the entire mission and are cleaned up for ease of data analysis and plotting.
- After downloading one of these files, you can download the corresponding python script named plotting_(csv or nc) in the python_scripts folder.

