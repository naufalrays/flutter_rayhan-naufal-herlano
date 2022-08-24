# (03) Basic Version and Branch Management (Git)
## Data Diri
Nomor Urut : 1_018FLC_0
Nama : Rayhan Naufal Herlano

## Summary 
Ilmu yang saya dapat pada saat Belajar tentang Basic Version dan Branch Management (Git) :

-git init digunakan untuk membuat repository baru di lokal

-git remote digunakan untuk menghubungkan repository lokal ke remote server

-git add digunakan untuk menambahkan perubahan yang terjadi ke dalam stagging area

-git commit digunakan untuk menyimpan perubahan untuk siap dikirimkan ke remote repository

-git push digunakan untuk mengirimkan perubahan file ke remote repository yang telah dilakukan setelah di commit 

-git branch development digunakan untuk menambahkan branch development yang mana pada implementasi master, development, fiturA, dan fiturB maka development di sini akan menyimpan sebuah perubahan yang terjadi pada fiturA dan fitur B lalu mengirimkannya ke pada master branch

-git branch featureA/featureB adalah membuat branch baru bernama featureA/B, yang mana dalam kasus ini featureA/B nantinya akan mengirimkan perubahan ke branch development lalu jika sudah final maka akan dikirimkan ke branch master

-git checkout featureB digunakan untuk berpindah branch ke featureB

-git stash digunakan untuk menyimpan perubahan yang terjadi ke dalam stash, jadi perubahan akan disimpan dan jika dilihat pada codingan perubahannya akan menghilang/disimpan

-git stash apply digunakan untuk mengaplikasikan perubahan yang telah disimpan ke dalam stash lalu digunakan pada codingan perubahan yang sekarang

-Merge no fast-forward digunakan untuk menggabungkan sebuah branch dengan branch lain, dan no fast forward berfungsi untuk menunjukkan perubahan pada graph, perubahan yang terjadi terlihat bercabang jadi kita akan lebih mudah tracking perubahannya

-git stash drop digunakan untuk menghilangkan perubahan yang telah disimpan pada stash

-git pull digunakan untuk menggabungkan perubahan yang ada pada remote repository ke direktori lokal 

## Task
### Task 1
Saya membuat sebuah repository github dengan nama flutter_rayhan-naufal-herlano.
Berikut adalah ilustrasi halaman pembuatan repository Github teresebut.
![Gambar1](Screenshot/Membuat%20repository%20baru.png)

### Task 2
Saya mengimplementasikan penggunaan branching yang terdiri dari master, development, featureA, dan featureB dengan cara hanya mengubah pada featureA dan featureB terlebih dahulu, jika sudah menambahkan fitur maka dapat kita merge ke branch developemnt, dan jika sudah final pada development maka kita akan merge ke branch master.
![Gambar2](Screenshot/Tampilan%20Graph.png)

### Task 3
git push digunakan untuk mengirimkan perubahan file ke remote repository yang telah dilakukan setelah di commit 
![Gambar3](Screenshot/git%20add%20git%20commit%20%20dan%20git%20push.png)

git pull digunakan untuk menggabungkan perubahan yang ada pada remote repository ke direktori lokal 
![Gambar4](Screenshot/git%20pull.png)

git stash digunakan untuk menyimpan perubahan yang terjadi ke dalam stash, jadi perubahan akan disimpan dan jika dilihat pada codingan perubahannya akan menghilang/disimpan
![Gambar5](Screenshot/git%20stash.png)
![Gambar6](Screenshot/git%20stash%20apply.png)
![Gambar7](Screenshot/git%20stash%20drop.png)

git merge digunakan untuk menggabungkan sebuah branch dengan branch lain, dan no fast forward berfungsi untuk menunjukkan perubahan pada graph, perubahan yang terjadi terlihat bercabang jadi kita akan lebih mudah tracking perubahannya
![Gambar8](Screenshot/git%20merge.png)

### Task 4
Ketika Merge development dengan branch B akan menimbulkan konflik dikarenakan sebelumnya branch A merge dengan development membawa perubahan yang mana line branch A dengan branch B sama.
![Gambar9](Screenshot/conflict%20merge.png)

### Task 5
git merge digunakan untuk menggabungkan sebuah branch dengan branch lain, dan no fast forward berfungsi untuk menunjukkan perubahan pada graph, perubahan yang terjadi terlihat bercabang jadi kita akan lebih mudah tracking perubahannya
![Gambar8](Screenshot/git%20merge.png)

### Task 6
https://github.com/naufalrays/flutter_rayhan-naufal-herlano/tree/master