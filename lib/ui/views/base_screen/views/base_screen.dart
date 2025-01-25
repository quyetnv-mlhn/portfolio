import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/enums/navigation_section_enum.dart';
import 'package:portfolio/ui/views/base_screen/widgets/custom_app_bar.dart';
import 'package:portfolio/ui/views/base_screen/view_models/navigation_view_model.dart';

class BaseScreen extends ConsumerWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSection = ref.watch(navigationStateProvider);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _buildScreen(selectedSection),
      ),
    );
  }

  Widget _buildScreen(NavigationSection section) {
    switch (section) {
      case NavigationSection.aboutMe:
        return const Center(child: Text('About Me Screen'));
      case NavigationSection.myBlogs:
        return const Center(child: Text('My Blogs Screen'));
      case NavigationSection.experiences:
        return const Center(child: Text('Experiences Screen'));
      case NavigationSection.lifetime:
        return const Center(child: Text('Lifetime Screen'));
      case NavigationSection.contact:
        return const Center(child: Text('Contact Screen'));
    }
  }
}
