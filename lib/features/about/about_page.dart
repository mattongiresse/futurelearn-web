import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

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
                    'À propos de nous',
                    style: AppTextStyles.h4.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),

            // Hero
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 60,
                vertical: isMobile ? 40 : 70,
              ),
              color: AppColors.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FUTURELEAN AND SERVICE',
                    style: AppTextStyles.h1.copyWith(
                      color: Colors.white,
                      fontSize: isMobile ? 26 : 36,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Votre partenaire de confiance pour l\'immigration',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),

            // Contenu
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 60,
                vertical: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Qui sommes-nous ?', style: AppTextStyles.h2),
                  const SizedBox(height: 16),
                  Text(
                    'FUTURELEAN AND SERVICE est une agence d\'immigration dédiée à accompagner les personnes dans la réalisation de leurs projets d\'études, de travail ou d\'installation à l\'étranger.\n\n'
                    'Nous mettons un point d\'honneur à offrir un service transparent, professionnel et personnalisé. Chaque dossier est traité avec rigueur et un suivi attentif.',
                    style: AppTextStyles.bodyLarge,
                  ),
                  const SizedBox(height: 40),

                  Text('Notre mission', style: AppTextStyles.h2),
                  const SizedBox(height: 16),
                  Text(
                    'Faciliter les démarches d\'immigration en apportant expertise, clarté et accompagnement humain à chaque étape du parcours.',
                    style: AppTextStyles.bodyLarge,
                  ),
                  const SizedBox(height: 40),

                  Text('Nos valeurs', style: AppTextStyles.h2),
                  const SizedBox(height: 24),

                  _valueItem(Icons.verified, 'Professionnalisme',
                      'Une expertise solide et un travail soigné sur chaque dossier.'),
                  const SizedBox(height: 20),
                  _valueItem(Icons.visibility, 'Transparence',
                      'Des informations claires et des tarifs sans surprise.'),
                  const SizedBox(height: 20),
                  _valueItem(Icons.favorite, 'Accompagnement humain',
                      'Un suivi personnalisé et une écoute attentive de vos besoins.'),
                  const SizedBox(height: 20),
                  _valueItem(Icons.trending_up, 'Engagement',
                      'Nous nous investissons pleinement pour la réussite de votre projet.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _valueItem(IconData icon, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primary, size: 28),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.h4),
              const SizedBox(height: 4),
              Text(description, style: AppTextStyles.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}