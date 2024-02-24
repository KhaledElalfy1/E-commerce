import 'package:ecommerce/features/home/presentation/view/widgets/app_bar_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            AppBarSection(
              cardOnTap: () {},
              notificationOnTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
