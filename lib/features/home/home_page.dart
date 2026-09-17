import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ========== HEADER / NAVBAR ==========
            _buildHeader(context),

            // ========== HERO SECTION ==========
            _buildHeroSection(context),

            // ========== SERVICES SECTION ==========
            _buildServicesSection(context),

            // ========== FOOTER ==========
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  // ---------- HEADER ----------
  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      color: AppColors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo / Nom
          Text(
            AppConstants.appName,
            style: AppTextStyles.h4.copyWith(color: Colors.white),
          ),

          // Menu (version desktop simple pour l'instant)
          Row(
            children: [
              _navItem('Accueil'),
              const SizedBox(width: 24),
              _navItem('À propos'),
              const SizedBox(width: 24),
              _navItem('Services'),
              const SizedBox(width: 24),
              _navItem('Processus'),
              const SizedBox(width: 24),
              _navItem('Contact'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navItem(String title) {
    return Text(
      title,
      style: AppTextStyles.bodyMedium.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  // ---------- HERO SECTION ----------
  Widget _buildHeroSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      color: AppColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstants.tagline,
            style: AppTextStyles.h1.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 20),
          Text(
            'Nous vous accompagnons dans toutes vos démarches d\'immigration\navec professionnalisme, transparence et efficacité.',
            style: AppTextStyles.bodyLarge.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              // Plus tard → navigation vers /contact
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
            ),
            child: const Text('Demander une consultation'),
          ),
        ],
      ),
    );
  }

  // ---------- SERVICES SECTION ----------
  Widget _buildServicesSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      color: AppColors.background,
      child: Column(
        children: [
          Text(
            'Nos Services',
            style: AppTextStyles.h2,
          ),
          const SizedBox(height: 12),
          Text(
            'Des solutions adaptées à votre projet d\'immigration',
            style: AppTextStyles.bodyLarge,
          ),
          const SizedBox(height: 50),

          // Grille simple de 3 services (on améliorera plus tard)
          Row(
            children: [
              Expanded(child: _serviceCard(
                icon: Icons.school_outlined,
                title: 'Visa Étudiant',
                description: 'Accompagnement complet pour vos études à l\'étranger.',
              )),
              const SizedBox(width: 24),
              Expanded(child: _serviceCard(
                icon: Icons.work_outline,
                title: 'Visa Travail',
                description: 'Obtenez votre autorisation de travail en toute sérénité.',
              )),
              const SizedBox(width: 24),
              Expanded(child: _serviceCard(
                icon: Icons.family_restroom_outlined,
                title: 'Regroupement Familial',
                description: 'Réunissez votre famille dans les meilleures conditions.',
              )),
            ],
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
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 42, color: AppColors.primary),
          const SizedBox(height: 20),
          Text(title, style: AppTextStyles.h4),
          const SizedBox(height: 12),
          Text(description, style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }

  // ---------- FOOTER ----------
  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      color: AppColors.primary,
      child: Column(
        children: [
          Text(
            AppConstants.appName,
            style: AppTextStyles.h4.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 12),
          Text(
            AppConstants.tagline,
            style: AppTextStyles.bodyMedium.copyWith(color: Colors.white70),
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