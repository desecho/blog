---
title: "How To Watch Movies And Tv Shows On Pc"
date: 2018-03-01T00:41:11-05:00
comments: true
categories: Windows
keywords: windows
---

## Netflix

This is the only streaming service which allows you to watch 4K videos on a PC. It costs 14 C$/month. It only works with Microsoft Edge browser and Netflix recomments you to have at least 25Mbit/s internet connection. You should also use the Display Port or an HDMI port and cable which supports 4K. See details on Netflix on the page ["Can I stream Netflix in Ultra HD?"](https://help.netflix.com/en/node/13444).

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
There is a problem with muted sound after pausing and that is a workaround to resolve this issue.

You should also install an add-on "Services - Unpause Jumpack". To install it, search for it's name.  
Then configure it so that "Jump back onpause" section has the following values:

* Jump seconds - 1
* Minimum pause before jumpback - 0

### Cache settings
You should also create this file `%APPDATA%\kodi\userdata\advancedsettings.xml` with this content:  

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

### VPN
Kodi will probably works better with a VPN. I would recommend [NordVPN](https://nordvpn.com). It costs about 3.5 C$/month. It could increase the speed and it is also good for security and privacy. It will also allow you to watch Netflix videos which are not available in your country.

### Real Debrid
To be able to access more content you can subcribe to ["Real Debrid"](https://real-debrid.com). It costs about 4.25 C$/month.  
You have to configure it after. To configure it, search for one of the video add-ons which uses it, for example, Nemesis. Select Dependenies -> ResolveURL -> Configure -> Universal Resolvers -> Real-Debrid -> (Re)Authorize My Account -> Follow instructions on the screen.

## Zona
You can also install [Zona](http://zona.ru/en/) which enables to stream torrents.  
Configure it like this:

* Settings -> Scale -> Auto
* Settings -> Downloads -> Set the "Downloads folder". Set the "Speed limit".
