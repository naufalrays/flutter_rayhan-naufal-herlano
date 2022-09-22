import 'package:flutter/widgets.dart';

class MountViewPage extends StatelessWidget {
  const MountViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/mount_view.jpg'),
      fit: BoxFit.cover,
    );
  }
}
