import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:classified_app/data/models/review.dart';

class ClassifiedModel extends Equatable {
  final int? id;
  final String? description;
  final String? specialistIn;
  final double? distance;
  final String? name;
  final String? location;
  final double? rating;
  final int? totalRatings;
  final double? latitude;
  final double? longitude;
  final String? address;
  final String? imageTile;
  final List<String>? images;
  final String? whatsAppNumber;
  final String? availability;
  final String? contactNo;
  final List<String?>? categories;
  final List<ReviewModel>? reviews;
  const ClassifiedModel(
      {this.id,
      this.distance,
      this.name,
      this.location,
      this.rating,
      this.totalRatings,
      this.latitude,
      this.longitude,
      this.address,
      this.images,
      this.whatsAppNumber,
      this.imageTile,
      this.availability,
      this.contactNo,
      this.categories,
      this.reviews,
      this.description,
      this.specialistIn});

  ClassifiedModel copyWith({
    int? id,
    String? name,
    String? location,
    double? distance,
    double? rating,
    int? totalRatings,
    double? latitude,
    double? longitude,
    String? address,
    String? imageTile,
    List<String>? images,
    List<String>? videos,
    String? availability,
    String? whatsAppNumber,
    String? contactNo,
    List<String>? categories,
    String? specialistIn,
    List<ReviewModel>? reviews,
  }) {
    return ClassifiedModel(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      rating: rating ?? this.rating,
      totalRatings: totalRatings ?? this.totalRatings,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      images: images ?? this.images,
      availability: availability ?? this.availability,
      imageTile: imageTile ?? this.imageTile,
      contactNo: contactNo ?? this.contactNo,
      whatsAppNumber: whatsAppNumber ?? this.whatsAppNumber,
      categories: categories ?? this.categories,
      reviews: reviews ?? this.reviews,
      description: description ?? this.description,
      specialistIn: specialistIn ?? this.specialistIn,
      distance: distance ?? this.distance,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'Description': description,
      'SpecialistIn': specialistIn,
      'Distance': distance,
      'Name': name,
      'ImageTile': imageTile,
      'Location': location,
      'Rating': rating,
      'TotalRatings': totalRatings,
      'Latitude': latitude,
      'Longitude': longitude,
      'Address1': address,
      'Images': images,
      'WhatsAppNumber': whatsAppNumber,
      'Availability': availability,
      'ContactNo': contactNo,
      'Categories': categories,
      'Reviews': reviews?.map((x) => x.toMap()).toList(),
    };
  }

  factory ClassifiedModel.fromMap(Map<String, dynamic> map) {
    return ClassifiedModel(
      id: map['Id'],
      name: map['Name'],
      distance: map['Distance'],
      description: map['Description'],
      location: map['Location'],
      rating: map['Rating'],
      totalRatings: map['TotalRatings'],
      latitude: map['Latitude'],
      longitude: map['Longitude'],
      imageTile: map['ImageTile'],
      address: map['Address1'],
      images: List<String>.from(map['Images']),
      availability: map['Availability'],
      whatsAppNumber: map['WhatsAppNumber'],
      contactNo: map['ContactNo'],
      categories: List<String>.from(map['Categories']),
      specialistIn: map['SpecialistIn'],
      reviews: List<ReviewModel>.from(
          map['Reviews']?.map((x) => ReviewModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassifiedModel.fromJson(String source) =>
      ClassifiedModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        description,
        specialistIn,
        name,
        location,
        imageTile,
        rating,
        totalRatings,
        latitude,
        longitude,
        address,
        images,
        whatsAppNumber,
        distance,
        availability,
        contactNo,
        categories,
        reviews,
      ];
}
