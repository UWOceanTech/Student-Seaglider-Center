**University of Washington School of Oceanography**  
Student Seaglider Center   
Data Management Lab Manual 

**Written and Compiled by Lydia Kelley**  
Data Manager   
(March 2023 \- June 2026\)  
Version 1.0

**Table of Contents**

Executive Summary .......................... Page 2

Navigating the Basestation ................. Page 3

* Using Linux  
* Defining Basestation File types

Basestation Scripts ........................ Page 9

* Compass Calibriations   
* Bathymetric Maps 

Data Management Workflow ................... Page 12

* Creation of the “timeseries” File  
* Analyzing and Cleaning the “timeseries” File  
* Uploading Files to GitHub  
* Creation of Supplementary Files

GitHub Organization ........................ Page 21

* Naming Conventions  
* Using Github Extensions  
* Working in the Terminal Codespace  
* Clean Data Folder  
* Raw Files Folder  
* Mission Plan  
* Metadata  
* Post Mission Report   
* Uploading CTD files  
* Checking GitHub Memory 

**Executive Summary**

This document serves as a comprehensive guide to our best practices in data management, available resources, and proven methodologies. In this document you will find structure for all current tasks and guidelines for new tasks that may come up. Python scripts can be found in the [SSC GitHub](https://github.com/UWOceanTech/Student-Seaglider-Center/tree/main) under the python\_scripts folder. These assist in visualization of datafiles (found in a subdirectory of each mission titled clean\_data) and comparison of CTD casts to seaglider profiles. There are also scripts to clean the data, customized to each mission found in the clean\_data folder inside the specific mission folder. Finally, there are scripts from past mission projects. For questions, don’t hesitate to contact Lydia Kelley \[[lydiagk@uw.edu](mailto:lydiagk@uw.edu)\]. 

**Navigating the Basestation**

Using Linux

*Overview*  
The Seaglider Basestation is a Linux Operating System and therefore requires Linux commands to move through folders and files. Linux commands also allow manipulation and editing of files. This is an overview of the commands that we use for our Seaglider operations, not a comprehensive list of commands (a complete list can be found at [https://linuxhandbook.com](https://linuxhandbook.com/a-to-z-linux-commands/)) 

*Things to know*  
\* You can not type until you see the file path pop up ending with a $ for Linux, a \> for Windows, or % for Macs  
\* If you start running something and you want to cancel this (visually you will see a cursor blinking and nothing else but your operating system is attempting to do something) run Ctrl C for Windows and Command C for Macs  
\* Note that folders are called directories in Linux  
\* Linux is a case sensitive operating system  
\* There is no undo button in Linux, understand what you are doing before you do it  
\* generally white text denotes a file, green denotes an executable file, and blue indicates a directory  
\* If you are typing a file or directory name and tab it will autofill.

- lydiagk@seaglider:/home/jails/uwssc/gliderjail/home$ ls

  etc  missions.yml  missions\_EXAMPLE.yml  missions\_backup.yml  rundir  sg174  sg175  sg194  sg195

- lydiagk@seaglider:/home/jails/uwssc/gliderjail/home$ cd e \*tab\*   
- lydiagk@seaglider:/home/jails/uwssc/gliderjail/home$ cd etc  
- Simply writing “e” and then tabbing without a command will not autofill, so you can use tabbing to check yourself, if your line is incorrect formatting the tab will not work (tab will also not work if you are using cd to get into a file, although tab will work if you are running more for a directory)

\* If there are multiple files that have the same name up to that point it will autofill to the name until they differ. 

- lydiagk@seaglider:/home/jails/uwssc/gliderjail/home$ ls

  etc  missions.yml  missions\_EXAMPLE.yml  missions\_backup.yml  rundir  sg174  sg175  sg194  sg195

- lydiagk@seaglider:/home/jails/uwssc/gliderjail/home$ more m \*tab\*   
- lydiagk@seaglider:/home/jails/uwssc/gliderjail/home$ more missions

\* If you want the options of files that fit the start of your word, tab two more times.

- lydiagk@seaglider:/home/jails/uwssc/gliderjail/home$ more missions \*tab\* \*tab\*

  missions.yml          missions\_EXAMPLE.yml  missions\_backup.yml

- Files will show up in white text now even though they are executable files

*Regular Expressions*  
Regular Expressions are a technique in linux that helps search for matches in datasets. More information about Regular Expressions can be found [here.](https://www.geeksforgeeks.org/linux-unix/how-to-use-regular-expressions-regex-on-linux/) We most often use the \* symbol for searching which matches the characters named with any number of occurrences. Here is an example with the grep command. 

If you had the following files:  
File1	File2	File3	File4	File5	File6	File7	File8	File9	File10	File11	File12	File13

You could run the line \<grep File\*\>  
All files would appear below since all files start with File but have alternative endings. 

Alternatively you could run the line \<grep \*2\>  
File2 and File12 would appear because both files end in 2\. 

If you ran \<grep File1\*\>  
File1, File10, File11, File12, and File13 would appear. 

This technique can also be used to capture all files with a specific start and end. An example of this is below in the description of a “grep” command. 

*Overview of Necessary Linux Commands*  
Moving around

* pwd \= print working directory  
* cd \= change directory  
  * cd .. \= takes you back one directory  
  * cd / \= takes you back to your base directory  
* ls \= lists the contents of a directory  
* ls \-la \= longer listing format (for seeing editors and date of changes, important for checking if self-test was completed and files are uploaded, good to use leading up to the field team to science handoff during piloting)

Viewing file contents

* more \= views a file  
* tail \= end of a file is displayed  
  * tail \-f comm.log (continuously updating tail)  
  * tail \-5 comm.log (the last 5 lines, can change the number to any integer)  
  * tail \-5f comm.log (continuously updating the last 5 lines)  
* head \= start of a file is displayed  
  * head \-5 comm.log (the last 5 lines, can change the number to any integer)  
* grep \= searches files, like ctrl f (can be used in various forms)  
  * grep “VBD” p195\*.log (double, single or no quotes work for one word searches, for two word ones, double or single quotes are needed)  
  * grep "VBD" p1950200\*  
  * grep "VBD" p1950200.log  
  * grep \-C 15 ‘VBD’ comm.log (gives context for the grepped line, note the single quotes)

Changing folders and files 

* mv \= move (moves files into a new directory or can be used to move a file contents into a new file resulting in a deletion of the original file)  
* cp \= copy (copies files or contents of a file into a new directory or file, leaves original files or directories intact)   
  * cp cmdfile\_edit cmdfile (copies cmdfile\_edit to cmdfile  
* mkdir \= make new directory  
* pico \= creates/edits a file (if you run pico new\_file and it doesn’t already exist, you will be given a blank file that you can type in)  
* diff \= sees the difference between two files  
  * diff cmdfile cmdfile\_edit  
* rm \= remove \*\*\*\*use with caution\!\!\!\!\*\*\*\*  
* rmdir \= remove directory  \*\*\*\*use with caution\!\!\!\!\*\*\*\*

Accessing the Seaglider Basestation

* Ask a Science Lead to email the Seaglider IOP team to be added to the Basestation   
* Follow instructions given to you by IOP Seaglider  
* Open your command prompt or terminal   
* Run ssh \<username\>@seaglider.pub  
  * **ssh lydiagk@seaglider.pub**  
* You will need to type **cd ..** to go back to a directory where you can move around   
* The path to the glider directories is then gliderjail/home/  
  * **cd gliderjail/home/**  
* You are now able to select the glider you want\! Or edit missions.yml\!

Defining file types

*Overview*  
There are a variety of file types on the basestation. This section documents what each file contains. A complete list of file formats can be found [here](https://docs.google.com/document/d/1VaeI3CHMQ4nckY3mfng8Jpn84iBo0RDV8FiOMJBuirs/edit?usp=sharing).  A “p” in front of the file indicates that the file has been processed by the basestation. A “st” in front of the file indicates that the file is from a self-test, normal dives will instead have the prefix “pt”. When a **cmdfile, targets** file, or **science** file is received by glider, the file is saved on the basestation with the dive number included in the file name. If the glider calls in multiple times while at the surface, a **cmdfile** is sent for each call and a serial number is added after the dive number.

*Log files (ending in .log)*  
One log file is made for each dive. The first line is the version of code being used, then there are glider, mission, and dive identifiers. This is a complete list of parameters and their values for that particular dive rather than the cmdfile which is just the parameters that we are changing or want easy access to. The full list of parameters can be found [here](https://docs.google.com/document/d/1nEwe-n3w-fOkcVlfT4BZpdqgp5VgfXnTTIzSqxKsrck/edit?usp=sharing). This file also details the pre-dive period when the glider is sitting at the surface. This part starts with **$GPS1**. **$GPS1** is the location at the end of the dive (for the log file of dive 2, this would be the end of dive 1), **$GPS2** is the location at the start of the dive (for the log file of dive 2, this would be the start of dive 2), and **$GPS** is where the glider starts the next dive (will be the same as **$GPS1** in the sequential dive). The formatting of GPS lines are DDMMYY, HHMMSS, lat, lon. Lines starting in **$GC** explain the motor movement with one line for each motion. The final portion of the file is the data collected at the end of the dive. 

*Data files (ending in .dat)*  
A text file generated after each dive. The first line is the most important, the lines following are differences from the prior line’. The first 10 columns are always in this file but the columns following depend on the sensor package of the glider. The first 10 column names are explained below.

rec: the record number of the sample  
elaps\_tms: time elapsed (seconds) since the start of the dive  
depth: depth in centimeters  
heading: vehicle heading in degrees times 10  
pitch: vehicle pitch in degrees times 10  
roll: vehicle roll in degrees times 10 (with starboard wing facing down)  
AD\_pitch: pitch mass position in A/D counts  
AD\_roll: roll mass position in A/D counts  
AD\_vbd: VBD position in A/D counts  
GC\_phase: guidance and control phase, \# indicates the change  
	1: Pitch   
	2: VBD   
	3: Roll   
	4: Turning  
	5: Roll back to center  
	6: Passive mode

*ASCII files (ending in .asc)*  
Uncompressed versions of the data (.dat) files. Same column names. NaN indicates no sample due to that sensor not being installed or the sensor is turned off by the Science file. 

*Engineering files (ending in .eng)*  
Contains the same data in the ASCII (.asc) and Log (.log) files but with the Seaglider control state and attitude observations converted into engineering units. The first 11 columns are always in this file but the columns following depend on the sensor package of the glider.  
	elaps\_t\_0000: time elapsed (seconds) since 0000UTC of the current day   
elaps\_t: time (seconds) since the start of the dive   
condFreq: conductivity frequency of the sample (Hertz)  
tempFreq: temperature frequency of the sample (Hertz)  
depth: depth in centimeters  
head: vehicle heading in degrees  
pitchAng: vehicle pitch in degrees (with positive being nose-up)  
rollAng: vehicle roll in degrees (with positive being starboard wing down, rolled to starboard)   
pitchCtl: pitch mass position relative to **$C\_PITCH**, in centimeters (with positive being nose up)  
rollCtl: roll mass position relative to **$C\_ROLL\_DIVE** or **$C\_ROLL\_CLIMB** in degrees (with positive being starboard wing down)  
vbdCC: VBD value relative to $C\_VBD in cc's (with positive being buoyant)

*Capture files (ending in .cap)*  
The capture file explains the Seaglider’s decision making process. It details all the actions taken during a dive and provides information about the glider’s performance. There are four columns in a capture file: time, service, output level, and text.   
	time: seconds since the start of the dive  
	service: the function the glider is calling  
output level: there are three options: N, C, or D. N means the output level is normal. C  means the output level is critical so only critical functions are printed. D is debug and extended diagnostics will be printed.  
text: a description of the action and sometimes the reason why.

*NetCDF file (ending in .nc)*  
Contains the processed data of the mission. Calibration constants are applied to raw temperature and conductivity values from the .dat files which transform conductivity into salinity in the .nc file. Used to plot and to analyze. 

*Private file (ending in .pvt)*  
These files are the only file NOT published to GitHub. They are created on the basestation and have data stripped from the log file that could pose a security threat if published.

*Communications Log (comm.log)*  
A file that is continuously updated during a mission. Each communication session is appended to the comm.log resulting in a complete plain-text dialogue of the Seaglider to basestation communications. Tail \-f comm.log is a helpful command as it will keep a running tail of the comm.log open.

*SG Calib Constants (sg\_calib\_constants.m)*  
Holds calibration information about each sensor on the Seaglider. This is created by the pilot and is only on the basestation, it is not on the glider. All sensors, except for the compass, are calibrated to the Seaglider Fabrication Center. These numbers are in the notebook that corresponds with the glider. The compass is calibrated once the glider is fully assembled and the compass is in the presence of batteries and hardware. This file needs to be checked before each mission, when new sensors are installed, batteries are changed, and if there are any hardware changes. This file is used by visualization tools to plot Seaglider data as well. If the values are incorrect, the scientific data will be incorrect.

*Pagers file (.pagers)*  
The notification system for the glider. There are three types of messages that can be sent: gps, alerts, and recov. These messages can be received as an email, text, or a call. This runs when the glider disconnects. Lines that start with \# are commented out and ignored. 

*Basestation Log files (ending in baselog.log or starting with baselog\_ )*  
A file made by the basestation that logs output from scripts that are converting data and keeps track of notifications from the basestation. This file should be checked when troubleshooting issues with data conversion. If the basestation does not process a file, an alert will be sent to those listed in the .pagers file. baselog.log has all conversions in the baselog\_files but it lacks timestamps. 

*Processed Files Cache (processed\_files.cache)*  
This file details the dives that have been processed and when they were processed. If you need to reprocess a dive’s file, you can delete the line referencing the file from the processed files cache file. Comment lines start with \#.

*Targets file (targets)*  
A file created by the pilot. There is one target for each line which the target listed first and lat, lon, radius, and goto arguments following. The order of the arguments doesn’t matter. Comment lines start with /. There should not be any extra spaces at the end of each line.

Example:  
TARGET\_A lat= 4807.0 lon=-12223.0 radius=200 goto=TARGET\_B  
TARGET\_B lat= 4808.0 lon=-12224.0 radius=200 goto=TARGET\_A

- Target name: any string of numbers and/or letters without spaces  
- Latitude: in ddmm.m with positive being North  
- Longitude: dddmm.m with positive being East  
- Radius: the radius in meters that the Seaglider uses to determine if it has reached the target  
- Next Target: the target name of the next target which must be specified in the target column


There are also 4 optional arguments: escape, depth, finish, and timeout

- Escape: specifies what target for the glider to move to if it is unable to reach the intended target for a specified amount of time. This escape target must be named in the target file.  
- Finish: specifies a direction in degrees that establishes a finish line through the target that the glider must achieve. A finish direction of 180 specifies an east-west line that the glider achieves when it is south of the line. A value of \-1 means that there will be no finish line.   
- Depth: the target can be achieved by crossing a bathymetric contour. If the value is positive the target is achieved when crossing the contour from deep to shallow. If negative it is achieved moving from shallow to deep.   
- Timeout: gives a length of time in days that the glider should try to achieve the target. If the timeout is exceeded, the glider will continue to the goto target.


*Science file (science)*  
This file is created by the pilot and tells the glider when it should sample with the scientific instruments onboard. Comment lines start with /. For more information on the organization of this file go to the [file formats manual](https://docs.google.com/document/d/1VaeI3CHMQ4nckY3mfng8Jpn84iBo0RDV8FiOMJBuirs/edit?usp=sharing). 

*Command file (cmdfile)*  
This file is created by the pilot. The command file that contains the parameters that are changed for that particular mission. If a variable or multiple variables remain in the file unchanged between missions, the value will stay the same. For the full list of parameters, refer to the log files. 

*Pdos Commands file (pdoscmd.bat)*  
This file is created by the pilot and deals with the Seaglider’s software. The commands given in this file directly communicate with the glider and can be a quick way to tell the glider to go to a new target, reprocess a file, change the science file sampling rate, and more.

**Basestation Scripts**

Compass Calibriations 

A compass calibration is the process of removing the impact of hard and soft iron effects (materials with their own magnetic fields that are part of the glider) from the compass data. There are two ways to do this: using basestation3 or on seaglider.pub.

*On the basestation* (note you will need to install basestation3 on your device): After completing compass calibration dives, the script (created by IOP) Magcal.py can be run in the command line. The results should be in a file named tcm2mat.cal and are uploaded to the glider by putting the file in the glider’s mission or home directory. This file will be transferred during the next glider call.   
   
*On seaglider.pub*: Click on the tools tab in the upper left corner. Select compass calibration and list the dives you are using (separate them by a comma). Then hit the process button. Something like this should be the result:   
![][image1]

You will need to do some reformatting to get the tcm2mat.cal file into the correct format for the glider.

For example if these were your values:   
hard0="-9.6 59.0 74.7"  
soft0="1.000 \-0.012 0.005 0.001 1.065 \-0.007 0.008 0.007 1.058"

The tcm2mat.\#\#\# file you could give the glider would be (\#\#\# \= glider serial number):

“SG175 compass cal”  
0.0000  1.0000  0.0000  0.0000  
0.0000  1.0000  0.0000  0.0000  
1.000 \-0.012 0.005 0.001 1.065 \-0.007 0.008 0.007 1.058 \-9.6 59.0 74.7

Once tcm2mat.\#\#\# is on the basestation, the glider needs a pdoscmds.bat file to get it on the glider. The following are in the file, the comments are optional.

// backup old tcm2mat.\#\#\# file  
ren tcm2mat.\#\#\# tcm2mat.old  
// install the new tcm2mat file  
xr tcm2mat.\#\#\#  
strip1a tcm2mat.\#\#\#  
// use the new file  
menu hw/compass/coeff

*tcm2mat.cal file format*  
Line 1 \- a descriptive string  
Lines 2 and 3 \- pitch roll correction (generally identity: 0 1 0 0\)  
Line 4 \- 9 soft0 values followed by three hard0 values

Bathymetric Maps

There is a script created by IOP that generates bathymap files, a zipped tar and optional .png. For any help run \<basepy bathymap.py \--help\> in any directory. For more information about the formatting, reference the [IOP user guide](https://iop.apl.washington.edu/iopsg/SGX_documentation_2024-v1.0.pdf) (bathymaps are Appendix D.4).

To run this script you need the following inputs (bracketed inputs are optional): latSouth latNorth lonWest lonEast resolution safety output.tgz \[output.png\]

- “safety” argument is a value in meters to add to each gridpoint as a safety factor, a value of 10 meters is typical

Example: \<basepy bathymap.py 45 48 \-123 \-122 1000 10 pugetsound.tgz pugetsound.png\>  
basepy bathymap.py 47 48 \-123 \-122 1000 10 pugetsound.tgz pugetsound.png

This will generate two files: pugetsound.tgz pugetsound.png. The png. file shows the map, there is no colorbar but the color axis is 0 to 1000m. Dark red areas are \> 1000m and dark blue area are shallower than the safety (\<10m)

The .tgz file needs to be unpacked and made readable for the glider. To do this run \<tar \-xvf pugetsound.tgz\>

This will unpack the file and turn it into BATHYMAP.001. The glider can carry up to 999 bathymetry maps but usually fewer are actually on board. The bathymap files are all named BATHYMAP.xxx, the xxx is a number 001 \- 999\.

Make sure this file is in the mission directory (for UW SSC missions this will be the “current” directory). Either do these commands in that directory or move the files after their creation. 

 To ensure these files have been read by the glider, you will need to make a pdoscmds.bat file. To do so, you can write the line \<pico pdoscmd.bat\> in the terminal. This will open up a window where you can type the following: 

xr BATHYMAP.001  
strip1a BATHYMAP.001

dir BATHYMAP.\*

The first two lines install the new bathymaps file. The final line checks that the new file has been uploaded. If you want to document what these lines do, this can be done in the pdoscmd.bat file by starting a line with \\\\. Two slashes comment out a line. 

The file (ex bathymap.001) will have a header line which declares the number of rows and columns, the latitude and longitude of the lower-left corner, and the distance between grid points. The data below has the depth of each grid point in column major order (each row \= one latitude, each column= one longitude)

Bathymaps take up glider memory so be careful not to make them too large (\<100 kB is standard but larger files have been loaded). If an area needs to be large or high-resolution, the bathymap.py script will split it into multiple smaller files.

**Data Management Workflow**

Analyzing and Cleaning the “timeseries” File

*Overview*  
The data that comes back from the glider is not always in a state ready for publishing and plotting. The data team should work with the data as soon as possible to determine the quality of the data, make any necessary changes, and sort the data files so that others in and out of the lab can easily work with it. Note that there is a cleaning template (clean\_data\_script.ipynb) and an analysis/plotting template under the [python\_scripts](https://github.com/UWOceanTech/Student-Seaglider-Center/tree/main/python_scripts) directory of GitHub. 

*Common Corrections*  
Time: Time on gliders can get reset if they have not been used/updated in a while. This sets the gliders back to 2004 but using two lines of code in python can easily correct the time. You just need to fill in the time offset which you can determine by calculating the amount of years, months, and days that bring you to the mission start date. 

\<adjusted\_time \= pd.to\_datetime(df\['time'\].values) \+ pd.DateOffset(years= \#, months=\#, days=\#)\>  
\<df \= df.assign\_coords(time=('sg\_data\_point', adjusted\_time))\>

Depth: If the pressure sensor is inaccurate, you will see this in the data most notably in the depth measurements. Plotting depth versus time reveals two things: whether depth goes more than a meter above 0 meters which means it needs to be offset and whether depth above 0 meters changes over time (variation of a meter or more) which means the offset will fluctuate based on cast. This requires sorting the data points by dive number, finding the amount above 0 that the first measurement is, and subtracting that amount from all the measurements in that dive. This is done with the code below.

\<depth \= df.depth.values\>  
\<dive\_ids \= df.sg\_data\_point\_dive\_number.values\>  
\<depth\_corrected \= depth.copy()\>  
\<unique\_dives \= sorted(set(dive\_ids))\>  
\<for d in unique\_dives:  
idx \= (dive\_ids \== d)   
offset \= depth\[idx\]\[0\]  
depth\_corrected\[idx\] \= depth\[idx\] \- offset\>  
\<df\["depth\_corrected"\] \= (("sg\_data\_point",), depth\_corrected)\>

*Variable Renaming*  
Several variables are renamed to better represent the data in the clean data file. This change is seen in the metadata of the file and documented below.

| Original Variable Name | Renamed Variable |
| :---- | :---- |
| eng\_wlbb2fl\_sig470nm | PAR\_470nm |
| eng\_wlbb2fl\_sig700nm | particle\_concentration\_700nm |
| eng\_wlbb2fl\_sig695nm | chlorophyll\_695nm |
| aanderaa4330\_dissolved\_oxygen | dissolved\_oxygen |
| aanderaa4330\_instrument\_dissolved\_oxygen | instrument\_dissolved\_oxygen |
| depth\_avg\_curr\_east | U\_DAC |
| depth\_avg\_curr\_north | V\_DAC |

*aanderaa4330\_dissolved\_oxygen vs aanderaa4330\_instrument\_dissolved\_oxygen*   
dissolved\_oxygen: Dissolved oxygen concentration, calculated from optode tcphase corrected for salinity and depth  
instrument\_dissolved\_oxygen: Dissolved oxygen concentration reported from optode corrected for salinity

*Sorting the Data*  
The clean data is sorted into two file categories: the timeseries file and the depth averaged currents (DAC) file. The contents of the timeseries file are all variables with the sg\_data\_point dimension. The contents of the DAC file are all variables with the dive dimension. The sg\_data\_point dimension contains measurements taken throughout the dive cycle. The frequency of measurements is determined by the sampling interval set in the science file. The dive dimension contains measurements taken at the start and end of each dive. The quantity of dive dimension measurements will be the same as the number of dives completed in that mission. 

These two file categories are both created while cleaning the data so, this process can be seen in the cleaning script in the [python\_scripts](https://github.com/UWOceanTech/Student-Seaglider-Center/tree/main/python_scripts) directory of the GitHub. The timeseries file will have the following variables: depth, temperature, salinity, dissolved\_oxygen, instrument\_dissolved\_oxygen, PAR\_470nm, partilce\_concentration\_700nm, chlorophyll\_695nm. Please note that some missions were done with gliders not equipped with an optode and/or a wetlabs sensor. For that reason, some timeseries files will not have all the variables previously listed and only the variables that are able to be collected with the mission’s sensor package. The DAC file will have the following variables: U\_DAC, V\_DAC, start\_latitude, end\_latitude, start\_longitude, end\_longitude. 

*Analysis*  
Seaglider data can answer a range of research questions and as such, there is a range of analysis that can be performed. A basic analysis where all the variables are plotted against depth and a plot of the Seaglider’s track over time can be created using the plotting\_nc or plotting\_csv (depending on your file type) script which is in the [python\_scripts](https://github.com/UWOceanTech/Student-Seaglider-Center/tree/main/python_scripts) directory of the GitHub. There is also code from previous projects in the python\_scripts directory. 

Uploading Files  
   
*Overview*  
After downloading the files off the basestation (following guidelines set in “Saving Files to your Desktop”) and cleaning the data you can start uploading files. Note that this process is dependent on the mission type. For longer missions, you may want to get a headstart on uploading files early so you are storing less on your computer and you’ll have less work at the end of the mission. 

*Upload Pathways*  
There are a couple ways to upload. You can sort the files by file type on your computer and upload the sorted folders. You could upload one singular folder to GitHub with all the files inside. You can upload the files individually or in small groups. 

*My Steps*  
I have been making one folder with all the files inside on my desktop and uploading groups of files (500 \- 1000 files) to GitHub. I have found the easiest way to upload files is in the .dev extension or the terminal space, both discussed in the “Using GitHub Extensions” section. 

1. Once you are in and upload files, you must commit the changes so the main branch of the GitHub is updated.   
2. Click on “source control” on the left side.   
3. Then you can click “commit and push” this may or may not work depending on the size of the files and the amount of files you have already uploaded. You can reach your API (Application Programming Interface) limit if you are trying to upload too many files in one day. GitHub enforces these limits to keep the site secure and available to all. In our context, this means that there is a cap to the amount of files you can upload in a certain period of time.   
4. To determine if the files are too big or if the limit is reached you can stage one file by selecting the \+ to the right of the file.   
5. Once it is staged, commit and push. If it goes through, your API limit is not the issue. If the file doesn’t go through, the API limit has been reached. If the limit is not reached you can continue on, staging files and slowly working up to larger groups of files. If the limit is reached, you are done for the day and can not continue. 

Creation of Supplementary Files

*Overview*  
After the raw files and the clean data is uploaded, it is time to create supplementary files. There are 5 types: metadata, CTD casts, READ\_ME, the mission plan, and the post-mission report.

*Metadata*  
We generally follow the OceanGliders format for metadata generation found on this [OceanOPS page](https://www.ocean-ops.org/metadata/#platform-metadata-submission-supported-formats). We substitute DAC, OceanGlider Theme, Special Feature, and Battery Pack for Telecom Type, Tracking System, and Data URL.

Here is the complete list of variables:

| Program |
| :---- |
| Internal Mission ID |
| WMO (unique identifier assigned to a glider) |
| Glider Name |
| Glider Model |
| Glider Serial Number |
| Contacts (PI Mandatory) |
| Contact Roles (PI Mandatory) |
| Agencies (Operating Agency Mandatory) |
| Agency roles |
| Start Date |
| Deployment Latitude |
| Deployment Longitude |
| Deployment Ship |
| End Date |
| Oceangliders Site |
| Network |
| Sensor Model |
| Sensor Serial Number |
| Sensor Calibration Date |
| Telecom Type |
| Tracking System |
| Data URL |
| RTQC Method |
| Comments |

*CTD casts*  
On missions where CTD casts were performed, these files need to be uploaded to GitHub. These files are used to verify the Seaglider Data. To do your analysis, you can use the CTD\_Seaglider\_comparison.ipynb file in the [python\_scripts](https://github.com/UWOceanTech/Student-Seaglider-Center/tree/main/python_scripts) directory of GitHub as a starting point.

*READ\_ME*  
The mission READ\_ME should provide basic information about the mission such as the gliders involved, location of the mission, and date of deployment and retrieval. The READ\_ME should also guide users through the mission folder, naming the different subfolders, explaining what and where the clean\_data is, and where to find raw data. 

Here is an example (brackets indicate areas to be filled in): 

`This is the folder for the Student Seaglider Center's [mission name] Mission. Glider[s] [glider name(s)] were deployed in [location] on [deployment date] and recovered on [retrieval date].`

`*if applicable*`  
`A CTD cast was completed during the deployment and recovery: [file name] (deployment) & [file name] (recovery).`

`The mission plan details all parts of deployment and recovery including personnel logistics, sensor details, tidal cycles, science questions, mission targets, boat traffic, mission preparation, budget, and safety procedures.`

`Inside each subfolder (*if applicable, otherwise just “Inside [glider name]) [glider names], there is the respective meta data file and a post-mission report (*if applicable).`

`*if applicable*`  
`The post mission provides a map where each glider was deployed and the path that it took. There are also a number of plots in the report, each of which can be made by using the plotting_nc or plotting_csv in the python_scripts folder.`

`The clean_data folder has csv and netCDF files that are corrected for the time offset and fewer renamed variables for simplicity in plotting. The raw data can still be found in raw_files > nc_files > the last file titled [file name]. The clean_data folder also has csv and netCDF files for the depth averaged currents and finally a python script detailing the process for cleaning the data.`

`The raw_files folder has all the raw files that come off the basestation. These are sorted by file type.` 

`For any questions about this mission please contact the Mission PI,[name and email], or the Data Manager,[name and email].`

*Mission Plan*  
The Mission Plan should be completed by the Mission PI and should follow the format below (created by Ayden Van Den Berg). Note that some mission plans currently on the GitHub do not follow this format as the mission plans were created after the completion of the mission since there had not yet been protocols in place for mission plan development. 

*`Italicized text means replace it with your text.`*

`SSC Field Measurement Plan`  
`Revised: (insert date of revision here)`

*`Mission name here`*  
*`Mission start and end date here – Location here`*  
*`POC: Name (email, number (if needed))`*

# `Overview (~1 paragraph)`

*`What is the main thing that will be happening in this mission? Who is funding it (is it a part of a bigger mission?), where and when will it take place and for how long? What is/are the main goals of this mission?`* `This document will describe the technical and logistical details of the intended data collection. (Keep this last line!)`

# `Location (~1 paragraph + relevant picture (i.e. maps with markers of waypoints)`

*`Describe the location of the mission. How remote is the location? Are there cultural differences that should be noted (i.e. working with locals to achieve smooth and safe work)? Is there a POC (i.e. chief scientist) for this mission? How do people get to this location (plane? Ship? etc.)? Describe some brief stats about the location (average depth, currents, winds, etc).`*

# `Main Science Questions (~1-2 paragraphs + figures as needed)`

*`Describe the main science question(s) that the mission is trying to answer. Be specific, and add reference and figures as necessary. This is more motivation for why we are going where we are going and conducting the mission.`*

# `Goals (~2 paragraphs + figures as needed)`

*`Describe the science goals of this mission. Why are seagliders needed here? What will be done with the measurements? How will the data being collected answer the questions discussed above?`*

# `Logistics (~3 paragraphs)`

*`Who is providing logistical support (add POC here)? How many people from SSC (if any) are being approved for the mission and how (who is funding)? What is included in the logistical support (food, lodging, internet, storage, facilities, etc)? What equipment (if any) is required (rental trucks, smaller boats, etc)? Describe any travel here (i.e. flights, boats, from where to where and when to when, and who is responsible for getting these)?`*

*`Describe any freight and equipment that is needed here. How are gliders getting to their location? In what? Do they require any rentals for their transport?`*

*`Describe how communication will be happening. Is there cell service available (if so, through what?) Is there internet? Are there sat phones needed (iridium)? How will communication be conducted on the mission?`*

# `Mobile Instruments (~3 paragraphs + pictures/diagrams)`

*`What glider(s) will be deployed? What sensors will they have on them and what will they be measuring? How will they be deployed? How will the data be transmitted/stored? Who will be piloting them and how?`* 

*`Describe the dives here. How deep will they go? What do their paths look like (put a map of their waypoint here along with their tracks)? What time of day will they be going in and why (i.e. tide considerations).`*

*`Put a table of glider piloting parameters that will be specified for the base station here. This should be enough information for anybody to set up the glider for the mission. Take pictures of the cmdfile, targets file, and science files and upload them here.`*

# `Glider Constants and Ballasting (~1 paragraph + diagrams+figures as needed)`

*`List any relevant information on the planned area here. Include surface and dive depth densities, typical tidal currents, and any information that will be relevant for the tech team to adjust the gliders with.`*

# `Glider Details (Table)`

*`Describe all of the components and dimensions in a table for each glider. Adjust as needed.`*

| `Dimensions` |  |
| :---- | :---- |
| `Power (battery packs and their voltage)` |  |
| `Hull material` |  |
| `Weight` |  |
| `Shipping crate dimensions` |  |
| `Endurance (estimate of time the glider can be out based on power and previous missions)` |  |
| `Tracking (RF)` |  |
| `Tracking (Iridium)` |  |
| `Telemetry` |  |
| `Processor` |  |
| `Sensors…` |  |

# `Instrumentation Summary (table)`

*`Describe the instruments on the glider in this table (add or remove rows/columns as needed). Look these up on the sensor’s spec sheets and report anything that is important (the more, the better).`*

| `Instrument` | `Platform`  | `Sampling Rate` | `Precision` | `Sampling Depth` | `Resolution` | `Power draw` | `Last calibration date` |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| `Seabird 911plus CTD` | *`SSC SG195`* | *`1 Hz`* | *`0.01 deg C`* | *`0-1000 m`* | *`3 m bins`* |  |  |
|  |  |  |  |  |  |  |  |

# `Testing (~1 paragraph)`

*`Describe the relevant tests needed before this deployment here. Where will the self test occur and what is needed to get the glider(s) ready for the mission.`*

# `Schedule (~1 paragraph + table)`

*`Summarize the schedule of the mission from beginning (i.e. ballasting, setting up glider constants/piloting information, testing, travel, actual mission, retrieval, etc).`*

| `Date` | `Action (1 line or so)` |
| :---- | :---- |
|  |  |

# `Personnel (table)`

*`Who will be conducting all of the mission steps listed above? Arrival and departure are for people who will be going to the actual mission site. Include everyone involved in testing, ballasting, and piloting and such here.`*

| `Name` | `Email` | `Team` | `Arrival IGG` | `Departure IGG` |
| :---- | :---- | :---- | :---- | :---- |
|  |  |  |  |  |

# `Budget (table)`

*`Describe the budget for everything included in the mission. This includes sensors, ship time, travel and lodging costs, and everything else. Include total at the bottom.`*

| `Action item/sensor` | `Cost` |
| :---- | :---- |
|  |  |

# `Safety (~3 paragraphs)`

*`Describe the overall safety requirements/expectations for this mission.`*

*`List small boat operations and communications if needed.`*

*`Describe incident response here.`*

# `Appendix` 

*`List any supporting information here. This includes plots, maps, calculations, and any relevant information that can help describe this mission.`*

# `References`

*`List references from any papers/websites here`*

*Post-Mission Report*  
A post-mission report should be made for every science mission (unnecessary for test missions). There should be a separate report for each glider involved in the mission. The report should detail the gliders used, the location of the mission, the deployment/retrieval dates, and locations of CTD casts (if applicable). The report also has a map of the area of interest, which can be acquired from Google maps, and plots that are made with the plotting\_csv or plotting\_nc (depending on the file type) script from the [python\_scripts](https://github.com/UWOceanTech/Student-Seaglider-Center/tree/main/python_scripts) folder of the GitHub. This will result in a map of the seaglider transect and plots of temperature, salinity, and oxygen (if applicable). 

**GitHub Organization** 

Naming Conventions

*Mission name*  
Science missions: one word mission name (ex: “Tropics”)  
Test missions: location and test (ex: “Shilshole\_Test”)

*Directory name*   
YYYY\_MM\_DD\_MissionName (using start date)

- Capitalize the first letter  
- Test missions have mission name instead to note that it is a test

*Timeseries file name*  
sg\#\#\#\_MissionName\_timeseries.nc

- Capitalize the first letter


*Metadata file name*  
sg\#\#\#\_MissionName\_metadata.csv

- Capitalize the first letter

*mission\_plan file name*  
MissionName\_missionplan.pdf

- Capitalize the first letter


*Clean data file names*  
cleaned\_sg\#\#\#\_MissionName\_timeseries.nc  
cleaned\_sg\#\#\#\_MissionName\_timeseries.csv  
cleaned\_DAC\_sg\#\#\#\_MissionName\_timeseries.nc  
cleaned\_DAC\_sg\#\#\#\_MissionName\_timeseries.csv  
cleaned\_sg\#\#\#\_MissionName.ipynb

*CTD cast file names*  
RBR\_CTD\_YYYY\_MM\_DD\_Location.xlsx

*Internal mission ID*

- Same as Directory name   
- Basestation name should match directory name

*Post Mission Report*  
post\_MissionName\_report\_glider\#.pdf

Using GitHub Extensions

*Overview*   
There are three spaces that we can edit the GitHub in: GitHub.com, GitHub.dev, and GitHub codespaces. Each has advantages and disadvantages. To get to GitHub.com, simply navigate to our GitHub page. GitHub.dev is a web-based editor that you can get to by altering .com to .dev in the search bar. Opening codespaces involves going to GitHub.dev, then searching “\>Terminal: Focus on Terminal View” in the search bar at the top of the screen. This will open up a panel where you can select Work in GitHub Codespaces or Continue Work in GitHub Codespaces. Select 2 cores when it pops up and then wait for the codespace to load. 

| GitHub Platforms | Advantages | Disadvantages |
| :---- | :---- | :---- |
| GitHub.com | Central hub for repositories, issues, pull requests, and collaboration. Version control and project management tools (no committing issues if two people are editing at the same time). Publicly visible repositories. Great for uploading a couple files at a time or to upload supplementary files. | Limited direct editing; difficult to upload many files and to change file and directory names. A poor choice when uploading all the files from the basestation. |
| GitHub.dev | Brower-based VS Code editor, good interface setup. No installation process, great for quick fixes and renaming.  Allows you to stage changes so you can break up the amount of files pushing to the main branch. Great for uploading basestation files.  | Can’t run or test code locally. Limited extensions. Easy to reach the API (Application Programming Interface) rate limits, meaning you can no longer commit anything.  Renaming large folders involves making a new folder with the new name, moving and then deleting all files from the old folder (resulting in many commits).  Two people can’t be editing in GitHub.dev or Codespaces at the same time. |
| Codespaces | Full environment with VS Code, terminal, dependencies, etc.  Can move files around using Linux, great for sorting the files from the basestation once they are already uploaded.  Easy and quick to push changes, great for changing names of larger directories.  | Two people can’t be editing in GitHub.dev or Codespaces at the same time. Limited space available and is a paid feature once you do. |

Setting up the Mission Folder

You can create this folder in GitHub.com, GitHub.dev, or the Codespace space. Select the new folder button in GitHub.dev or the terminal space. In GitHub.com select add file, write the folder name and add a / at the end of the name.

Follow naming conventions for directories:

Name the mission folder using this convention for science missions:  
 `YYYY_MM_DD_Location`  
*Example:* `2025_05_30_Puget_Sound`

Name the mission folder using this convention for test missions:  
 `YYYY_MM_DD_Location_Test`  
*Example:* `2025_05_17_Elliotbay_Test`

If there are multiple gliders on the mission, create subfolders with the names of the gliders.  
For Example:   
`Student-Seaglider-Center/`  
`└── 2025_05_30_Puget_Sound/`                  
    `├── READ_ME`                           
    `├── mission_plan.pdf`         
    `├── CTD Casts`        
    `├── sg175/`                            
    `│   ├── clean_data/`                   
    `│   │   ├── cleaned_sg175_2025_05_30_Puget_Sound_timeseries.csv`  
    `│   │   ├── cleaned_sg175_2025_05_30_Puget_Sound_timeseries.nc`  
    `│   │   ├── cleaned_DAC_sg175_2025_05_30_Puget_Sound_timeseries.csv                     oooo│   │   └── cleaned_DAC_sg175_2025_05_30_Puget_Sound_timeseries.nc`  
    `│   │   └── cleaned_sg175_OTTERS.ipynb`  
    `│   ├── raw_files/`                   
    `│   │   ├── alert_messages/`           
    `│   │   ├── nc_files/`                 
    `│   │   ├── log_files/`                
    `│   │   ├── eng_files/`                
    `│   │   ├── base_logs/`                
    `│   │   ├── x00_files/`                
    `│   │   └── ...`                     
    `│   ├── post_mission_report.docx`      
    `│   └── metadata.xlsx`  

READ\_ME

Inside the mission folder, include:  
`READ_ME` (file)

* Explain the folder contents so that an unfamiliar user can navigate.  
* Provide contact information (example): For any questions about this mission please contact the Mission PI, William Menapace (arnold64@uw.edu), or the Data Manager, Lydia Kelley (lydiagk@uw.edu).

Clean Data Folder

Inside the glider folder (if applicable), create a folder ‘clean\_data’, and include:

* `clean_data/` (folder)

  * `cleaned_sg#_Directory_Name_timeseries.csv`

  * `cleaned_sg#_Directory_Name_timeseries.nc`

  * `cleaned_DAC_sg#_Directory_Name_timeseries.csv`

  * `cleaned_DAC_sg#_Directory_Name_timeseries.nc`  
  *   
  * `cleaned_sg#_Mission_Name.ipynb` **—** Python notebook showing how the data was cleaned and saved.  
      
* The cleaned…timeseries files are= plotting variables on the sg\_data\_point dimensions  
* The cleaned\_DAC…timeseries are= plotting variables on the dive dimensions

Raw Files Folder

Inside the glider folder (if applicable), create a folder ‘raw\_files’, and include:  
All files coming off the basestation (except for .pvt files), sorted by file type. The majority of files should be sorted into a subfolder but, there will be some that don’t fit in anywhere and can be left as a file in raw\_files.

Mission Plan

Inside the mission folder, include:  
`mission_plan.pdf` (file)

* Large missions: include the official mission plan  
* Small missions: a short (1–2 paragraph) description of purpose and logistics.

Metadata

Inside the glider folder (if applicable, if not then the mission folder), include:  
Glider metadata in Excel format, following OceanGliders standards. Refer to the Section: Creation of Supplementary Files for more information.

Post Mission Report 

Inside the glider folder (if applicable, if not then the mission folder), include:  
Brief context about where the mission was conducted. Include preliminary plots (can be generated with the plotting script in [python\_scripts](https://github.com/UWOceanTech/Student-Seaglider-Center/tree/main/python_scripts)).

Uploading CTD Files

Inside the mission folder, include:  
**CTD Cast file(s)** (if applicable)

* Naming convention:  
   `sensor_identifier_YYYY_MM_DD_location.xlsx`  
* Example: `RBR_CTD_2025_05_30_Edmonds.xlsx`

Checking GitHub Memory

Check memory by running du \-sh directory or filename

- du \= disk usage (tells you about the disk space)  
- \-sh \= s is summary, h is human readable units (eg: 942 MB instead of 987654321 B)  
- Everything is in units of bytes but won’t have the unit of B when it prints out

[image1]: <data:image/png;base64,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>