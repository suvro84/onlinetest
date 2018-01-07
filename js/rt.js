function track(ip, p) {
    var rt_project = p;
    var rt_width = screen.width;
    var rt_height = screen.height;
    var rt_reff = "";
    try {
        rt_reff = parent.document.referrer
    } catch (ex) {
        rt_reff = document.referer
    }
    var rt_url = document.location;
    rt_reff = escape(rt_reff);
    rt_url = escape(rt_url);
    BrowserDetect.init();
    var rt_browser = BrowserDetect.browser;
    rt_browser = escape(rt_browser);
    var rt_os = getOSName();
    rt_os = escape(rt_os);
    var img = new Image();
    //img.src = "http://www.reliablewebcounter.com/RTracking.aspx?a=" + rt_project + "&b=" + rt_width + "&c=" + rt_height + "&d=" + rt_reff + "&e=" + rt_url + "&f=" + ip + "&g=" + rt_browser + "&h=" + rt_os + "&z=" + Math.random()
    img.src = "http://localhost:1732/OnlineTest/RTracking.aspx?a=" + rt_project + "&b=" + rt_width + "&c=" + rt_height + "&d=" + rt_reff + "&e=" + rt_url + "&f=" + ip + "&g=" + rt_browser + "&h=" + rt_os + "&z=" + Math.random()

}
function tracks(ip, s, p) {
    var rt_project = p;
    var rt_width = screen.width;
    var rt_height = screen.height;
    var rt_reff = "";
    try {
        rt_reff = parent.document.referrer
    } catch (ex) {
        rt_reff = document.referer
    }
    var rt_url = document.location;
    rt_reff = escape(rt_reff);
    rt_url = escape(rt_url);
    BrowserDetect.init();
    var rt_browser = BrowserDetect.browser;
    rt_browser = escape(rt_browser);
    var rt_os = getOSName();
    rt_os = escape(rt_os);
    var img = new Image();
   // img.src = "http://www.reliablewebcounter.com/RTracking.aspx?a=" + rt_project + "&b=" + rt_width + "&c=" + rt_height + "&d=" + rt_reff + "&e=" + rt_url + "&f=" + ip + "&g=" + rt_browser + "&h=" + rt_os + "&z=" + Math.random();
     img.src = "http://localhost:1732/OnlineTest/RTracking.aspx.aspx?a=" + rt_project + "&b=" + rt_width + "&c=" + rt_height + "&d=" + rt_reff + "&e=" + rt_url + "&f=" + ip + "&g=" + rt_browser + "&h=" + rt_os + "&z=" + Math.random();

    setTimeout("updatexml('" + ip + "','" + s + "','" + p + "')", 1000)
}
function updatexml(ip, s, p) {
    var img = new Image();
    //img.src = "http://www.reliablewebcounter.com/UpdateXML.aspx?a=" + p + "&s=" + s + "&i=" + ip + "&z=" + Math.random()
    img.src = "http://localhost:1732/OnlineTest/UpdateXML.aspx?a=" + p + "&s=" + s + "&i=" + ip + "&z=" + Math.random()

}
var BrowserDetect = {
    init: function () {
        this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
        this.version = this.searchVersion(navigator.userAgent) || this.searchVersion(navigator.appVersion) || "an unknown version";
        this.OS = this.searchString(this.dataOS) || "an unknown OS"
    },
    searchString: function (data) {
        for (var i = 0; i < data.length; i++) {
            var dataString = data[i].string;
            var dataProp = data[i].prop;
            this.versionSearchString = data[i].versionSearch || data[i].identity;
            if (dataString) {
                if (dataString.indexOf(data[i].subString) != -1) return data[i].identity
            } else if (dataProp) return data[i].identity
        }
    },
    searchVersion: function (dataString) {
        var index = dataString.indexOf(this.versionSearchString);
        if (index == -1) return;
        return parseFloat(dataString.substring(index + this.versionSearchString.length + 1))
    },
    dataBrowser: [{
        string: navigator.userAgent,
        subString: "Chrome",
        identity: "Chrome"
    },
    {
        string: navigator.userAgent,
        subString: "OmniWeb",
        versionSearch: "OmniWeb/",
        identity: "OmniWeb"
    },
    {
        string: navigator.vendor,
        subString: "Apple",
        identity: "Safari",
        versionSearch: "Version"
    },
    {
        prop: window.opera,
        identity: "Opera"
    },
    {
        string: navigator.vendor,
        subString: "iCab",
        identity: "iCab"
    },
    {
        string: navigator.vendor,
        subString: "KDE",
        identity: "Konqueror"
    },
    {
        string: navigator.userAgent,
        subString: "Firefox",
        identity: "Firefox"
    },
    {
        string: navigator.vendor,
        subString: "Camino",
        identity: "Camino"
    },
    {
        string: navigator.userAgent,
        subString: "Netscape",
        identity: "Netscape"
    },
    {
        string: navigator.userAgent,
        subString: "MSIE",
        identity: "Internet Explorer",
        versionSearch: "MSIE"
    },
    {
        string: navigator.userAgent,
        subString: "Gecko",
        identity: "Mozilla",
        versionSearch: "rv"
    },
    {
        string: navigator.userAgent,
        subString: "Mozilla",
        identity: "Netscape",
        versionSearch: "Mozilla"
    }],
    dataOS: [{
        string: navigator.platform,
        subString: "Win",
        identity: "Windows"
    },
    {
        string: navigator.platform,
        subString: "Mac",
        identity: "Mac"
    },
    {
        string: navigator.userAgent,
        subString: "iPhone",
        identity: "iPhone/iPod"
    },
    {
        string: navigator.platform,
        subString: "Linux",
        identity: "Linux"
    }]
};

function getOSName() {
    var bn, os, ua = navigator.userAgent;
    if (ua.match(/Win(dows )?NT 6\.0/)) {
        os = "Windows Vista"
    } else if (ua.match(/Win(dows )?NT 5\.2/)) {
        os = "Windows Server 2003"
    } else if (ua.match(/Win(dows )?(NT 5\.1|XP)/)) {
        os = "Windows XP"
    } else if (ua.match(/Win(dows)? (9x 4\.90|ME)/)) {
        os = "Windows ME"
    } else if (ua.match(/Win(dows )?(NT 5\.0|2000)/)) {
        os = "Windows 2000"
    } else if (ua.match(/Win(dows )?98/)) {
        os = "Windows 98"
    } else if (ua.match(/Win(dows )?NT( 4\.0)?/)) {
        os = "Windows NT"
    } else if (ua.match(/Win(dows )?95/)) {
        os = "Windows 95"
    } else if (ua.match(/Mac|PPC/)) {
        os = "Mac OS"
    } else if (ua.match(/Linux/)) {
        os = "Linux"
    } else if (ua.match(/(Free|Net|Open)BSD/)) {
        os = RegExp.$1 + "BSD"
    } else if (ua.match(/SunOS/)) {
        os = "Solaris"
    } else {
        os = "N/A"
    }
    return os
}