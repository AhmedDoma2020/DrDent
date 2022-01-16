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
    id: 1,
    title: 'all_followers',
    icon: 'assets/icons/group.png',
    isSelected: false,
  ),
  ItemOfShareModel(
    id: 2,
    title: 'Specializations_',
    icon: 'assets/icons/shareSpecializationsIcon.png',
    isSelected: false,
  ),
  ItemOfShareModel(
    id: 3,
    title: 'medical_companies',
    icon: 'assets/icons/shareMedicalCompanies.png',
    isSelected: false,
  ),
  ItemOfShareModel(
    id: 4,
    title: 'dental_labss',
    icon: 'assets/icons/shareDentalLab.png',
    isSelected: false,
  ),
  ItemOfShareModel(
    id: 5,
    title: 'Alumni_',
    icon: 'assets/icons/shareAlumni.png',
    isSelected: false,
  ),
  ItemOfShareModel(
    id: 6,
    title: 'medical_center',
    icon: 'assets/icons/shareMedicalCenter.png',
    isSelected: false,
  ),

];