import 'package:auto_route/annotations.dart';
import 'package:flutter_clean_architecture_template/features/feedback_feature/presentation/pages/feedback_page.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute>[
        AutoRoute(page: MyHomePage, initial: true)
    ]
)
class $AppRouter {}