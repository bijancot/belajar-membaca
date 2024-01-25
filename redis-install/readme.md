# Hola, el documentaion for redis

redis installer ini dibuat berdasarkan behaviour install pada ubuntu 22.04. berikut menu help dan argument yang tersedia:
```
 - attempt to capture frames
 
 [options] application [arguments]
 
options:
-h, --help       show brief help
-p, --port       specify port
```
script ini akan berusaha melakukan install di server yang didalamnya tidak ada redis. Jika ada redis yang terinstall di dalam vm, maka lakukan uninstall manual terlebih dahulu.

## batasan script
- Hanya melakukan install pada vm baru
- Hanya bisa dijalankan menggunakan sudoers atau root user 

## pengembangan
- Penambahan check existing redis di server
- set password dinamis melalui argument 
- Penambahan beberapa argument seperti delete existing config or no, add more custom config

fin.

ttd Panji Iman Baskoro