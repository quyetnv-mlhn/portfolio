import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/ui/views/home/models/profile_model.dart';
import 'package:portfolio/ui/views/home/models/project_model.dart';
import 'package:portfolio/ui/views/home/models/banner_model.dart';

final homeViewModelProvider = Provider((ref) => HomeViewModel());

class HomeViewModel {
  final profile = const ProfileModel(
    name: 'Quyết',
    role: 'Junior Flutter Developer',
    motto: 'Code for simplicity, deliver with quality',
    avatarUrl: 'assets/images/avatar.png',
    mainSkills: [
      'Flutter & Dart',
      'Vim/VSCode',
      'Riverpod',
      'WebRTC',
      'Odoo',
    ],
    about:
        'A passionate developer focused on creating efficient and user-friendly applications.',
    hobbies: ['English Podcasts', 'Programming', 'Reading'],
  );

  final projects = [
    const ProjectModel(
      title: 'Magic Password',
      description:
          'A secure password manager with multi-language support and dark mode.',
      technologies: ['Flutter', 'Riverpod', 'SQLite'],
      imageUrl: 'assets/images/magic_password.png',
      githubUrl: 'https://github.com/yourusername/magic_password',
    ),
    const ProjectModel(
      title: 'WebRTC App',
      description:
          'Real-time communication application with video calling features.',
      technologies: ['Flutter', 'WebRTC', 'Firebase'],
      imageUrl: 'assets/images/webrtc_app.png',
      githubUrl: 'https://github.com/yourusername/webrtc_app',
    ),
  ];

  final services = [
    'Cross-platform Flutter Development',
    'UI/UX Design',
    'Application Performance Optimization',
  ];

  final banners = [
    const BannerModel(
      imageUrl: 'assets/images/banner1.png',
      title: "Hi! I'm Son",
      subtitle: "a 'Front-end engineer'",
    ),
    // Add more banners as needed
  ];

  final socialLinks = [
    {'icon': 'facebook', 'url': 'https://facebook.com/username'},
    {'icon': 'instagram', 'url': 'https://instagram.com/username'},
    {'icon': 'github', 'url': 'https://github.com/username'},
    {'icon': 'linkedin', 'url': 'https://linkedin.com/in/username'},
  ];
}
