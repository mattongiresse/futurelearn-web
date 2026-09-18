import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class ProcessPage extends StatelessWidget {
  const ProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    final steps = [
      {
        'number': '01',
        'title': 'Consultation initiale',
        'description':
            'Nous analysons votre situation, vos objectifs et déterminons ensemble le meilleur parcours d\'immigration.',
      },
      {
        'number': '02',
        'title': 'Étude de faisabilité',
        'description':
            'Nous évaluons vos chances de succès et vous présentons un plan clair avec les documents nécessaires et les délais.',
      },
      {
        'number': '03',
        'title': 'Constitution du dossier',
        'description':
            'Nous vous guidons dans la préparation de tous les documents et vérifions la conformité de votre dossier.',
      },
      {
        'number': '04',
        'title': 'Dépôt et suivi',
        'description':
            'Nous déposons le dossier auprès des autorités compétentes et assurons un suivi régulier jusqu\'à la décision.',
      },
      {
        'number': '05',
        'title': 'Décision & accompagnement final',
        'description':
            'Une fois la décision obtenue, nous vous accompagnons dans les dernières démarches (voyage, installation, etc.).',
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 16,
              ),
              color: AppColors.primary,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Notre Processus',
                    style: AppTextStyles.h4.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),

            // Intro
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 60,
                vertical: 40,
              ),
              child: Column(
                children: [
                  Text(
                    'Comment ça marche ?',
                    style: AppTextStyles.h2,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Un accompagnement clair et structuré en 5 étapes pour maximiser vos chances de succès.',
                    style: AppTextStyles.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),

                  // Étapes
                  ...steps.map((step) => Padding(
                        padding: const EdgeInsets.only(bottom: 28),
                        child: _stepCard(
                          number: step['number'] as String,
                          title: step['title'] as String,
                          description: step['description'] as String,
                          isMobile: isMobile,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stepCard({
    required String number,
    required String title,
    required String description,
    required bool isMobile,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                number,
                style: AppTextStyles.h4.copyWith(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.h4),
                const SizedBox(height: 8),
                Text(description, style: AppTextStyles.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}