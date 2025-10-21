import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/constants/Text_Styles.dart';

class CheckResumeButton extends StatefulWidget {
  const CheckResumeButton({super.key});

  @override
  State<CheckResumeButton> createState() => _CheckResumeButtonState();
}

class _CheckResumeButtonState extends State<CheckResumeButton> {
  // Resume URLs
  static const String ML_RESUME_ID = "1cpBPgKfhKQA-TGCUf08Ai_YyzUxblPQQ";
  static const String SDE_RESUME_ID = "1QKsglt1AD-ZRFsJ61X-xSVeww58X6GlX";
  
  bool _isHovered = false;
  
  @override
  Widget build(BuildContext context) {
  
     return GestureDetector(
      onTap: () {
        _showResumeOptionsDialog(context);
      },
      child: MouseRegion(
        onEnter: (_) => _updateHoverState(true),
        onExit: (_) => _updateHoverState(false),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 10),
          switchInCurve: Curves.bounceIn,
          switchOutCurve: Curves.bounceInOut,
          child: _isHovered
              ? Image.asset(
                  'assets/images/resumevarient.png',
                  key: ValueKey('hover'),
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  'assets/images/resumebutton.png',
                  key: ValueKey('default'),
                  fit: BoxFit.fill,
                ),
        ),
      ),
    );
  }
  void _updateHoverState(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  // Show dialog with resume options
  void _showResumeOptionsDialog(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isVerySmall = screenWidth < 400;
    
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: isMobile ? screenWidth * 0.95 : 700,
              maxHeight: MediaQuery.of(context).size.height * 0.85,
            ),
            margin: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFAF9F8),
                  Color(0xFFF0EFF4),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(isVerySmall ? 16 : 24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 30,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isVerySmall ? 16 : 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header with gradient
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isVerySmall ? 16 : 24,
                      vertical: isVerySmall ? 16 : (isMobile ? 20 : 24),
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 241, 227, 248),
                          Color.fromARGB(255, 245, 241, 227),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Select Resume',
                                style: AppTextStyles.KjostBold.copyWith(
                                  fontSize: isVerySmall ? 18 : (isMobile ? 20 : 28),
                                  color: Colors.black87,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Choose the resume that fits your needs',
                                style: AppTextStyles.KjostRegular.copyWith(
                                  fontSize: isVerySmall ? 10 : (isMobile ? 11 : 14),
                                  color: Colors.black54,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.close_rounded, color: Colors.black87),
                            iconSize: isMobile ? 20 : 24,
                            onPressed: () => Navigator.pop(context),
                            tooltip: 'Close',
                            padding: EdgeInsets.all(isMobile ? 8 : 12),
                            constraints: BoxConstraints(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Content
                  Flexible(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(isVerySmall ? 12 : (isMobile ? 16 : 24)),
                      child: Column(
                        children: [
                          _buildResumeCard(
                            context,
                            title: 'Machine Learning Engineer',
                            description: 'Specialized in AI/ML, Deep Learning, and Data Science roles',
                            icon: Icons.psychology_rounded,
                            fileId: ML_RESUME_ID,
                            isVerySmall: isVerySmall,
                            isMobile: isMobile,
                          ),
                          SizedBox(height: isVerySmall ? 12 : (isMobile ? 16 : 20)),
                          _buildResumeCard(
                            context,
                            title: 'Software Development Engineer',
                            description: 'Full-stack development, system design, and backend engineering',
                            icon: Icons.code_rounded,
                            fileId: SDE_RESUME_ID,
                            isVerySmall: isVerySmall,
                            isMobile: isMobile,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Build resume card widget
  Widget _buildResumeCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required String fileId,
    required bool isVerySmall,
    required bool isMobile,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isVerySmall ? 16 : 20),
        border: Border.all(color: Colors.black.withOpacity(0.1), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(isVerySmall ? 12 : (isMobile ? 16 : 24)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(isVerySmall ? 8 : (isMobile ? 10 : 14)),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: Colors.white, size: isVerySmall ? 20 : (isMobile ? 24 : 32)),
                ),
                SizedBox(width: isVerySmall ? 8 : 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.KjostBold.copyWith(
                          fontSize: isVerySmall ? 13 : (isMobile ? 15 : 18),
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: isVerySmall ? 4 : 6),
                      Text(
                        description,
                        style: AppTextStyles.KjostRegular.copyWith(
                          fontSize: isVerySmall ? 10 : (isMobile ? 11 : 14),
                          color: Colors.black54,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          Divider(height: 1, color: Colors.black.withOpacity(0.1)),
          
          // Action Buttons
          Padding(
            padding: EdgeInsets.all(isVerySmall ? 12 : (isMobile ? 16 : 24)),
            child: Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    context,
                    label: 'Preview',
                    icon: Icons.visibility_rounded,
                    onPressed: () => _previewResume(fileId),
                    isPrimary: false,
                    isVerySmall: isVerySmall,
                    isMobile: isMobile,
                  ),
                ),
                SizedBox(width: isVerySmall ? 8 : 10),
                Expanded(
                  child: _buildActionButton(
                    context,
                    label: 'Download',
                    icon: Icons.download_rounded,
                    onPressed: () => _downloadResume(fileId),
                    isPrimary: true,
                    isVerySmall: isVerySmall,
                    isMobile: isMobile,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build action button
  Widget _buildActionButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
    required bool isPrimary,
    required bool isVerySmall,
    required bool isMobile,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isPrimary ? Colors.black87 : Colors.white,
        borderRadius: BorderRadius.circular(isVerySmall ? 10 : 12),
        border: Border.all(
          color: Colors.black87,
          width: 2,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(isVerySmall ? 10 : 12),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: isVerySmall ? 8 : (isMobile ? 10 : 14),
              horizontal: isVerySmall ? 10 : (isMobile ? 12 : 16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: isVerySmall ? 14 : (isMobile ? 16 : 20),
                  color: isPrimary ? Colors.white : Colors.black87,
                ),
                SizedBox(width: isVerySmall ? 4 : (isMobile ? 6 : 8)),
                Flexible(
                  child: Text(
                    label,
                    style: AppTextStyles.KjostMedium.copyWith(
                      fontSize: isVerySmall ? 11 : (isMobile ? 13 : 15),
                      color: isPrimary ? Colors.white : Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Preview resume in new tab
  void _previewResume(String fileId) async {
    final url = 'https://drive.google.com/file/d/$fileId/view';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      _showErrorSnackBar('Could not open preview');
    }
  }

  // Download resume
  void _downloadResume(String fileId) async {
    final url = 'https://drive.google.com/uc?export=download&id=$fileId';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      _showErrorSnackBar('Could not download resume');
    }
  }

  // Show error message
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }

}