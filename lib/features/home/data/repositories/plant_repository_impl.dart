import 'dart:io';
import 'package:genaiproject/features/home/data/datasources/openai_service.dart';
import 'package:genaiproject/features/home/domain/entities/plant_info.dart';
import 'package:genaiproject/features/home/data/repositories/plant_repository.dart';

class PlantRepositoryImpl implements PlantRepository {
  final OpenAIService openAIService;

  PlantRepositoryImpl(this.openAIService);

  @override
  Future<PlantInfo> identifyPlant(File image) async {
    try {
      final response = await openAIService.analyzePlantImage(image);

      // OpenAI yanıtını parse et
      final lines = response.split('\n');
      String commonName = '';
      String scientificName = '';
      String species = '';
      String careInstructions = '';

      for (var line in lines) {
        if (line.contains('1)')) commonName = line.split('1)')[1].trim();
        if (line.contains('2)')) scientificName = line.split('2)')[1].trim();
        if (line.contains('3)')) species = line.split('3)')[1].trim();
        if (line.contains('4)')) careInstructions = line.split('4)')[1].trim();
      }

      return PlantInfo(
        commonName: commonName,
        scientificName: scientificName,
        species: species,
        careInstructions: careInstructions,
      );
    } catch (e) {
      throw Exception('Failed to identify plant: $e');
    }
  }
}
