import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    final services = [
      {
        'icon': Icons.school_outlined,
        'title': 'Visa Étudiant',
        'description':
            'Nous vous accompagnons dans toutes les étapes : choix de l\'établissement, constitution du dossier, lettre de motivation, preuves financières et suivi jusqu\'à l\'obtention du visa.',
      },
      {
        'icon': Icons.work_outline,
        'title': 'Visa Travail / Passeport Talent',
        'description':
            'Accompagnement pour les offres d\'emploi, le contrat de travail, les autorisations et le dépôt du dossier auprès des autorités compétentes.',
      },
      {
        'icon': Icons.family_restroom_outlined,
        'title': 'Regroupement Familial',
        'description':
            'Aide complète pour réunir votre famille : constitution du dossier, documents requis, suivi administratif et conseils personnalisés.',
      },
      {
        'icon': Icons.flight_takeoff_outlined,
        'title': 'Immigration Permanente',
        'description':
            'Étude de votre profil, choix du programme adapté, préparation du dossier et accompagnement jusqu\'à la décision finale.',
      },
      {
        'icon': Icons.description_outlined,
        'title': 'Assistance Administrative',
        'description':
            'Aide à la rédaction de documents, vérification de dossiers, traduction et préparation aux entretiens.',
      },
      {
        'icon': Icons.support_agent_outlined,
        'title': 'Conseil & Orientation',
        'description':
            'Séance de conseil personnalisée pour évaluer votre projet et définir la meilleure stratégie d\'immigration.',
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
                    'Nos Services',
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
                    'Des solutions adaptées à votre projet',
                    style: AppTextStyles.h2,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Nous proposons un accompagnement complet et personnalisé pour chaque type de démarche d\'immigration.',
                    style: AppTextStyles.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  // Liste des services
                  ...services.map((s) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: _serviceCard(
                          icon: s['icon'] as IconData,
                          title: s['title'] as String,
                          description: s['description'] as String,
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

  Widget _serviceCard({
    required IconData icon,
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
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: AppColors.primary),
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