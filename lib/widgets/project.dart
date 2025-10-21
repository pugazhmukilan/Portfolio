import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Project extends StatefulWidget {
  final String? image; // Optional image
  final String title;
  final String content;
  final List<String> tags;
  final bool imageOnRight;
  final String link;

  const Project({
    super.key,
    this.image, // Made optional
    required this.title,
    required this.content,
    required this.tags,
    this.imageOnRight = false,
    required this.link,
  });

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Get screen width for better responsiveness
  // Screen width not required here; layout is driven by constraints
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: _isHovered 
                  ? Colors.black.withOpacity(0.15) 
                  : Colors.grey.withOpacity(0.1),
              spreadRadius: _isHovered ? 4 : 2,
              blurRadius: _isHovered ? 16 : 8,
              offset: Offset(0, _isHovered ? 8 : 3),
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double maxH = constraints.maxHeight.isFinite ? constraints.maxHeight : 460.0;
            final bool isNarrow = constraints.maxWidth < 360;

            // Constants for layout
            final double pad = isNarrow ? 12 : 16;
            final double imgH = (maxH * 0.38).clamp(140.0, 190.0);
            final double titleFs = isNarrow ? 15 : 17;
            const double titleLH = 1.25;
            const int titleLines = 2;
            final double afterTitleSpace = isNarrow ? 8 : 10;
            final double descFs = isNarrow ? 12 : 13;
            const double descLH = 1.45;
            final double labelTop = isNarrow ? 10 : 14;
            final double labelBottom = isNarrow ? 6 : 8;
            const double buttonH = 44;

            return SizedBox.expand(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top image area
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: widget.image != null && widget.image!.isNotEmpty
                        ? Image.asset(
                            widget.image!,
                            width: double.infinity,
                            height: imgH,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return _buildGitHubFallback(imgH);
                            },
                          )
                        : _buildGitHubFallback(imgH),
                  ),

                  // Content area
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(pad),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            widget.title,
                            maxLines: titleLines,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: titleFs,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              height: titleLH,
                              letterSpacing: 0.2,
                            ),
                          ),

                          SizedBox(height: afterTitleSpace),

                          // Description flex area (adapts to available space)
                          Flexible(
                            flex: 2,
                            child: Text(
                              widget.content,
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: descFs,
                                height: descLH,
                                color: Colors.black.withOpacity(0.70),
                              ),
                            ),
                          ),

                          SizedBox(height: labelTop),

                          // Tech Stack Label
                          Text(
                            'Tech Stack',
                            style: TextStyle(
                              fontSize: isNarrow ? 11.5 : 12.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              letterSpacing: 0.3,
                            ),
                          ),

                          SizedBox(height: labelBottom),

                          // Tags flex area (shares space with description)
                          Flexible(
                            flex: 2,
                            child: SingleChildScrollView(
                              padding: EdgeInsets.zero,
                              child: Wrap(
                                spacing: isNarrow ? 6 : 8,
                                runSpacing: isNarrow ? 6 : 8,
                                children: widget.tags.map((tag) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isNarrow ? 8 : 10,
                                      vertical: isNarrow ? 4 : 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(color: Colors.grey.shade300, width: 1),
                                    ),
                                    child: Text(
                                      tag,
                                      style: TextStyle(
                                        fontSize: isNarrow ? 10 : 11,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height:20),
                          SizedBox(
                            width: double.infinity,
                            height: buttonH,
                            child: ElevatedButton.icon(
                              onPressed: () => _launchURL(widget.link),
                              icon: Image.asset(
                                'assets/icons/githubicon.png',
                                width: 18,
                                height: 18,
                                //color: Colors.white,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.code, size: 18, color: Colors.white);
                                },
                              ),
                              label: const Text(
                                'View on GitHub',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black87,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                padding: EdgeInsets.zero,
                                elevation: _isHovered ? 4 : 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // GitHub Logo Fallback Widget
  Widget _buildGitHubFallback(double height) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 241, 227, 248),
            Color.fromARGB(255, 245, 241, 227),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Image.asset(
          'assets/icons/github.png',
          width: height * 0.4,
          height: height * 0.4,
          color: Colors.black.withOpacity(0.6),
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.code,
              size: height * 0.4,
              color: Colors.black.withOpacity(0.6),
            );
          },
        ),
      ),
    );
  }

  /// Launch URL helper
  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
