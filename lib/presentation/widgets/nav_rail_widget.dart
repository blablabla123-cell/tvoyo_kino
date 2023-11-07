import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvoyo_kino/domain/cubits/main_screen_cubit.dart';
import 'package:tvoyo_kino/presentation/resources/application_colors.dart';
import 'package:tvoyo_kino/presentation/resources/application_images.dart';
import 'package:tvoyo_kino/presentation/resources/application_strings.dart';

class NavRailWidget extends StatelessWidget {
  const NavRailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MainScreenCubit model = context.read<MainScreenCubit>();

    return NavigationRail(
      onDestinationSelected: (int value) {
        model.onNavRailIDestSelected(value);
      },
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.search_outlined),
          label: Text(Strings.navRailDestSearch),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.home_outlined),
          label: Text(Strings.navRailDestHome),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.movie_outlined),
          label: Text(Strings.navRailDestMovies),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.tv_outlined),
          label: Text(Strings.navRailDestTV),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.favorite_outline),
          label: Text(Strings.navRailDestFavorites),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person_outline),
          label: Text(Strings.navRailDestProfile),
        ),
      ],
      selectedIndex: 1,
      useIndicator: false,
      leading: Column(
        children: [
          IconButton(
            onPressed: () => model.onLogoTapped(),
            icon: Image.asset(Images.logo),
          ),
          const SizedBox(height: 110),
        ],
      ),
      trailing: Column(
        children: [
          const SizedBox(height: 60),
          IconButton(
            onPressed: () => model.onNavRailArrowUpwardTapped(),
            icon: const Icon(Icons.arrow_upward, size: 56),
            color: ApplicationColors.navRailDestIconColor,
          ),
        ],
      ),
    );
  }
}
