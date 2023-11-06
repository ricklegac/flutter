import 'package:qrreader/models/scan_model.dart';
import 'package:qrreader/providers/db_provider.dart';
import 'package:qrreader/providers/ui_provider.dart';

class ScanListProvider extends ChangeNotifier{

  List<SearchResponse> scans = [];
  String tipoSeleccionado ='http';
  nuevoScan(String valor)async {

    final nuevoScan = new SearchResponse(valor: valor);
    final id = await  DBProvider.db.nuevoScan(nuevoScan);
    //asignar el ID de la base de datos al modelo
    nuevoScan.id = id;

    this.scans.add(nuevoScan);
    notifyListeners(); // se necesita redibujarse
  }
}