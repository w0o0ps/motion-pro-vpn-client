# Quick reference

Maintained by: [w0o0ps](https://github.com/w0o0ps)

# Supported tags and respective `Dockerfile` links

- [`9.4.0.356`, `9.4.0`, `9.4`, `9`, `latest`](https://github.com/w0o0ps/motion-pro-vpn-client/blob/master/Dockerfile)

# Quick reference (cont.)

- Source binaries: [Array Networks](https://support.arraynetworks.net/prx/001/http/supportportal.arraynetworks.net/downloads/downloads.html)
- Manual: [IBM Cloud doc](https://cloud.ibm.com/docs/iaas-vpn?topic=iaas-vpn-standalone-vpn-clients&locale=en)

# What is Motion Pro?

Motion Pro is standalone VPN client for private access to IBM Cloud (SoftLayer).

# How to use this image

## Running the container

```
$ docker run --hostname my-vpn-client --name my-vpn-client --interactive --tty --privileged w0o0ps/motion-pro-vpn-client
```

### Establish VPN connection

```
[root@my-vpn-client /]# MotionPro --host ${VPN_ENDPOINTS}
Only one method: radius
Input username: ${YOUR_ACCOUNT}
Input password for authentication: ${YOUR_PASSWORD}
login successfully!
starting vpn...
current status:0
current status:0
Connect successfully!
Vpn is connected!
```

You can find available `${VPN_ENDPOINTS}` on [IBM Cloud doc](https://cloud.ibm.com/docs/iaas-vpn?topic=iaas-vpn-available-vpn-endpoints).

### Close VPN connection

```
[root@my-vpn-client /]# MotionPro --stop
stop connection successfully!
```

### MotionPro command options

```
-s, --stop      stop vpn
-h, --host      AG host (Required). If no port is given, the default port is 443. If referencing the shared virtual site, please add the alias name at the end. (i.e.hostname:port / alias)
-u, --user      username for login (Required)
-p, --passwd    password for login (Required)
-m, --method    aaa method for login; if there is only one method, this will choose the default method
-c, --count     Reconnect count, "inf" means reconnect all the time (Default: 0, means: no reconnect)
-i, --interval  interval between l3vpn reconnect attempts (Default: 0 sec, means: immediately; max: 3600 sec)
-e, --enable    enable proxy
-t, --proxyhost Proxy host (Required if proxy enabled), if no port is given the default port is 0.(i.e.     post:port)
-n, --proxyuser Proxy username (Required if proxy enabled), if the user wants to assign a domain, please add the domain before the username. (i.e.domain\username)
-w, --proxypwd  Proxy password (Required if proxy enabled)
-a, --status    display vpn status
-f, --certfile  certificate file path for login (pfx format)
-d, --certpass  certificate file password
-l, --loglevel  log level: debug|info|warn|error
-q, --quiet     quiet mode
-g, --syslog    write log to syslog
-b, --bandwidth download spped limit,upload speed limit(unit is kbps)
```

## docker compose

```
version: '3'

services:
  my-vpn-client:
    container_name: my-vpn-client
    hostname: my-vpn-client
    image: w0o0ps/motion-pro-vpn-client:latest
    tty: true
    privileged: true
```
