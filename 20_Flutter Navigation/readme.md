# (20) Flutter Navigation


## Data Diri
Nomor Urut : 1_018FLC_0

Nama : Rayhan Naufal Herlano

## Summary 
### Apa itu Navigation?
>Berpindah dari halaman satu ke halaman lain

<img src="./Screenshot/navigation.png" width=30% height=30%>


### Navigation Dasar

1. Perpindahan halaman menggunakan 
```
Navigator.push()
```
2. Kembali ke halaman sebelumnya menggunakan
```
Navigator.pop()
```

Perpindahan Halaman

Home Screen :

<img src="./Screenshot/coding_home_screen.png" width=30% height=30%>
<img src="./Screenshot/home_screen.png" width=10% height=10%>

About Page :

<img src="./Screenshot/coding_about_screen.png" width=30% height=30%>
<img src="./Screenshot/about_screen.png" width=10% height=10%>

Mengirim Data ke Halaman Baru
>Menggunakan parameter pada constructor halaman

<img src="./Screenshot/passing_data.png" width=70% height=70%>

### Navigation dengan Named Routes
- Tiap halaman memiliki alamat yang disebut route, perpindahan halaman menggunakan 
```
Navigator.pushNamed()
```
- Kembali ke halaman sebelumnya menggunakan Navigator.pop()

Mendaftarkan Route
- Tambahkan initialRoute dan routes pada MaterialApp
- Tiap route adalah fungsi yang membentuk halaman

<img src="./Screenshot/add_routes.png" width=30% height=30%>

Perpindahan Halaman

<img src="./Screenshot/navigator_pushnamed.png" width=30% height=30%>

Mengirim Data ke Halaman Baru

<img src="./Screenshot/pushnamed_passing_data.png" width=70% height=70%>

