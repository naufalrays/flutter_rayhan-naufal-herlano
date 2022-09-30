# (19) Dialog Bottom Sheet


## Data Diri
Nomor Urut : 1_018FLC_0

Nama : Rayhan Naufal Herlano

## Summary 
### Dialog & Bottom Sheet

### Aplikasi Task Management
>Menambahkan dan menghapus kegiatan

<img src="./Screenshot/taskmanagement.png" width=30% height=30%>

- TODO 1: Membuat model untuk informasi yang mau disimpan, buat folder models dan di dalamnya buat file dart baru task_model.dart

<img src="./Screenshot/taskmanagement_todo1.png" width=20% height=20%>

- TODO 2: Membuat Task Screen, buat folder screens di dalamnya buat file dart baru task_screen.dart

<img src="./Screenshot/taskmanagement_todo2.png" width=30% height=30%>

- TODO 3: Membuat Empty Screen, buat file dart baru empty_task_screen.dart di folder screens.

<img src="./Screenshot/taskmanagement_todo3.png" width=30% height=30%>

- TODO 4: Tambahkan package provider di pubspec.yaml

<img src="./Screenshot/taskmanagement_todo4.png" width=20% height=20%>

- TODO 5: Membuat Task Manager, buat file dart baru task_manager.dart di dalam folder models. Tambahkan method deleteTask dan addTask.

<img src="./Screenshot/taskmanagement_todo5.png" width=30% height=30%>

- TODO 6: (main.dart) menambahkan TaskManager sebagai provider.

<img src="./Screenshot/taskmanagement_todo6.png" width=30% height=30%>

- TODO 7: (task_screen.dart) membuat fungsi buildTaskScreen, akan me-return antara Task Screen yang ada datanya atau yang kosong dan panggil fungsi nya di body.

<img src="./Screenshot/taskmanagement_todo7.png" width=30% height=30%>

- TODO 8: Membuat Task Item Screen, buat file dart baru task_item_screen.dart di dalam folder screens dan tambahkan properti onCreate.

<img src="./Screenshot/taskmanagement_todo8.png" width=30% height=30%>

- TODO 9: (task_screen.dart) buat FloatingActionButton, untuk navigasi ke TaskItemScreen.

<img src="./Screenshot/taskmanagement_todo9.png" width=30% height=30%>

- TODO 10: (task_item_screen.dart) menambahkan state properti, initState, dan dispose.

<img src="./Screenshot/taskmanagement_todo10.png" width=30% height=30%>

- TODO 11: (task_item_screen.dart) membuat buildNameField dan panggil fungsinya di dalam ListView.

<img src="./Screenshot/taskmanagement_todo11.png" width=30% height=30%>

- TODO 12: (task_item_screen.dart) membuat buildButton dan panggil fungsinya di dalam Listview.

<img src="./Screenshot/taskmanagement_todo12.png" width=30% height=30%>

- TODO 13: Membuat Task Item Card, buat folder baru components lalu di dalamnya buat file dart baru task_item_card.dart.

<img src="./Screenshot/taskmanagement_todo13.png" width=30% height=30%>

- TODO 14: (task_item_screen.dart) menambahkan call back handler di ElevatedButton pada buildButton, dan menambahkan package uuid.

<img src="./Screenshot/taskmanagement_todo14.png" width=30% height=30%>

- TODO 15: Membuat Task List Screen, dalam folder screens buat file dart baru task_list_screen.dart dan tambahkan di buildTaskScreen (task_screen.dart).

<img src="./Screenshot/taskmanagement_todo15.png" width=30% height=30%>

- TODO 16: (task_list_screen.dart) menambahkan properti yang dibutuhkan pada TaskItemCard untuk melihat task yang sudah dibuat.

<img src="./Screenshot/taskmanagement_todo16.png" width=30% height=30%>

### AlertDialog
>Berfungsi untuk tampilan android, dari material design, meningformasikan pengguna tentang situasi tertentu, bisa digunakan untuk mendapatkan input dari user, dan membutuhkan helper method showDialog

<img src="./Screenshot/alertDialog.png" width=30% height=30%>

Cara membuat AlertDialog
- TODO 17: (task_item_card.dart) menambahkan Alert Dialog
- Memanggil fungsi showDialog di dalam fungsi onPressed pada IconButton
- showDialog membutuhkan context dan builder
- Di buildernya akan me-return AlertDialog

<img src="./Screenshot/taskmanagement_todo17.png" width=30% height=30%>

- AlertDialog menyediakan properti seperti content dan actions
- Content bisa dimasukkan widget text, gambar dan animasi gambar
- Actions bisa ditambahkan button untuk menerima respon dari user
- TODO 18: (task_item_card.dart) membuat properti onPressed

<img src="./Screenshot/taskmanagement_todo18.png" width=30% height=30%>

- TODO 19: (task_list_screen.dart) menambahkan fungsi onPressed pada TaskItemCard, pada body fungsinya tambahkan method deleteTask, Navigator.pop(context), dan ScaffoldMessenger

<img src="./Screenshot/taskmanagement_todo19.png" width=30% height=30%>

Hasil Akhir
- Ketika icon deletenya ditekan maka akan menampilkan alert dialog seperti gambar di samping ini.

### Bottom Sheet
>Seperti dialog tetapi muncul dari bawah layar aplikasi, menggunakan fungsi bawaan flutter showModalBottomSheet, dan membutuhkan dua properti, yaitu context dan builder

- TODO 20: (task_screen.dart) membuat Bottom Sheet

<img src="./Screenshot/taskmanagement_todo20.png" width=30% height=30%>

- TODO 21: buat file dart baru profile_sheet.dart di dalam folder components dan buat konten-kontennya

<img src="./Screenshot/taskmanagement_todo21.png" width=30% height=30%>

- TODO 22: (task_screen.dart) mengganti Container pada builder showModalBottomSheer menjadi ProfileSheet()

<img src="./Screenshot/taskmanagement_todo22.png" width=30% height=30%>
