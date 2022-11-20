import 'package:bmi_calculator/screens/bmi_calculator/widgets/shared/card_label.dart';
import 'package:bmi_calculator/styles/app_colors.dart';
import 'package:bmi_calculator/styles/app_decorations.dart';
import 'package:bmi_calculator/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AgeCard extends StatefulWidget {
  const AgeCard({super.key});

  @override
  State<AgeCard> createState() => _AgeCardState();
}

int _currentAge = 25;

class _AgeCardState extends State<AgeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 12.0,
      ),
      child: Container(
        decoration: AppDecorations.card(),
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(
          children: [
            const CardLabel(labelText: 'Age'),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIconButton(
                    icon: Icons.remove,
                    callback: () {},
                  ),
                  _buildAge(),
                  _buildIconButton(
                    icon: Icons.add,
                    callback: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback callback,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.purple,
        shape: const CircleBorder(),
      ),
      onPressed: callback,
      child: Icon(icon),
    );
  }

  Widget _buildAge() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: Text(
        _currentAge.toString(),
        style: AppTextStyles.cardTitleMedium,
      ),
    );
  }
}
