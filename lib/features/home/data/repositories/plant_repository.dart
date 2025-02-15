import 'dart:io';
import 'package:genaiproject/features/home/domain/entities/plant_info.dart';

abstract class PlantRepository {
  Future<PlantInfo> identifyPlant(File image);
}
