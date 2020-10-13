import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_news/common/router/auth_guard.dart';
import 'package:flutter_news/pages/application/application.dart';
import 'package:flutter_news/pages/details/details.dart';
import 'package:flutter_news/pages/index/index.dart';
import 'package:flutter_news/pages/sign_in/sign_in.dart';
import 'package:flutter_news/pages/sign_up/sign_up.dart';
import 'package:flutter_news/pages/welcome/welcome.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $AppRouter {
  @initial
  IndexPage indexPageRoute;

  WelcomePage welcomePageRoute;

  SignInPage signInPageRoute;

  SignUpPage signUpPageRoute;

  @GuardedBy([AuthGuard])
  ApplicationPage applicationPageRoute;

  @GuardedBy([AuthGuard])
  DetailsPage detailsPageRoute;
}
