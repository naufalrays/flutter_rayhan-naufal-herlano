# (18) Form Picker


## Data Diri
Nomor Urut : 1_018FLC_0

Nama : Rayhan Naufal Herlano

## Summary 
### Interactive Widgets
```
Interaksi antara aplikasi dan user
Mengumpulkan input dan feedback dari user
```

Menambahkan Layout

Layout untuk menyusun interactive widget

<img src="./Screenshot/interactive_widget.png" width=40% height=40%>

## Date Picker
Date Picker
>Merupakan widget dimana user bisa memasukkan tanggal, tanggal yang biasa digunakan berupa tanggal kelahiran, waktu pemesanan tiket, waktu reservasi restoran, jadwal meeting, dll.

Cara membuat Date Picker
```
- Menggunakan fungsi bawaan flutter showDatePicker
- Fungsi showDatePicker memiliki tipe data future
- Menampilkan dialog material design date picker
```

Cara menggunakan Date Picker
- Menambahkan packages intl di pubspec.yaml
- Mempersiapkan variabel

<img src="./Screenshot/datePicker_variabel.png" width=50% height=50%>

- Membangun UI

<img src="./Screenshot/makeUI_datepicker.png" width=50% height=50%>

- Menambahkan fungsi show Date Picker di dalam onPressed

<img src="./Screenshot/datepicker_onPressed.png" width=50% height=50%>

- Memanggil fungsi setState di dalam onPressed

<img src="./Screenshot/setState_datepicker.png" width=30% height=30%>

Hasil Akhir

- Saat select button ditekan akan menuncul dialog date picker
- Tanggal yang ada di UI akan berubah sesuai dengan tanggal yang dipilih

<img src="./Screenshot/hasilakhir_datepicker.png" width=20% height=20%>

## Color Picker
Color Picker
>Merupakan widget dimana user bisa memilih color, dan penggunaan color picker bisa digunakan untuk berbagai macam kondisi.

Cara membuat Color Picker
- Menggunakan packages flutter_colorpicker
- Menambahkan packages flutter_colorpicker di pubspec.yaml
- Mempersiapkan variabel

<img src="./Screenshot/colorPicker_variabel.png" width=50% height=50%>

- Membangun UI

<img src="./Screenshot/makeUI_Colorpicker.png" width=50% height=50%>

- Menambahkan fungsi showDialog di dalam onPressed dengan return widget AlertDialog

<img src="./Screenshot/showDialog.png" width=30% height=30%>

- Import packages flutter_colorpicker dalam file dart
- Membuat kode untuk penggunaan packages flutter_colorpicker

<img src="./Screenshot/code_flutterColor.png" width=30% height=30%>

Hasil Akhir
- Packages flutter_colorpicker memiliki custom widget yang dapat digunakan seperti BlockPicker, ColorPicker, dan SlidePicker

<img src="./Screenshot/hasilakhir_colorpicker.png" width=50% height=50%>

## File Picker
>Merupakan kemampuan widget untuk mengakses storage, memilih dan membuka file

Cara membuat File Picker
- Menggunakan packags file_picker dan open_file
- Menambahkan packages file_picker dan open_file di pubspec.yaml
- Import packages file_picker dan open_file dalam file dart
- Membangun UI

<img src="./Screenshot/makeUI_Filepicker.png" width=50% height=50%>

- Membuat fungsi untuk mengexplore dan memilih files dari storage

<img src="./Screenshot/function_choosefile.png" width=40% height=40%>

- Memanggil fungsi _pickFile di dalam onPressed

<img src="./Screenshot/_pickfile.png" width=30% height=30%>

- Membuat fungsi untuk membuka files yang telah dipilih

<img src="./Screenshot/function_openfile.png" width=40% height=40%>

- Mengambil file dari object result dan memanggil fungsi _openFile di dalam fnugsi _pickfile

<img src="./Screenshot/_openfile.png" width=40% height=40%>

Hasil Akhir
- Ketika button ditekan maka akan membuka storage device dan file yang dipilih akan terbuka

<img src="./Screenshot/hasilakhir_filepicker.png" width=50% height=50%>





