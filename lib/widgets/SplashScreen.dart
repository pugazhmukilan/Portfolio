import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/Colors.dart';
import 'package:portfolio/constants/Text_Styles.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onLoadingComplete;

  const SplashScreen({super.key, required this.onLoadingComplete});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  double _loadingProgress = 0.0;
  String _loadingText = 'Initializing...';

  // List of all images to preload
  final List<String> _imagesToPreload = [
    'assets/images/aboutme.png',
    'assets/images/meImagesmall.png',
    'assets/images/portfolio.png',
    'assets/images/doitproject.png',
    'assets/images/dermiproject.png',
    'assets/images/virtualassistantproject.png',
    'assets/images/resumevarient.png',
    'assets/images/resumebutton.png',
    'assets/images/blank.png',
    'assets/images/fluxapp.png',
  ];

  @override
  void initState() {
    super.initState();

    // Main rotation animation
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    // Fade animation
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );

    // Scale animation
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    // Rotation animation for the circular progress
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Start fade in
    _fadeController.forward();

    // Start loading process
    _startLoading();
  }

  Future<void> _startLoading() async {
    // Simulate loading stages with image preloading
    await _updateProgress(0.2, 'Loading assets...');
    await _preloadImages();
    
    await _updateProgress(0.5, 'Preparing components...');
    await Future.delayed(const Duration(milliseconds: 500));
    
    await _updateProgress(0.75, 'Almost there...');
    await Future.delayed(const Duration(milliseconds: 500));
    
    await _updateProgress(1.0, 'Ready!');
    await Future.delayed(const Duration(milliseconds: 500));

    // Fade out and complete
    await Future.delayed(const Duration(milliseconds: 300));
    widget.onLoadingComplete();
  }

  Future<void> _updateProgress(double progress, String text) async {
    setState(() {
      _loadingProgress = progress;
      _loadingText = text;
    });
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> _preloadImages() async {
    for (int i = 0; i < _imagesToPreload.length; i++) {
      try {
        await precacheImage(AssetImage(_imagesToPreload[i]), context);
        setState(() {
          _loadingProgress = 0.2 + (0.3 * (i + 1) / _imagesToPreload.length);
        });
      } catch (e) {
        // Continue even if an image fails to load
        print('Failed to load ${_imagesToPreload[i]}: $e');
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldbg,
      body:  Container(
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.scaffoldbg,
              AppColors.bg1,
              AppColors.bg2,
            ],
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated logo/initial
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: AnimatedBuilder(
                    animation: _rotationAnimation,
                    builder: (context, child) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          // Outer rotating circle
                          Transform.rotate(
                            angle: _rotationAnimation.value * 2 * 3.14159,
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primary.withOpacity(0.3),
                                  width: 2,
                                ),
                              ),
                              child: CustomPaint(
                                painter: CircularProgressPainter(
                                  progress: _loadingProgress,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                          // Inner content
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.bg1,
                              border: Border.all(
                                color: AppColors.primary.withOpacity(0.5),
                                width: 3,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.3),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'PM',
                                style: AppTextStyles.KjosefinSansSemiBold.copyWith(
                                  fontSize: 40,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                const SizedBox(height: 50),

                // Loading text
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    _loadingText,
                    key: ValueKey<String>(_loadingText),
                    style: AppTextStyles.KjostMedium.copyWith(
                      fontSize: 18,
                      color: AppColors.text,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Progress bar
                Container(
                  width: 250,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.bg2,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 250 * _loadingProgress,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary,
                          AppColors.primary.withOpacity(0.6),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.5),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Percentage text
                Text(
                  '${(_loadingProgress * 100).toInt()}%',
                  style: AppTextStyles.KjostRegular.copyWith(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 80),

                // Animated dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        final delay = index * 0.3;
                        final value = (_controller.value + delay) % 1.0;
                        final opacity = (0.3 + (0.7 * (1 - (value * 2 - 1).abs()))).clamp(0.3, 1.0);
                        
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary.withOpacity(opacity),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(opacity * 0.5),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Custom painter for circular progress
class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color color;

  CircularProgressPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14159 / 2, // Start from top
      2 * 3.14159 * progress,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
