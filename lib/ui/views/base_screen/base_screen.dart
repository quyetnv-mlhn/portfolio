// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:portfolio/core/configs/app_sizes.dart';
// import 'package:portfolio/core/enums/navigation_section_enum.dart';
// import 'package:portfolio/ui/shared/widgets/responsive_container.dart';
// import 'package:portfolio/ui/views/base_screen/view_models/navigation_view_model.dart';
// import 'package:portfolio/ui/views/base_screen/widgets/custom_app_bar.dart';
// import 'package:portfolio/ui/shared/widgets/responsive_builder.dart';
// import 'package:portfolio/ui/views/base_screen/widgets/side_info_section.dart';
//
// class BaseScreen extends ConsumerWidget {
//   const BaseScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedSection = ref.watch(navigationStateProvider);
//
//     return Scaffold(
//         appBar: const CustomAppBar(),
//         body: Center(
//           child: Text('Welcome to My Portfolioasijdaosj aosdj '),
//         )
//         // ResponsiveBuilder(
//         //   builder: (context, constraints, screenType) {
//         //     return Row(
//         //       children: [
//         //         if (screenType != ScreenType.mobile) const SideInfoSection(),
//         //         Expanded(
//         //           child: ResponsiveContainer(
//         //             child: AnimatedSwitcher(
//         //               duration: const Duration(milliseconds: 300),
//         //               child: _buildContent(context, screenType, selectedSection),
//         //             ),
//         //           ),
//         //         ),
//         //       ],
//         //     );
//         //   },
//         // ),
//         // endDrawer: const MobileDrawer(),
//         );
//   }
//
//   Widget _buildContent(
//     BuildContext context,
//     ScreenType screenType,
//     NavigationSection selectedSection,
//   ) {
//     // Handle home section separately
//     if (selectedSection == NavigationSection.home) {
//       return _buildHomeContent(context, screenType);
//     }
//
//     switch (screenType) {
//       case ScreenType.mobile:
//         return _buildMobileContent(context, selectedSection);
//       case ScreenType.tablet:
//         return _buildTabletContent(context, selectedSection);
//       case ScreenType.desktop:
//       case ScreenType.desktopLarge:
//         return _buildDesktopContent(context, selectedSection);
//     }
//   }
//
//   Widget _buildHomeContent(BuildContext context, ScreenType screenType) {
//     return const Center(
//       child: Text('Welcome to My Portfolio'),
//     );
//   }
//
//   Widget _buildMobileContent(BuildContext context, NavigationSection section) {
//     return const SingleChildScrollView(
//       padding: EdgeInsets.all(spacingM),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Mobile specific layout
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTabletContent(BuildContext context, NavigationSection section) {
//     return const SingleChildScrollView(
//       padding: EdgeInsets.all(spacingL),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Tablet specific layout
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDesktopContent(BuildContext context, NavigationSection section) {
//     return const SingleChildScrollView(
//       padding: EdgeInsets.all(spacingXL),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Desktop specific layout
//         ],
//       ),
//     );
//   }
// }
