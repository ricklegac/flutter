
import 'package:qrreader/pages/pages.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/scan_list_provider.dart';
import 'package:qrreader/providers/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
         ChangeNotifierProvider(create: (_) => ScanListProvider()), // cualquier widget que este dentro del proyecto 
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home':( _ ) =>  const HomePage(),
          'mapas': ( _ ) => const MapaPage(),
        },
        
        theme: ThemeData(
          primaryColor: Colors.green,
          primarySwatch: Colors.green,
          floatingActionButtonTheme:const  FloatingActionButtonThemeData(
            backgroundColor: Colors.green,
            
          )
    
        ) , 
      ),
    );
  }
}