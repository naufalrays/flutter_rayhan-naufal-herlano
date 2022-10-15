# (27) Finite State Machine & Unit Testing

## Data Diri
Nomor Urut : 1_018FLC_0

Nama : Rayhan Naufal Herlano

## Summary 
## Finite State Machine

### Finite State Machine
>Mesin yang memiliki sejumlah state, dan tiap state menunjukkan apa yang terjadi sebelumnya

Contoh

<img src="./Screenshot/3state.png" width=40% height=40%>

Terdapat 3 state yang menunjukkan kejadian dalam suatu proses.
- IDDLE saat tidak terjadi proses
- RUNNING saat proses sedang berjalan
- ERROR saat proses gagal diselesaikan

Contoh Sukses :
- IDDLE berubah menjadi RUNNING saat proses berjalan
- RUNNING kembali menjadi IDDLE saat proses selesai

Contoh gagal :
- IDDLE berubah menjadi RUNNING saat proses berjalan
- RUNNING menjadi ERROR saat terjadi kegagalan
- ERROR kembali menjadi IDDLE

### Implementasi pada View-Model

### Menambahkan Enum
Membuat enum untuk masing-masing state:
- none saat IDDLE
- loading saat RUNNING
- error saat ERROR

<img src="./Screenshot/enum.png" width=40% height=40%>


### Menambah Getter-Setter
Membuat getter-setter untuk menyimpan state dari widget

<img src="./Screenshot/getter_setter.png" width=40% height=40%>

### Gunakan State
Tiap proses yang perlu state tersebut, dapat memanfaatkannya

<img src="./Screenshot/use_state.png" width=40% height=40%>

### Implementasi pada Widget

### Perbedaan tampilan tiap state
Informasi finite state dapat berguna untuk menentukan seperti apa tampilan yang dimunculkan 

<img src="./Screenshot/different_state.png" width=40% height=40%>

Saat state menunjukkan RUNNING, maka ditampilkan progress indicator :

<img src="./Screenshot/output_loading.png" width=20% height=20%>


Saat state menunjukkan IDDLE, maka ditampilkan data yang didapatkan

<img src="./Screenshot/output_contact.png" width=20% height=20%>

Saat state menunjukkan ERROR, maka ditampilkan pesan yang menunjukkan bahwa proses tidak dapat diselesaikan

<img src="./Screenshot/output_error.png" width=20% height=20%>

## Unit Test

### Unit Test
>Salah satu jenis pengujian pada perangkat lunak, pengujian dilakukan pada unit dalam perangkat lunak, dan unit yang dimaksud umumnya adalah fungsi method

### Tujuan Unit Test
>Memastikan fungsi dapat mengola beberapa jenis input, memastikan hasil dari suatu fungsi atau method sudah sesuai, dan menjadi dokumentasi

### Bagaimana Melakukan Unit Test?
Manual :
Unit dijalankan dan dicek hasilnya secara manual

Automated :
Menulis script yang dapat dijalankan berkali-kali menggunakan test runner

### Menambahkan Dependencies
- Tambahkan test, pada bagian dev_dependencies dalam file pubspec.yaml
- Jalankan pada terminal perintah di bawah :
    
    > flutter pub get 

<img src="./Screenshot/test_on_dev_dependencies.png" width=30% height=30%>

### Membuat file Test
- Pada folder test, tambahkan folder baru model/api
- Dalam folder tersebut, tambahkan file baru contact_api_test.dart

### Menulis Test Script
- Import package test
- Membuat test case
- Menjalankan fungsi
- Cek hasil dengan expect

<img src="./Screenshot/write_test_script.png" width=40% height=40%>

### Menjalankan Test
Menggunakan perintah 
>flutter test

<img src="./Screenshot/running_test.png" width=40% height=40%>

### Mengelompokkan Test
- Beberapa test dengan subjek yang sama diletakkan dalam sebuah kelompok
- Dilakukan dengan menggunakan Group

<img src="./Screenshot/group_test.png" width=50% height=50%>

### Mocking
- Proses yang terikat dengan sistem eksternal dapat memengaruhi berjalannya pengujian
- Pengaruh tersebut dapat mengganggu proses pengujian
- Dilakukan mocking untuk menghindari masalah-masalah tersebut

### Cara kerja mocking
- Suatu object dibuat bentuk tiruannya
- Bentuk tiruan tersebut memiliki input dan output yang sama dengan yang asli
- Bentuk tiruan menghilangkan ketergantungan pada sistem eksternal

### Menambah Dependencies
- Tambahkan mockito dan build_runner, pada bagian dev_dependencies dalam file pubspec.yaml
- Jalankan flutter pub get pada terminal

<img src="./Screenshot/build_runner_and_mockito.png" width=20% height=20%>

### Melakukan Mocking
- Mengubah kode agar dapat dilakukan mocking

<img src="./Screenshot/do_mocking.png" width=60% height=60%>

Memasang annotation untuk membentuk mock

<img src="./Screenshot/annotation_to_make_mock.png" width=40% height=40%>


Membuat file mock dengan menjalankan perintah
>flutter pub run build_runner build

<img src="./Screenshot/create_file_mock.png" width=40% height=40%>

Menggunakan mock yang telah dibuat

<img src="./Screenshot/use_mock.png" width=50% height=50%>

### Menjalankan Test

Dengan mocking, test berjalan lebih cepat

<img src="./Screenshot/running_mocking.png" width=40% height=40%>
