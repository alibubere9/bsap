import 'package:classified_app/data/models/mtr_entry_section.dart';

class MockEntrySection {
  MockEntrySection._();
  static final List<EntrySectionModel> _entriesSection = [
    EntrySectionModel(
        id: 1,
        iconId: 2,
        name: 'Bale',
        subName: "Packing Slip",
        color: "#B22222"),
    EntrySectionModel(
        id: 2,
        iconId: 3,
        name: 'Challan',
        subName: "Meter Entry",
        color: "#800080"),
    EntrySectionModel(
        id: 3,
        iconId: 6,
        name: 'Taka Actual',
        subName: "Meter Entry",
        color: "#FF0000"),
    EntrySectionModel(
        id: 4,
        iconId: 5,
        name: 'Goods Return',
        subName: "Meter Entry",
        color: "#C4A484"),
    EntrySectionModel(
        id: 5,
        iconId: 4,
        name: 'Gradation',
        subName: "Gradation Entry",
        color: "#B22222"),
  ];

  static List<EntrySectionModel> get entriesSection => _entriesSection;
  //static List<EntrySectionModel> get allEntries => _entriesSection;

}
