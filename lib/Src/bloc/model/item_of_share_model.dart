import 'package:flutter/material.dart';


class ItemOfShareModel {
  ItemOfShareModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.isSelected,
  });

  late final int id;
  late final String title;
  late final String icon;
  late  bool isSelected;
}

List<ItemOfShareModel> shareItemsDoctorListModel = [
  ItemOfShareModel(
    id: 0,
    title: 'all_followers',
    icon: 'assets/icons/group.png',
    isSelected: false,
  ),
  ItemOfShareModel(
    id: 3,
    title: 'doctors_',
    icon: 'assets/icons/shareSpecializationsIcon.png',
    isSelected: false,
  ),
  ItemOfShareModel(
    id: 5,
    title: 'medical_companies',
    icon: 'assets/icons/shareMedicalCompanies.png',
    isSelected: false,
  ),
  ItemOfShareModel(
    id: 6,
    title: 'dental_labs',
    icon: 'assets/icons/shareDentalLab.png',
    isSelected: false,
  ),
  ItemOfShareModel(
    id: 7,
    title: 'Alumni_',
    icon: 'assets/icons/shareAlumni.png',
    isSelected: false,
  ),
  ItemOfShareModel(
    id: 4,
    title: 'medical_center',
    icon: 'assets/icons/shareMedicalCenter.png',
    isSelected: false,
  ),
];