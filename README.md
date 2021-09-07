# Cheatsheet
some useful sysadmin scripts


## quick multithreaded file transfer trick:

sender:
`tar -c daemon-data | pigz -vv9 | nc $IP 3245`

receiver:
`nc -l 3245 | unpigz -vvv | tar -x`

Can pull about a full uplink

## Docker pushing invalid packets with spoofed source ips
Preventing this is handy enough by the way, just add this to your forwarding chain in iptables and it'll drop that kinda stuff. iptables -I FORWARD -m conntrack --ctstate INVALID -j DROP

## Docker broadcast to all containers
```bash
for server in $(docker ps --format '{{.Names}}')
 do
    echo "Running LIST FOR $server"
    echo 'list' | socat EXEC:"docker attach $server",pty STDIN
done
```

## Hetzner adapter reset unexpectedly
blame hetzner for using bad nics, but its cheap
`ethtool -K <interface> gso off gro off tso off tx off rx off rxvlan off txvlan off sg off`

## Some virtualizor windows images
http://mirror.softaculous.com/virtualizor/templates/windows-2016.img.gz

http://mirror.softaculous.com/virtualizor/templates/windows-2019.img.gz

## iptables whitelist cloudflare
### Whitelist Cloudflare IPv4s
for i in `curl https://www.cloudflare.com/ips-v4`; do iptables -I INPUT -p tcp -m multiport --dports http,https -s $i -j ACCEPT; done
### Whitelist Cloudflare IPv6s
for i in `curl https://www.cloudflare.com/ips-v6`; do ip6tables -I INPUT -p tcp -m multiport --dports http,https -s $i -j ACCEPT; done

### Tell everyone else to fuck off
iptables -A INPUT -p tcp -m multiport --dports http,https -j DROP

ip6tables -A INPUT -p tcp -m multiport --dports http,https -j DROP


## Visual Studio shortcuts
ctrl-k ctrl-D format document

ctrl-k ctrl-c comment

ctrl-k ctr-u uncomment
