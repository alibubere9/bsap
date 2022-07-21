import 'package:classified_app/data/models/bale_model.dart';

class MockBale {
  static final List<BaleModel> _bales = [
    BaleModel.fromMap({
      "id": 1,
      "bale_no": 123456789,
      "party": "Talha Shaikh",
      "item": "item name",
      "desgin": "Design",
      "pcs": 4
    }),
    BaleModel.fromMap({
      "id": 1,
      "bale_no": 123456789,
      "party": "Talha Shaikh",
      "item": "item name",
      "desgin": "Design",
      "pcs": 8
    }),
    BaleModel.fromMap({
      "id": 1,
      "bale_no": 123456789,
      "party": "Talha Shaikh",
      "item": "item name",
      "desgin": "Design",
      "pcs": 13
    }),
  ];

  MockBale._();
  static List<BaleModel> get bales => _bales;
}
