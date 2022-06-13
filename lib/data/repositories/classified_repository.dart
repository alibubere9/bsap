import 'dart:convert';

import 'package:classified_app/data/mock/mock_classifieds.dart';
import 'package:classified_app/data/models/classified.dart';
import 'package:classified_app/data/repositories/interfaces/i_classified_repository.dart';
import 'package:classified_app/network/advance_http_handler/execution_handler.dart';
import 'package:classified_app/services/interfaces/i_location_service.dart';
import 'package:geolocator/geolocator.dart';

class ClassifiedRepository implements IClassifiedRepository {
  final ExecutionHandler _handler;
  final ILocationService _locationService;

  ClassifiedRepository(
    this._handler,
    this._locationService,
  );
  Future<List<ClassifiedModel>> get allClassifieds async {
    return MockClassifieds.all; //*MOCK
  }

  Future<ClassifiedModel> getClassifieldById(int id) async {
    // return MockClassifieds.getbyId(id); //*MOCK
    Position position = await _currentLocation();
    String response = await _handler.getClassifiedsById(id, position.latitude, position.longitude);
    ClassifiedModel _classified = _convertToModel(response).first;
    return _classified;
    
  }

  Future<Position> _currentLocation() async {
    Position position = await _locationService.getLocation();
    return position;
  }

  Future<List<ClassifiedModel>> getByCategory(int? categoryId) async {
    // return MockClassifieds.all; //*MOCK
    Position position = await _currentLocation();
    String response = await _handler.getClassifiedsBySubCategoryId(categoryId!,position.latitude, position.longitude);
    List<ClassifiedModel> _classifieds = _convertToModel(response);
    return _classifieds;
  }
  Future<List<ClassifiedModel>> getByName(String name) async {
    // return MockClassifieds.all
    //       .where((element) => element.name!.contains(name))
    //       .toList();//*MOCK
    Position position = await _currentLocation();
    String response = await _handler.getClassifiedByName(name,position.latitude, position.longitude);
    List<ClassifiedModel> _classifieds = _convertToModel(response);
    return _classifieds;
  }

  List<ClassifiedModel> _convertToModel(String response) {
    List plain = jsonDecode(response);
    List<ClassifiedModel> _classifieds = [];
    plain.forEach((element) {
      _classifieds.add(ClassifiedModel.fromMap(element));
     });
    return _classifieds;
  }
}
