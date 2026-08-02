// ---------------------------------[Loader - 1]------------------------------------------------------------------------------------------------------------
import 'package:flutter/material.dart';

class AppLoader extends StatefulWidget {
  const AppLoader({super.key});

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(
        begin: 0.85,
        end: 1.1,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut)),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Icon(Icons.school_rounded, color: Colors.white, size: 30),
      ),
    );
  }
}

// ---------------------------------[Loader - 2]------------------------------------------------------------------------------------------------------------

// import 'package:flutter/material.dart';

// class AppLoader extends StatefulWidget {
//   const AppLoader({super.key});

//   @override
//   State<AppLoader> createState() => _AppLoaderState();
// }

// class _AppLoaderState extends State<AppLoader>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController controller;

//   @override
//   void initState() {
//     super.initState();

//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     )..repeat(reverse: true);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: controller,
//       builder: (_, __) {
//         return Row(
//           mainAxisSize: MainAxisSize.min,
//           children: List.generate(
//             3,
//             (index) => Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 4),
//               child: Transform.translate(
//                 offset: Offset(0, -8 * controller.value * (index + 1) / 3),
//                 child: const CircleAvatar(radius: 5),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }

// ---------------------------------[Loader - 3]------------------------------------------------------------------------------------------------------------
// import 'dart:ui';

// import 'package:flutter/material.dart';

// class AppLoader extends StatelessWidget {
//   const AppLoader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(22),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white.withValues(alpha: .15),
//               borderRadius: BorderRadius.circular(22),
//             ),
//             child: const Center(
//               child: CircularProgressIndicator(strokeWidth: 3),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
