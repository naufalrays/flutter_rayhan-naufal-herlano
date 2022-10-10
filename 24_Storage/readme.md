# (24) Storage

## Data Diri
Nomor Urut : 1_018FLC_0

Nama : Rayhan Naufal Herlano

## Summary 
### Penyimpanan Lokal
> Diperlukan untuk efisiensi penggunaan data internet. Ada beberapa cara implementasi penyimpanan lokal, contohnya seperti Shared Preferences, dan Local Database.

### Shared Preference
> Berfungsi untuk menyimpan data yang sederhana, penyimpanan dengan format key-value, menyimpan tipe data dasar seperti teks, angka dan boolean, dan biasa digunakan untuk menyimpan data login dan menyimpan riwayat pencarian.

### Implementasi Shared Preference
- Menambahkan shared preference pada fitur login
- STEP 1: Tambahkan package shared_preference

<img src="./Screenshot/step1.png" width=40% height=40%>

- STEP 2: Buat properti baru untuk TextEditingController dan tambahkan di setiap TextFormField

<img src="./Screenshot/step2.png" width=40% height=40%>

- STEP 3: Buat method dispose(), untuk menghindari kebocoran memori

<img src="./Screenshot/step3.png" width=40% height=40%>

- STEP 4: Buat variabel baru untuk menyimpan SharedPreference dan nilai bool newUser

<img src="./Screenshot/step4.png" width=40% height=40%>

- STEP 5: Buat method baru dengan nama checkLogin()

<img src="./Screenshot/step5.png" width=40% height=40%>

- STEP 6: Panggil method checkLogin() di method initState()

<img src="./Screenshot/step6.png" width=40% height=40%>

- STEP 7: Di dalam onPressed ElevatedButton, buat variabel baru username untuk menampung input dari user

<img src="./Screenshot/step7.png" width=40% height=40%>

- STEP 8: Buat setBool dan setString baru di dalam blok kode if, dan buat navigasi untuk ke halaman HomePage

<img src="./Screenshot/step8.png" width=40% height=40%>

- STEP 9: Buat file dart baru home_page.dart dan tambahkan UI nya

<img src="./Screenshot/step9.png" width=40% height=40%>

- STEP 10: (home_page.dart) Buat variabel baru untuk menyimpan SharedPreference dan usernam

- STEP 11: (home_page.dart) Buat method baru initial(), dan panggil di method initState()

<img src="./Screenshot/step10_11.png" width=40% height=40%>

- STEP 12: (home_page.dart) Mengganti text 'username' menjadi variabel username
- STEP 13: (home_page.dart) Tambahkan method setBool dan remove pada ElevatedButton

<img src="./Screenshot/step12_13.png" width=40% height=40%>

### Hasil Akhir :
- Ketika menekan login maka akan masuk ke home page dan menampilkan text username sesuai yang diinputkan di text form field

<img src="./Screenshot/hasil_akhir.png" width=40% height=40%>

### Aplikasi Task Management (Continue)
- TODO 28: Menambahkan login screen pada aplikasi Task Management, dan menambahkan shared_preference package, dan email_validator package

<img src="./Screenshot/todo28.png" width=40% height=40%>

- TODO 29: (main.dart) Mengganti home menjadi routes

<img src="./Screenshot/todo29.png" width=40% height=40%>

- TODO 30: (profile_sheet.dart) Menambahkan kode untuk shared preference di profile sheet

<img src="./Screenshot/todo30.png" width=40% height=40%>



### Local Database (SQLite)
> Berfungsi untuk menyimpan dan meminta data dalam jumlah besar pada local device, bersifat private, menggunakan SQLite database melalui package sqflite, dan SQLite merupakan database opem source yang mendukung Insert, Read, Update, Remove.

### Implementasi SQLite
- TODO 31: Menambahkan package sqflite dan path (pubspec.yaml), pastikan import packages nya di file dart yang ktia kerjakan

<img src="./Screenshot/todo31.png" width=40% height=40%>

- TODO 32: (task_model.dart) Membuat model/modifikasi model yang sudah ada, dan membuat fungsi toMap dan fromMap

<img src="./Screenshot/todo32.png" width=40% height=40%>

