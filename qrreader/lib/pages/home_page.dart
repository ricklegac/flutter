import 'package:qrreader/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.green,
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const  Icon(Icons.delete_forever),
            ),
            
        ],

      ),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanBottom(),
    );
  }
}