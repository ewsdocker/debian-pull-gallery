## ewsdocker/alpine-pull-gallery

Alpine Linux docker image for [RipMeApp/ripme](https://github.com/RipMeApp/ripme).
____  

**NOTE:**  This project is currently under development, and **NOT** ready for use.  
____  

**Usage (Standard)**

```
docker run -it \
           --rm \
           -v /tmp/data:/data \
           --name=alpine-pull-gallery \
       ewsdocker/alpine-pull-gallery  

```
will download and install the **ewsdocker/alpine-pull-gallery** image, create a container named **alpine-pull-gallery**, and display the _help_ dialog:  

```
Loaded file:/app/ripme.jar!/rip.properties
Loaded log4j.properties
Initialized ripme v1.4.4
usage: java -jar ripme.jar [OPTIONS]
 -4,--skip404               Don't retry after a 404 (not found) error
 -D,--nosaveorder           Don't save order of images
 -d,--saveorder             Save the order of images in album
 -f,--urls-file <arg>       Rip URLs from a file.
 -h,--help                  Print the help
 -l,--ripsdirectory <arg>   Rips Directory (Default: ./rips)
 -n,--no-prop-file          Do not create properties file.
 -r,--rerip                 Re-rip all ripped albums
 -R,--rerip-selected        Re-rip all selected albums
 -t,--threads <arg>         Number of download threads per rip
 -u,--url <arg>             URL of album to rip
 -w,--overwrite             Overwrite existing files

```

The following _docker_ command will 
1. download and install the **ewsdocker/alpine-pull-gallery** image (if it does not already exist),  
2. create and run a temporary docker container named **alpine-pull-gallery**, and  
3. download the indicated gallery (**-u**) to the folder in the volume **~/Pictures/inside-from-the-rain** on the docker host:

```
docker run -it \
           --rm \
           -v ${HOME}/Pictures/inside-from-the-rain:/data \
           --name=alpine-pull-gallery \
       ewsdocker/alpine-pull-gallery -u 'https://inside-from-the-rain.tumblr.com'
```
