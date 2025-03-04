import 'package:github_discover/src/presentation/pages/home/home_page.dart';
import 'package:github_discover/src/presentation/pages/profile/add_skill/add_skill_page.dart';
import 'package:github_discover/src/presentation/pages/profile/profile/profile_screen.dart';
import 'package:github_discover/src/presentation/pages/repositories/details/repositories_details_screen.dart';
import 'package:github_discover/src/presentation/pages/repositories/search/repositories_search_screen.dart';
import 'package:github_discover/src/presentation/pages/users/details/users_details_screen.dart';
import 'package:github_discover/src/presentation/pages/users/search/users_search_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home,
  profile,
  addSkill,
  repositoryDetails,
  repositoriesSearch,  
  userDetails,
  usersSearch,  
}

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const HomePage(loading: false),
      routes: [
        GoRoute(
          path: 'profile',
          name: AppRoute.profile.name,
          builder: (context, state) => const ProfileScreen(),
          routes: [
            GoRoute(
              path: 'add-skill',
              name: AppRoute.addSkill.name,
              builder: (context, state) => const AddSkillPage(),
            ),
          ],
        ),
        GoRoute(
          path: 'repositories',
          name: AppRoute.repositoriesSearch.name,
          builder: (context, state) => const RepositoriesSearchScreen(),
          routes: [
            GoRoute(
              path: 'id',
              name: AppRoute.repositoryDetails.name,
              builder: (context, state) => const RepositoriesDetailsScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'users',
          name: AppRoute.usersSearch.name,
          builder: (context, state) => const UsersSearchScreen(),
          routes: [
            GoRoute(
              path: 'id',
              name: AppRoute.userDetails.name,
              builder: (context, state) => const UsersDetailScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
