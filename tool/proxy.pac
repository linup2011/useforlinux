function FindProxyForURL(url,host)
{
    var direct ="DIRECT";
    var httpProxy="squid.apac.redhat.com:3128";
    if(isPlainHostName(host)||shExpMatch(url,"http://127.0.0.1/*"))
    {
        return direct;
    }
    if(shExpMatch(host,"https://mail.corp.redhat*"))
    {
        return direct;
    }
/*    if(shExpMatch(host,"*redhat.com*"))
    {
        return direct;
    }*/
    if(shExpMatch(host,"*redhat.com"))
    {
        return direct;
    }
    if(shExpMatch(host,"*youdao.com*"))
    {
        return direct;
    }
    if(shExpMatch(host,"*www.baidu.com*"))
    {
        return direct;
    }
    return "PROXY squid.apac.redhat.com:3128; DIRECT";
}
