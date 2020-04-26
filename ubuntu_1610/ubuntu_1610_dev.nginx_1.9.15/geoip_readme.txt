cd /usr/local/share/GeoIP/GeoIP-1.4.8
./configure && make && make install

echo '/usr/local/lib' > /etc/ld.so.conf.d/geoip.conf
ldconfig


geoip_country /usr/local/nginx/GeoLite2-Country.mmdb;
#geoip_city /usr/local/nginx/GeoLite2-City.mmdb;


fastcgi_param GEOIP_COUNTRY_CODE $geoip_country_code;
fastcgi_param GEOIP_COUNTRY_CODE3 $geoip_country_code3;
fastcgi_param GEOIP_COUNTRY_NAME $geoip_country_name;


location ~ ^/geoip(/)?$ {
    default_type text/html;
    add_header Content-Type 'text/html; charset=utf-8';
    proxy_set_header            Host $host;
    set $Real $proxy_add_x_forwarded_for;
    if ( $Real ~ (\d+)\.(\d+)\.(\d+)\.(\d+),(.*) ){
         set $Real $1.$2.$3.$4;
    }
    proxy_set_header X-real-ip $Real;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    #return 200 $geoip_country_code;
    #return 200 $proxy_add_x_forwarded_for;
    return 200 $remote_addr;
}
