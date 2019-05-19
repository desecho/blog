---
title: "How To Watch Movies And TV Shows On PC"
date: 2018-03-01T00:41:11-05:00
comments: true
categories: Windows
keywords: windows, tv, movies, tv-shows
---

## VPN 

It is better to use VPN to stream videos. I would recommend [NordVPN](https://nordvpn.com). It costs about 3.5 C$/month. It could increase the speed and it is also good for security and privacy. It will also allow you to watch Netflix & Amazon Prime videos which are not available in your country.

## Netflix & Amazon Prime

You can find a list of Movies and TV-shows available on Netflix & Amazon Prime on [JustWatch](https://www.justwatch.com/).

### Netflix 

Website - http://netflix.com.  
Price - 14 C$/month (FullHD), 17 C$/month (4K).

Netflix is the only streaming service which allows you to watch 4K videos on a PC. It only works with Microsoft Edge browser and Netflix recommends you to have at least 25Mbit/s internet connection. You should also use the Display Port or an HDMI port and cable which supports 4K. See details on Netflix on the page ["Can I stream Netflix in Ultra HD?"](https://help.netflix.com/en/node/13444).

### Amazon Prime

Websites:

* https://www.primevideo.com/
* [Amazon Prime US Video Search](https://www.amazon.com/Amazon-Video/b/ref=topnav_storetab_atv?_encoding=UTF8&node=2858778011)

Price - about 6.6 C$/month. It includes other [benefits](https://www.amazon.com/gp/help/customer/display.html?nodeId=201910360) as well.

## Kodi

### Downloads
First, download [Kodi](https://kodi.tv/).

Then you can download some of available add-on repositories:

* [The Official Repo for Mr Blamo](http://repo.mrblamo.xyz)
* [The MaverickTV Repository](http://mavericktv.net/mavrepo/)
* [Stream Army Repo](https://github.com/nemesis668/repository.streamarmy/blob/master/zips/repository.StreamArmy/)
* [Zero Tolerance Repository](http://repozip.zerotolerance.gq/)

### Installation
Then you can install them by running Kodi and clicking the gear -> Settings -> Add-ons -> Enable "Unknown sources" -> Back -> Add-ons -> Install from zip file -> Choose zip file location.  
After that, Install from repository -> Choose repository and install the video add-ons you like.  
Then you can open the add-ons by hovering over Add-ons.

### Resolve an audio issue
There is a problem with muted sound after pausing and this is a workaround to resolve this issue.

You should also install an add-on "Services - Unpause Jumpack". To install it, search for it's name.  
Then configure it so that "Jump back onpause" section has the following values:

* Jump seconds - 1
* Minimum pause before jumpback - 0

### Cache settings
You should also create a file `%APPDATA%\kodi\userdata\advancedsettings.xml` with the following content:  

```xml
<advancedsettings>
    <cache>
        <buffermode>2</buffermode>
        <memorysize>529530880</memorysize>
        <readfactor>5</readfactor>
    </cache>
</advancedsettings>
```

See details on the page ["How to modify the cache"](https://kodi.wiki/view/HOW-TO:Modify_the_cache) on Kodi wiki.

### Logs
If something ever goes wrong and you see an error, you can find the log here: `%APPDATA%\Roaming\Kodi\kodi.log`.  

### Real Debrid
To be able to access more content you can subcribe to ["Real Debrid"](http://real-debrid.com/?id=2307762). It costs about 4.25 C$/month.  
You have to configure it after. To configure it, search for one of the video add-ons which uses it, for example, Nemesis. Select Dependenies -> ResolveURL -> Configure -> Universal Resolvers -> Real-Debrid -> (Re)Authorize My Account -> Follow instructions on the screen.

### 4K

Nemesis -> Movie Zone -> 4K Movies
Skynet -> Watch The Latest Movies And Shows At The Flix -> Watch At The Flix -> 4K UHD Movies  
Skynet -> Maverick TV -> Maverick 4K UHD Movies  
Skynet -> Maverick TV -> Real Debrid 4k UHD and FHD  
Skynet -> Supremacy -> 4K Movies  
