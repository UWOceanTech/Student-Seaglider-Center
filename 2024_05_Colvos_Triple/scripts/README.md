General Scripts for UWSSC should be added here and commented upon such that theycan be read and executed from any member.

For .sh (shell) scripts, simply navigate to the directory where your .sh file is located on your local machine in terminal, then type ./your_script.sh and hit enter.
If you get a permissions issue, run this before executing: chmod +x /path/to/yourscript.sh     (this adds excecute permissions to the file)

To grab the full timeseries (netcdf) by itself with all of the variables, simply type the following in your terminal:

scp USERNAME@seaglider.pub:/home/jails/uwssc/gliderjail/home/sg195/current/sg195_MOTIVE_2024_timeseries.nc /PATH/TO/YOUR/LOCAL/DIRECTORY/

Note that for above, you need access to the seaglider.pub, so either use a lab computer, ask Rick for access, or somebody from leadership to do this for you. Also, The name of the time series will change (as well as the path) depending on the mission, so just make sure this is updated!