- TODO 33: Buat folder baru helper, dan di dalamnya buat file dart baru database_helper.dart

<img src="./Screenshot/todo33.png" width=40% height=40%>

- TODO 34: (database_helper.dart) Buat kelas baru DatabaseHelper dan tambahkan factory constructor

<img src="./Screenshot/todo34.png" width=40% height=40%>

- TODO 35: (database_helper.dart) Membuat objek database

<img src="./Screenshot/todo35.png" width=40% height=40%>

- TODO 36: (database_helper.dart) Membuka koneksi ke database dan membuat tabelnya

<img src="./Screenshot/todo36.png" width=40% height=40%>

- TODO 37: (database_helper.dart) Membuat method untuk menambahkan data ke tabel

<img src="./Screenshot/todo37.png" width=40% height=40%>

- TODO 38: (database_helper.dart) Membuat method untuk membaca data

<img src="./Screenshot/todo38.png" width=40% height=40%>

- TODO 39: (database_helper.dart) Membuat method untuk mengambil data dengan id

<img src="./Screenshot/todo39.png" width=40% height=40%>

- TODO 40: (database_helper.dart) Membuat method untuk memperbarui data

<img src="./Screenshot/todo40.png" width=40% height=40%>

- TODO 41: (database_helper.dart) Membuat method untuk menghapus data

<img src="./Screenshot/todo41.png" width=40% height=40%>

- TODO 42: Membuat file dart baru db_manager.dart

<img src="./Screenshot/todo42.png" width=40% height=40%>


- TODO 43: (db-manager.dart) Membuat Constructor untuk membuat instance kelas DatabaseHelper

<img src="./Screenshot/todo43.png" width=40% height=40%>

- TODO 44: (db_manager.dart) Membuat method _getAllTasks

<img src="./Screenshot/todo44.png" width=40% height=40%>

- TODO 45: (db_manager.dart) Membuat method addTask, getTaskById, updatetask, dan deleteTask

<img src="./Screenshot/todo45.png" width=40% height=40%>

- TODO 46: (main.dart) Mengganti providernya menjadi DbManager

<img src="./Screenshot/todo46.png" width=40% height=40%>

- TODO 47: (task_screen.dart) Mengganti Consumer yang ada di buildTaskScreen menjadi DbManager

<img src="./Screenshot/todo47.png" width=40% height=40%>

- TODO 48: (task_screen.dart) Mengganti kode yang ada di onPressed FloatingActionButton

<img src="./Screenshot/todo48.png" width=40% height=40%>

- TODO 49: (task_item_screen.dart) Menghapus properti onCreate dan membuat properti baru taskModel

<img src="./Screenshot/todo49.png" width=40% height=40%>

- TODO 50: (task_item_screen.dart) Menghapus properti _taskName, buat properti baru _isUpdate, dan ganti kode pada blok method initState()

<img src="./Screenshot/todo50.png" width=40% height=40%>

- TODO 51: (task_item_screen.dart) Mengganti kode yang ada di blok kode onPressed buildButton()

<img src="./Screenshot/todo51.png" width=40% height=40%>

- TODO 52: (task_list_screen.dart) Mengganti TaskManager menjadi DbManager

<img src="./Screenshot/todo52.png" width=40% height=40%>

- TODO 53: (task_list_screen.dart) Membungkus ListView.separated dengan Consumer<'DbManager'>(). dan pindahkan variabel taskItems di dalam builder Consumer

<img src="./Screenshot/todo53.png" width=40% height=40%>

- TODO 54: (task_list_screen.dart) Menghapus key yang ada di widget TaskItemCard, dan ganti index untuk deleteTask nya menggunakan item.id!

<img src="./Screenshot/todo54.png" width=40% height=40%>

- TODO 55: (task_list_screen.dart) Membungkus widget TaskItemCard dengan widget InkWell dan gunakan onTap dengan fungsi async. Di dalam blok fungsi nya tambahkan variabel selectedTask yang menampung item.id! dan tambahkan navigasi ke TaskItemScreen

<img src="./Screenshot/todo55.png" width=40% height=40%>

[Download](https://bit.ly/3J8dinV)









