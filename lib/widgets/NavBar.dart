import 'package:flutter/material.dart';
import 'package:portfolio/constants/Text_Styles.dart';
import 'package:portfolio/constants/ScreenConstraints.dart';

class NavBar extends StatefulWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onAboutMeTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;

  const NavBar({
    super.key,
    required this.onHomeTap,
    required this.onAboutMeTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
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
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 241, 227, 248),
              const Color.fromARGB(255, 245, 241, 227)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(50),
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
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 241, 227, 248),
                    const Color.fromARGB(255, 245, 241, 227)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.menu, color: Colors.black87, size: 24),
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
              color: Colors.black87,
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
}) {
  return Drawer(
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 241, 227, 248),
            const Color.fromARGB(255, 245, 241, 227)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 241, 227, 248).withOpacity(0.8),
                  const Color.fromARGB(255, 245, 241, 227).withOpacity(0.8)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Text(
                'Portfolio',
                style: KjostRegular.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
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
    leading: Icon(icon, color: Colors.black87),
    title: Text(
      text,
      style: KjostRegular.copyWith(
        fontSize: 16,
        color: Colors.black87,
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
          style: KjostRegular.copyWith(fontSize: 18),
        ),
      ),
    );
  }
}
