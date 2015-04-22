function FindProxyForURL(url,host)
{
    var direct ="DIRECT";
    var httpProxy="squid.apac.redhat.com:3128";
    if(shExpMatch(host,"https://mail.corp.redhat*"))
    {
        return direct;
    }
    return "PROXY squid.apac.redhat.com:3128; DIRECT";
}
