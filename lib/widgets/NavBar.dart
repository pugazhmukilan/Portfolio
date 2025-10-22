import 'package:flutter/material.dart';
import 'package:portfolio/constants/Colors.dart';
import 'package:portfolio/constants/ScreenConstraints.dart';
import 'package:portfolio/constants/Text_Styles.dart';

class NavBar extends StatefulWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onAboutMeTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const NavBar({
    super.key,
    required this.onHomeTap,
    required this.onAboutMeTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);

    if (isMobile) {
      // Mobile: Show hamburger menu
      return _buildMobileNav(context);
    } else {
      // Desktop/Tablet: Show full navigation
      return _buildDesktopNav(context);
    }
  }

  /// Desktop Navigation Bar
  Widget _buildDesktopNav(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.bg1,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColors.primary.withOpacity(0.5)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              NavButton(onPressed: widget.onHomeTap, text: 'Home'),
              NavButton(onPressed: widget.onAboutMeTap, text: 'About Me'),
              NavButton(onPressed: widget.onSkillsTap, text: 'Skills'),
              NavButton(onPressed: widget.onProjectsTap, text: 'Projects'),
              NavButton(onPressed: widget.onContactTap, text: 'Contact'),
            ],
          ),
        ),
      ),
    );
  }

  /// Mobile Navigation with Hamburger Icon
  Widget _buildMobileNav(BuildContext context) {
    return Stack(
      children: [
        // Hamburger icon on the left
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.bg1,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary.withOpacity(0.5)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.menu, color: AppColors.text, size: 24),
                onPressed: () => _showMobileMenu(context),
                tooltip: 'Menu',
                padding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
        // "Portfolio" text in the center
        Center(
          child: Text(
            'Portfolio',
            style: KjostRegular.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ),
        ),
      ],
    );
  }

  /// Show mobile drawer menu
  void _showMobileMenu(BuildContext context) {
    // Find the Scaffold and open the drawer
    Scaffold.of(context).openEndDrawer();
        
  }

}

/// Standalone drawer builder function for NavBar
Widget buildNavBarDrawer({
  required BuildContext context,
  required VoidCallback onHomeTap,
  required VoidCallback onAboutMeTap,
  required VoidCallback onSkillsTap,
  required VoidCallback onProjectsTap,
  required VoidCallback onContactTap,
}) {
  return Drawer(
    child: Container(
      color: AppColors.scaffoldbg,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.primary.withOpacity(0.5)),
              ),
            ),
            child: Center(
              child: Text(
                'Portfolio',
                style: KjostRegular.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text,
                ),
              ),
            ),
          ),
          _buildNavDrawerItem(
            context: context,
            icon: Icons.home,
            text: 'Home',
            onTap: () {
              Navigator.pop(context);
              onHomeTap();
            },
          ),
          _buildNavDrawerItem(
            context: context,
            icon: Icons.person,
            text: 'About Me',
            onTap: () {
              Navigator.pop(context);
              onAboutMeTap();
            },
          ),
          _buildNavDrawerItem(
            context: context,
            icon: Icons.stars,
            text: 'Skills',
            onTap: () {
              Navigator.pop(context);
              onSkillsTap();
            },
          ),
          _buildNavDrawerItem(
            context: context,
            icon: Icons.work,
            text: 'Projects',
            onTap: () {
              Navigator.pop(context);
              onProjectsTap();
            },
          ),
          _buildNavDrawerItem(
            context: context,
            icon: Icons.email,
            text: 'Contact',
            onTap: () {
              Navigator.pop(context);
              onContactTap();
            },
          ),
        ],
      ),
    ),
  );
}

/// Helper for drawer items
Widget _buildNavDrawerItem({
  required BuildContext context,
  required IconData icon,
  required String text,
  required VoidCallback onTap,
}) {
  return ListTile(
    leading: Icon(icon, color: AppColors.text),
    title: Text(
      text,
      style: KjostRegular.copyWith(
        fontSize: 16,
        color: AppColors.text,
      ),
    ),
    onTap: onTap,
  );
}

class NavButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const NavButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: onPressed,
        child: Text(
          text,
          style: KjostRegular.copyWith(fontSize: 18, color: AppColors.text),
        ),
      ),
    );
  }
}
