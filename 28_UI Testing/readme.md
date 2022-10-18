# (28) UI Testing

## Data Diri
Nomor Urut : 1_018FLC_0

Nama : Rayhan Naufal Herlano

## Summary 
## UI Testing

### UI Testing
>UI testing merupakan pengujian yang dilakukan pada tampilan suatu aplikasi untuk memutuskan aplikasi dapat menerima interaksi dan memberi respon kepada pengguna.

UI Testing di Flutter
>Disebut juga widget testing sehingga pengujian dilakukan pada widgets dengan menuliskan script yang dapat dijalankan secara otomatis

Keuntungan UI Testing :
- Memastikan seluruh widget memberi tampilan yang sesuai
- Memastikan seluruh interaksi dapat diterima dengan baik
- Menjadi ketentuan yang harus diikuti saat diperlukan perubahan pada widget


### Melakukan UI Testing
Instalasi Package Testing
>Pada umumnya, package testing sudah ter-install sejak project pertama kali dibuat. Tetapi, cara ini dapat dilakukan, jika ingin meng-install secara manual.

<img src="./Screenshot/installation_ui_testing.png" width=40% height=40%>

Penulisan Script Testing

<img src="./Screenshot/writing_rules.png" width=30% height=30%>

- Dilakukan pada folder test
- Nama file harus diikuti _test.dart, contoh contact_test.dart 
- Tiap file berisi fungsi main() yang di dalamnya dapat dituliskan script testing
- Tiap skenario pengujian disebut test case

<img src="./Screenshot/main_testing.png" width=60% height=60%>

Script Testing
- Test case diawali dengan testWidgets dan diberi judul
- Simulasi proses mengaktifkan halaman AboutScreen
- Memeriksa apakah di halaman tersebut terdapat teks "About Screen"

<img src="./Screenshot/test_widgets.png" width=60% height=60%>

### Menjalankan Testing
- Perintah flutter test akan menjalankan seluruh file test yang dibuat
- Hasil dari perintah ini adalah lamanya waktu pengujian, total pengujian yang dilakukan, dan pesan bahwa pengujian berhasil

<img src="./Screenshot/run_testing.png" width=30% height=30%>




