import 'package:classified_app/data/models/meter_entry_model.dart';

abstract class IMeterEntryRepository {
  List<MeterEntryModel> meterEntryList();
  MeterEntryModel getMeterEntryByBarcodeNumber(String barcodeNumber);
}
