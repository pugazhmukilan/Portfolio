# 🚀 Portfolio Website

A modern, responsive portfolio website built with **Flutter Web** featuring a stunning dark theme, animated backgrounds, and an interactive contact form.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Web](https://img.shields.io/badge/Web-4285F4?style=for-the-badge&logo=googlechrome&logoColor=white)

## ✨ Features

- 🎨 **Professional Dark Theme** - Elegant dark color scheme with high contrast text
- 🌟 **Animated Background** - Beautiful Rive animations in corners with blur effects
- 📱 **Fully Responsive** - Optimized for mobile, tablet, and desktop screens
- 🎯 **Smooth Navigation** - Fixed navbar with smooth scrolling to sections
- 💼 **Project Showcase** - Grid layout displaying projects with hover effects
- 🛠️ **Skills Display** - Organized skill cards with technology icons
- 📧 **Contact Form** - Functional email form integrated with FormSubmit
- 🔗 **Social Media Links** - Floating action buttons for GitHub, LinkedIn, and LeetCode
- 📄 **Resume Download** - Dual resume options (ML Engineer & SDE) with preview

## 🎯 Sections

1. **Home** - Hero section with introduction and call-to-action
2. **About Me** - Personal introduction with profile image
3. **Skills** - Comprehensive technology stack showcase
4. **Projects** - Portfolio of AI/ML and development projects
5. **Contact** - Working contact form with email integration

## 🛠️ Tech Stack

- **Frontend Framework**: Flutter Web
- **Language**: Dart
- **Animations**: Rive
- **Icons & Images**: Custom assets
- **Email Service**: FormSubmit.co
- **Fonts**: Josefin Sans, Jost
- **Deployment**: Vercel (configured)

## 📦 Dependencies

```yaml
dependencies:
  dio: ^5.8.0+1
  flutter:
    sdk: flutter
  http: ^1.2.0
  marquee_list: ^1.0.0
  path_provider: ^2.1.5
  rive: ^0.13.13
  url_launcher: ^6.3.0
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.5.0 or higher)
- Dart SDK
- A code editor (VS Code, Android Studio, etc.)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/pugazhmukilan/Portfolio.git
   cd Portfolio
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the project**
   ```bash
   # For web
   flutter run -d chrome
   
   # For development with hot reload
   flutter run -d web-server --web-port 8080
   ```

### Build for Production

```bash
# Build for web
flutter build web --release

# The output will be in the build/web directory
```

## 📧 Contact Form Setup

The contact form uses FormSubmit.co for email delivery. On first use:

1. Submit a test message through the contact form
2. Check your email (`pugazhmukilanoffical2004@gmail.com`)
3. Click the confirmation link
4. All future messages will be delivered automatically

## 🎨 Color Scheme

The portfolio uses a carefully crafted dark theme:

- **Background**: `#0D1117`, `#161B22`
- **Primary Accent**: `#58A6FF` (GitHub blue)
- **Text**: `#E6EDF3` (high emphasis)
- **Secondary Text**: `#C9D1D9` (medium emphasis)
- **Tertiary Text**: `#8B949E` (low emphasis)

## 📁 Project Structure

```
lib/
├── main.dart                 # Entry point
├── ScollingPage.dart        # Main scrolling page with navigation
├── constants/
│   ├── Colors.dart          # Color definitions
│   ├── Text_Styles.dart     # Text style definitions
│   └── ScreenConstraints.dart # Responsive breakpoints
├── Screens/
│   ├── Home.dart            # Hero section
│   ├── AboutMe.dart         # About section
│   ├── SkillsPage.dart      # Skills section
│   ├── ProjectsPage.dart    # Projects section
│   └── ContactPage.dart     # Contact form
└── widgets/
    ├── Background_gradient.dart    # Animated background
    ├── NavBar.dart                 # Navigation bar
    ├── CheckResumeButton.dart      # Resume download button
    ├── floatingactionbutton.dart   # Social media links
    ├── project.dart                # Project card widget
    └── skills/
        └── skills.dart             # Skill card widget
```

## 🌟 Key Features Explained

### Responsive Design
The app adapts seamlessly across devices using custom responsive utilities:
- Mobile: < 600px
- Tablet: 600px - 1024px
- Desktop: > 1024px

### Animated Background
Uses Rive animations positioned at top-right and bottom-left corners with a blur effect, layered over a gradient background.

### Project Cards
Dynamic project cards with:
- Hover animations
- Tech stack badges
- GitHub integration
- Fallback GitHub icon for projects without images

### Contact Form
Validated form with:
- Name, email, and message fields
- Real-time validation
- Loading states
- Success/error notifications

## 📱 Deployment

The project is configured for Vercel deployment with `vercel.json`. Deploy with:

```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel
```

## 👤 Author

**Pugazh Mukilan**
- Email: pugazhmukilanoffical2004@gmail.com
- GitHub: [@pugazhmukilan](https://github.com/pugazhmukilan)
- LinkedIn: [Pugazh Mukilan](https://www.linkedin.com/in/pugazh-mukilan-922206251/)
- LeetCode: [pugazh2004](https://leetcode.com/u/pugazh2004/)

## 📄 License

This project is open source and available for personal and educational use.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/pugazhmukilan/Portfolio/issues).

## ⭐ Show your support

Give a ⭐️ if you like this project!

---

<div align="center">
  Made with ❤️ and Flutter
</div>
