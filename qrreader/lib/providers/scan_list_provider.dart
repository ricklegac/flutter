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
    if(this.tipoSeleccionado == nuevoScan.tipo){
      this.scans.add(nuevoScan);
      notifyListeners(); // se necesita redibujarse
    }
    
    
  }
  cargarScans()async{
      final scans = await DBProvider.db.getAllTipos();
      this.scans = [...scans];
      notifyListeners();
    }
    cargarScansPorTipo(String tipo)async {
      final scans = await DBProvider.db.getScansPorTipo(tipo);
      this.scans = [...scans];
      this.tipoSeleccionado = tipo;
      notifyListeners();
      
    }
    borrarTodos() async{
      await DBProvider.db.deleteAllScan();
      this.scans =[];
      notifyListeners();
    }
    borrarScanPorId(int id) async{
      await DBProvider.db.deleteScan(id);
      cargarScansPorTipo(this.tipoSeleccionado);

    }
}