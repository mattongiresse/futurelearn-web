import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context, isMobile),
            _buildHeroSection(context, isMobile),
            _buildServicesSection(context, isMobile),
            _buildWhyUsSection(context, isMobile),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  // ==================== HEADER ====================
  Widget _buildHeader(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 16,
      ),
      color: const Color.fromARGB(255, 1, 1, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo / Nom
          Flexible(
            child: Text(
              AppConstants.appName,
              style: AppTextStyles.h4.copyWith(
                color: Colors.white,
                fontSize: isMobile ? 16 : 20,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Menu Desktop
          if (!isMobile)
            Row(
              children: [
                _navItem(context, 'Accueil', '/'),
                const SizedBox(width: 28),
                _navItem(context, 'À propos', '/about'),
                const SizedBox(width: 28),
                _navItem(context, 'Services', '/services'),
                const SizedBox(width: 28),
                _navItem(context, 'Processus', '/process'),
                const SizedBox(width: 28),
                _navItem(context, 'Contact', '/contact'),
              ],
            )
          else
            // Bouton menu mobile (on le rendra fonctionnel plus tard)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu, color: Colors.white),
            ),
        ],
      ),
    );
  }

  Widget _navItem(BuildContext context, String title, String route) {
  return InkWell(
    onTap: () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).go(route);
    },
    child: Text(
      title,
      style: AppTextStyles.bodyMedium.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

  // ==================== HERO ====================
  Widget _buildHeroSection(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: isMobile ? 50 : 90,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.fromARGB(255, 223, 219, 12), AppColors.primaryLight],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstants.tagline,
            style: AppTextStyles.h1.copyWith(
              color: Colors.white,
              fontSize: isMobile ? 28 : 42,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Nous vous accompagnons dans toutes vos démarches d\'immigration\navec professionnalisme, transparence et efficacité.',
            style: AppTextStyles.bodyLarge.copyWith(
            color: Colors.white.withValues(alpha: 0.9),              fontSize: isMobile ? 16 : 18,
            ),
          ),
          const SizedBox(height: 36),
          ElevatedButton(
            onPressed: () {
              // Plus tard → /contact
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 28 : 40,
                vertical: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Demander une consultation',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== SERVICES ====================
  Widget _buildServicesSection(BuildContext context, bool isMobile) {
    final services = [
      {
        'icon': Icons.school_outlined,
        'title': 'Visa Étudiant',
        'description': 'Accompagnement complet pour vos études à l\'étranger.',
      },
      {
        'icon': Icons.work_outline,
        'title': 'Visa Travail',
        'description': 'Obtenez votre autorisation de travail en toute sérénité.',
      },
      {
        'icon': Icons.family_restroom_outlined,
        'title': 'Regroupement Familial',
        'description': 'Réunissez votre famille dans les meilleures conditions.',
      },
      {
        'icon': Icons.flight_takeoff_outlined,
        'title': 'Immigration Permanente',
        'description': 'Construisez votre avenir dans un nouveau pays.',
      },
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 50 : 80,
      ),
      color: AppColors.background,
      child: Column(
        children: [
          Text('Nos Services', style: AppTextStyles.h2.copyWith(fontSize: isMobile ? 26 : 32)),
          const SizedBox(height: 10),
          Text(
            'Des solutions adaptées à votre projet d\'immigration',
            style: AppTextStyles.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          // Grille responsive
          isMobile
              ? Column(
                  children: services
                      .map((s) => Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: _serviceCard(
                              icon: s['icon'] as IconData,
                              title: s['title'] as String,
                              description: s['description'] as String,
                            ),
                          ))
                      .toList(),
                )
              : Row(
                  children: services
                      .map((s) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: _serviceCard(
                                icon: s['icon'] as IconData,
                                title: s['title'] as String,
                                description: s['description'] as String,
                              ),
                            ),
                          ))
                      .toList(),
                ),
        ],
      ),
    );
  }

  Widget _serviceCard({
    required IconData icon,
    required String title,
    required String description,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: AppColors.primary),
          const SizedBox(height: 16),
          Text(title, style: AppTextStyles.h4),
          const SizedBox(height: 10),
          Text(description, style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }

  // ==================== POURQUOI NOUS ====================
  Widget _buildWhyUsSection(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 50 : 80,
      ),
      color: AppColors.surface,
      child: Column(
        children: [
          Text(
            'Pourquoi nous choisir ?',
            style: AppTextStyles.h2.copyWith(fontSize: isMobile ? 26 : 32),
          ),
          const SizedBox(height: 40),
          isMobile
              ? Column(
                  children: [
                    _whyUsItem(Icons.verified_outlined, 'Expertise reconnue', 'Une équipe expérimentée dans les procédures d\'immigration.'),
                    const SizedBox(height: 24),
                    _whyUsItem(Icons.support_agent_outlined, 'Accompagnement personnalisé', 'Un suivi individualisé à chaque étape de votre dossier.'),
                    const SizedBox(height: 24),
                    _whyUsItem(Icons.security_outlined, 'Transparence totale', 'Des informations claires et des tarifs sans surprise.'),
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: _whyUsItem(Icons.verified_outlined, 'Expertise reconnue', 'Une équipe expérimentée dans les procédures d\'immigration.')),
                    const SizedBox(width: 30),
                    Expanded(child: _whyUsItem(Icons.support_agent_outlined, 'Accompagnement personnalisé', 'Un suivi individualisé à chaque étape de votre dossier.')),
                    const SizedBox(width: 30),
                    Expanded(child: _whyUsItem(Icons.security_outlined, 'Transparence totale', 'Des informations claires et des tarifs sans surprise.')),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _whyUsItem(IconData icon, String title, String description) {
    return Column(
      children: [
        Icon(icon, size: 48, color: AppColors.primary),
        const SizedBox(height: 16),
        Text(title, style: AppTextStyles.h4, textAlign: TextAlign.center),
        const SizedBox(height: 10),
        Text(description, style: AppTextStyles.bodyMedium, textAlign: TextAlign.center),
      ],
    );
  }

  // ==================== FOOTER ====================
  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      color: const Color.fromARGB(255, 13, 134, 214),
      child: Column(
        children: [
          Text(
            AppConstants.appName,
            style: AppTextStyles.h4.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            AppConstants.tagline,
            style: AppTextStyles.bodyMedium.copyWith(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            '© ${DateTime.now().year} FUTURELEAN AND SERVICE. Tous droits réservés.',
            style: AppTextStyles.bodySmall.copyWith(color: Colors.white54),
          ),
        ],
      ),
    );
  }
}