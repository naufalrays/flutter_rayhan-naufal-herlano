import 'package:flutter/material.dart';
import 'package:notula_notes/pages/auth/auth_view_model.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Pengaturan Umum',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Mode Gelap'),
                Switch(
                  value: false,
                  onChanged: (value) {},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Ukuran Teks Default'),
                    Text(
                      '16sp',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Aktifkan Tautan / Telepon'),
                Switch(
                  value: false,
                  onChanged: (value) {},
                )
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            const Text(
              'Data Catatan',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Ukuran Teks Default'),
                    Text(
                      '16sp',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            const Text(
              'Tentang',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text('Tentang Aplikasi'),
            const SizedBox(
              height: 12,
            ),
            const Text('Lisensi Sumber Terbuka'),
            const SizedBox(
              height: 12,
            ),
            const Text('Kirim Tanggapan'),
            ElevatedButton(
                onPressed: () {
                  Provider.of<AuthViewModel>(context, listen: false).logout();
                },
                child: const Text('Log out'))
          ],
        ),
      ),
    );
  }
}
