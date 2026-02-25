# Student-Seaglider-Center
SSC Seaglider Data Mission: 
The University of Washington Student Seaglider Center (SSC) manages a fleet of Seagliders for student-directed research. Assisted by experienced mentors, students conduct technical testing, dive planning, and piloting. The goal of the project is to create an opportunity for students to get hands-on experience with producing meaningful, accessible data that contributes both to local environmental research and to the worldwide oceanography community.

Contents: 
- Carson Overnight (04/2024)
- Shilshole Shakedown (2024)
- Colvos Passage Triple Glider Mission (2024)
- Shilshole Shakedown (10/2024)
- Tropics Mission (2024-2025)
- Shilshole Shakedown (2025)
- Time Series Test Mission (2025)
- Elliot Bay (2024)
- Summer Time Series Mission (2025)
- Winter Time Series Mission (2026)

Naming Conventions:
- Missions are named with their date of deployment YYYY_MM_DD (if multi-day mission only month is noted) and either their location or vessel of deployment.
- Missions named "shilshole_shakedown" are training deployments and do not aim to answer a scientific question. 

Folder Structure: 
- clean_data: netcdf & csv files with variables renamed for clarity and the time adjusted and the code used to clean and produce these files
- raw_files: the rest of the files sorted by file type
- mission_metadata_glider#: mission, glider, and sensor details
- mission_plan (if applicable): detailed account of the mission objectives and plan

Downloading & Plotting: 
- In each mission there is a netcdf and a csv file for plotting in the clean_data folder. These files have data throughout the entire mission and are cleaned up for ease of data analysis and plotting.
- After downloading one of these files, you can download the corresponding python script named plotting_(csv or nc) in the python_scripts folder.
