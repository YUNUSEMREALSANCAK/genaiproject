import 'package:flutter/material.dart';
import 'package:genaiproject/core/constants/app_colors.dart';
import 'package:genaiproject/core/constants/app_texts.dart';
import 'package:genaiproject/features/my_plants/presentation/widgets/plant_card.dart';
import 'package:genaiproject/features/my_plants/presentation/widgets/plant_tab.dart';
import 'package:genaiproject/features/my_plants/presentation/pages/add_plant_page.dart';

class MyPlantsPage extends StatelessWidget {
  const MyPlantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          AppTexts.myPlantsTitle,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          const SizedBox(height: 16),
          _buildTabs(),
          const SizedBox(height: 8),
          _buildPlantsList(),
        ],
      ),
      floatingActionButton: _buildAddButton(context),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.searchBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.textSecondary),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: AppTexts.searchPlants,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          PlantTab(text: AppTexts.planted, isSelected: true),
          SizedBox(width: 24),
          PlantTab(text: AppTexts.harvested, isSelected: false),
        ],
      ),
    );
  }

  Widget _buildPlantsList() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          PlantCard(
            name: AppTexts.chili,
            isHealthy: true,
            timeLeft: AppTexts.monthsUntilHarvest,
            backgroundColor: AppColors.success,
          ),
          PlantCard(
            name: AppTexts.chili,
            isHealthy: false,
            timeLeft: AppTexts.monthsUntilHarvest,
            backgroundColor: AppColors.error,
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddPlantPage()),
      ),
      backgroundColor: AppColors.primary,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(Icons.add),
    );
  }
}
