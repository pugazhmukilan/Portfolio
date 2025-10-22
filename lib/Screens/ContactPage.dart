import 'package:flutter/material.dart';
import 'package:portfolio/constants/Colors.dart';
import 'package:portfolio/constants/Text_Styles.dart';
import 'package:portfolio/constants/ScreenConstraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendEmail() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Using FormSubmit.co - works immediately without any API keys!
      final response = await http.post(
        Uri.parse('https://formsubmit.co/ajax/pugazhmukilanoffical2004@gmail.com'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'name': _nameController.text,
          'email': _emailController.text,
          'message': _messageController.text,
          '_subject': 'New Contact Form Submission from Portfolio',
          '_captcha': 'false',
        }),
      );

      if (response.statusCode == 200) {
        if (mounted) {
          _showSnackBar('Message sent successfully! I will get back to you soon.', true);
          _nameController.clear();
          _emailController.clear();
          _messageController.clear();
        }
      } else {
        if (mounted) {
          print(response.body+" "+ response.statusCode.toString());
          _showSnackBar('Failed to send message. Please try again.', false);
        }
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar('Failed to send message: ${e.toString()}', false);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showSnackBar(String message, bool isSuccess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getValue(context, mobile: 16, tablet: 32, desktop: 64),
        vertical: Responsive.getValue(context, mobile: 20, tablet: 30, desktop: 40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Page Title
          Text(
            "Contact Me",
            style: AppTextStyles.KjosefinSansSemiBold.copyWith(
              fontSize: Responsive.getValue(
                context,
                mobile: 48,
                tablet: 100,
                desktop: 200,
              ),
              color: AppColors.text,
            ),
          ),

          SizedBox(height: Responsive.getValue(context, mobile: 20, tablet: 30, desktop: 40)),

          // Contact Form
          Container(
            constraints: BoxConstraints(
              maxWidth: Responsive.getValue(
                context,
                mobile: 350,
                tablet: 600,
                desktop: 700,
              ),
            ),
            padding: EdgeInsets.all(Responsive.getValue(context, mobile: 20, tablet: 24, desktop: 32)),
            decoration: BoxDecoration(
              color: AppColors.bg1,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.primary.withOpacity(0.3)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Name Field
                  Text(
                    'Name',
                    style: AppTextStyles.KjostMedium.copyWith(
                      fontSize: Responsive.getValue(context, mobile: 14, tablet: 16, desktop: 18),
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _nameController,
                    style: TextStyle(color: AppColors.text),
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      hintStyle: TextStyle(color: AppColors.textSecondary),
                      filled: true,
                      fillColor: AppColors.bg2,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.primary.withOpacity(0.3)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.primary.withOpacity(0.3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.primary, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: Responsive.getValue(context, mobile: 16, tablet: 20, desktop: 24)),

                  // Email Field
                  Text(
                    'Email',
                    style: AppTextStyles.KjostMedium.copyWith(
                      fontSize: Responsive.getValue(context, mobile: 14, tablet: 16, desktop: 18),
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: AppColors.text),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: AppColors.textSecondary),
                      filled: true,
                      fillColor: AppColors.bg2,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.primary.withOpacity(0.3)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.primary.withOpacity(0.3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.primary, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: Responsive.getValue(context, mobile: 16, tablet: 20, desktop: 24)),

                  // Message Field
                  Text(
                    'Message',
                    style: AppTextStyles.KjostMedium.copyWith(
                      fontSize: Responsive.getValue(context, mobile: 14, tablet: 16, desktop: 18),
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _messageController,
                    style: TextStyle(color: AppColors.text),
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: 'Enter your message',
                      hintStyle: TextStyle(color: AppColors.textSecondary),
                      filled: true,
                      fillColor: AppColors.bg2,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.primary.withOpacity(0.3)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.primary.withOpacity(0.3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.primary, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your message';
                      }
                      if (value.length < 10) {
                        return 'Message must be at least 10 characters';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: Responsive.getValue(context, mobile: 24, tablet: 28, desktop: 32)),

                  // Submit Button
                  SizedBox(
                    height: Responsive.getValue(context, mobile: 48, tablet: 52, desktop: 56),
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _sendEmail,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.text,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              'Send Message',
                              style: AppTextStyles.KjostBold.copyWith(
                                fontSize: Responsive.getValue(context, mobile: 16, tablet: 18, desktop: 20),
                              ),
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
  }
}
