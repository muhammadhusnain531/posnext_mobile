import 'package:blue_thermal_printer/blue_thermal_printer.dart';

class BluetoothPrintService {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  // Connect to a paired printer
  Future<void> connectToPrinter() async {
    List<BluetoothDevice> devices = await bluetooth.getBondedDevices();
    if (devices.isNotEmpty) {
      BluetoothDevice printer = devices.first; // Connect to the first device found (or use selection logic)
      await bluetooth.connect(printer);
    }
  }

  // Print a bill (as a string)
  Future<void> printBill(Map<String, dynamic> transaction) async {
    if (await bluetooth.isConnected) {
      bluetooth.printCustom('Bill No: ${transaction['billNo']}', 2, 1);
      bluetooth.printCustom('Date: ${transaction['date']}', 1, 0);
      bluetooth.printNewLine();

      for (var item in transaction['items']) {
        bluetooth.printCustom('${item['name']} x${item['quantity']}   PKR ${item['price'].toStringAsFixed(2)}', 1, 0);
      }

      bluetooth.printNewLine();
      bluetooth.printCustom('Total: PKR ${transaction['total'].toStringAsFixed(2)}', 2, 1);
      bluetooth.printNewLine();
      bluetooth.printNewLine();
      bluetooth.paperCut(); // Optional, depending on your printer

      bluetooth.disconnect(); // Disconnect after printing
    }
  }
}
