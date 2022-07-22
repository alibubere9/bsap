import 'package:classified_app/data/models/meter_entry_model.dart';

abstract class IBaleMeterEntryRepository {
  List<MeterEntryModel> baleMeterEntryList();
  MeterEntryModel getBaleMeterEntryByBarcodeNumber(String barcodeNumber);
}
