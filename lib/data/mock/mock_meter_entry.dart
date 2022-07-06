import 'package:classified_app/data/models/mtr_entry_section.dart';

import '../models/meter_entry_model.dart';

class MockMeterEntry {
  MockMeterEntry._();
  static final List<MeterEntryModel> _meterEntry =
      List.generate(50, (int index) {
    return MeterEntryModel();
  });

  static List<MeterEntryModel> get meterEntry => _meterEntry;
  //static List<EntrySectionModel> get allEntries => _entriesSection;

}
