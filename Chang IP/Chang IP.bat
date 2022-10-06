netsh interface ip set address name="本地连接" static 192.168.0.10 255.255.255.0 192.168.0.1 1
netsh int ip set dns "本地连接" static 8.8.8.8