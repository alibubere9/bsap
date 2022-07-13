import 'package:classified_app/data/models/mtr_entry_section.dart';
import 'package:classified_app/utils/hex_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MockEntrySection {
  MockEntrySection._();
  static final List<EntrySectionModel> _entriesSection = [
    EntrySectionModel(
        id: 1,
        iconId: Icon(FontAwesomeIcons.shirtsinbulk,
            size: 73, color: ColorExtensions.fromHex("#C4A484")),
        name: 'Bale',
        subName: "Packing Slip",
        color: "#C4A484"),
    EntrySectionModel(
        id: 2,
        iconId: Icon(FontAwesomeIcons.receipt,
            size: 73, color: ColorExtensions.fromHex("#C4A484")),
        name: 'Challan',
        subName: "Meter Entry",
        color: "#C4A484"),
    EntrySectionModel(
        id: 3,
        iconId: Icon(FontAwesomeIcons.ankh,
            size: 73, color: ColorExtensions.fromHex("#C4A484")),
        name: 'Taka Actual',
        subName: "Meter Entry",
        color: "#C4A484"),
    EntrySectionModel(
        id: 4,
        iconId: Icon(FontAwesomeIcons.boxOpen,
            size: 73, color: ColorExtensions.fromHex("#C4A484")),
        name: 'Goods Return',
        subName: "Meter Entry",
        color: "#C4A484"),
    EntrySectionModel(
        id: 5,
        iconId: Icon(FontAwesomeIcons.pencilRuler,
            size: 73, color: ColorExtensions.fromHex("#C4A484")),
        name: 'Gradation',
        subName: "Gradation Entry",
        color: "#C4A484"),
  ];

  static List<EntrySectionModel> get entriesSection => _entriesSection;
  //static List<EntrySectionModel> get allEntries => _entriesSection;

}
