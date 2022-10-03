# (21) Flutter State Management (Provider)

## Data Diri
Nomor Urut : 1_018FLC_0

Nama : Rayhan Naufal Herlano

## Summary 
## Flutter Global State Management
### State
Dekripsi
```
- Data yang dapat dibaca saat pembuatan widget
- Dapat berubah saat widget sedang aktif
- Hanya dimiliki oleh StatefulWidget
```

Kenapa perlu Global State?
>Agar antara widget dapat memanfaatkan state yang sama dengan mudah.

Memanfaatkan State

<img src="./Screenshot/state.png" width=20% height=20%>

- Dibuat sebagai property dari class
- Digunakan pada widget saat build.

Mengubah State
- Menggunakan method setState

<img src="./Screenshot/change_state.png" width=30% height=30%>


### Global State
>Merupakan state biasa yang dapat digunakan pada seluruh widget

<img src="./Screenshot/provider.png" width=40% height=40%>


Instalasi Provider
- Menambahkan package provider pada bagian dependencies dalam file pubspec.yaml
- Jalankan perintah flutter pub get

<img src="./Screenshot/install_provider.png" width=70% height=70%>

Membuat State Provider
- Buat file bernama contact.dart
- Definisikan state dalam bentuk class

<img src="./Screenshot/create_state_provider.png" width=50% height=50%>

Mendaftarkan State Provider
- Import dalam file main.dart
- Daftarkan pada runApp dengan MultiProvider

<img src="./Screenshot/multiprovider_main.png" width=50% height=50%>

Menggunakan State dari Provider
- Simpan provider dalam variable
- Ambil data dari provider melalui getter

<img src="./Screenshot/get_provider_data.png" width=70% height=70%>
