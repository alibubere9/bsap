import 'package:classified_app/data/models/mtr_entry_section.dart';

import '../models/meter_entry_model.dart';

class MockMeterEntry {
  static final List<MeterEntryModel> _meterEntry = [
    MeterEntryModel(
        barCode: "725272730706",
        meter: "23",
        numberOfTP: "33",
        remark: "",
        takhaNo: "22",
        weight: "43 kgs"),
    MeterEntryModel(
        barCode: "1234567890128",
        meter: "34",
        numberOfTP: "44",
        remark: "",
        takhaNo: "33",
        weight: "54 kgs"),
    MeterEntryModel(
        barCode: "036000291452",
        meter: "45",
        numberOfTP: "55",
        remark: "",
        takhaNo: "44",
        weight: "54 kgs"),
    MeterEntryModel(
        barCode: "09501101530003",
        meter: "56",
        numberOfTP: "66",
        remark: "",
        takhaNo: "55",
        weight: "65 kgs")
  ];

  static List<MeterEntryModel> get meterEntry => _meterEntry;
  //static List<EntrySectionModel> get allEntries => _entriesSection;

}
