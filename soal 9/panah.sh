echo 'options {

    directory "/var/cache/bind";
    auth-nxdomain no;
    listen-on-v6 { any; };
};' > /etc/bind/named.conf.options

echo 'zone "sudarsana.it26.com" {
    type master; 
    also-notify { 192.246.1.2; }; // IP Majapahit
    allow-transfer { 192.246.1.2; }; // IP Majapahit
    file "/etc/bind/sudarsana/sudarsana.it26.com";
};

zone "pasopati.it26.com" {
    type master; 
    also-notify { 192.246.1.2; }; // IP Majapahit
    allow-transfer { 192.246.1.2; }; // IP Majapahit
    file "/etc/bind/pasopati/pasopati.it26.com";
};

zone "rujapala.it26.com" {
    type master; 
    also-notify { 192.246.1.2; }; // IP Majapahit
    allow-transfer { 192.246.1.2; }; // IP Majapahit
    file "/etc/bind/rujapala/rujapala.it26.com";
};

zone "panah.pasopati.it26.com" {
    type master;
    file "/etc/bind/panah/panah.pasopati.it26.com";
};' > /etc/bind/named.conf.local

echo ';
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     panah.pasopati.it26.com. root.panah.pasopati.it26.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      panah.pasopati.it26.com.
@       IN      A       192.246.2.2     ;IP Kotalingga
www     IN      A       192.246.2.2     ;IP Kotalingga
@       IN      AAAA    ::1' > /etc/bind/panah/panah.pasopati.it26.com

service bind9 restart
