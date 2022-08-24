# (03) Basic Version and Branch Management (Git)
## Data Diri
Nomor Urut : 1_018FLC_0

Nama : Rayhan Naufal Herlano

## Summary 
Ilmu yang saya dapat pada saat Belajar tentang Basic Version dan Branch Management (Git) :

> Versioning adalah mengatur versi dari source code program

> Git adalah software yang bertugas untuk mencatat perubahan seluruh file atau repository suatu project

 > Branching adalah membuat cabang dari repositori utama dan melanjutkan melakukan pekerjaan pada cabang yang baru tersebut tanpa perlu khawatir mengaukan yang utama

Membuat repository baru di lokal :
```
git init
``` 
Menghubungkan repository lokal ke remote server :
```
git remote 
```
Menambahkan perubahan yang terjadi ke dalam stagging area :
```
git add
``` 
Menyimpan perubahan untuk siap dikirimkan ke remote repository :
```
git commit
``` 
Mengirimkan perubahan file ke remote repository yang telah dilakukan setelah di commit  :
```
git push
```
Menambahkan branch development yang mana pada implementasi master, development, fiturA, dan fiturB maka development di sini akan menyimpan sebuah perubahan yang terjadi pada fiturA dan fitur B lalu mengirimkannya ke pada master branch :
```
git branch development
```
Membuat branch baru bernama featureA/B, yang mana dalam kasus ini featureA/B nantinya akan mengirimkan perubahan ke branch development lalu jika sudah final maka akan dikirimkan ke branch master :
```
git branch featureA/featureB 
```
Untuk berpindah branch ke featureB :
```
git checkout featureB
```
Menyimpan perubahan yang terjadi ke dalam stash, jadi perubahan akan disimpan dan jika dilihat pada codingan perubahannya akan menghilang/disimpan :
```
git stash 
```
Mengaplikasikan perubahan yang telah disimpan ke dalam stash lalu digunakan pada codingan perubahan yang sekarang :
```
git stash apply 
```
Menggabungkan sebuah branch dengan branch lain, dan no fast forward berfungsi untuk menunjukkan perubahan pada graph, perubahan yang terjadi terlihat bercabang jadi kita akan lebih mudah tracking perubahannya :
```
git merge --no-ff
```  
Menghilangkan perubahan yang telah disimpan pada stash :
```
git stash drop
``` 
Menggabungkan perubahan yang ada pada remote repository ke direktori lokal :
```
git pull 
```