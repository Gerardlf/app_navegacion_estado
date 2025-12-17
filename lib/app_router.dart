import 'package:app_navegacion_estado/screens/cart/cart.dart';
import 'package:app_navegacion_estado/screens/detail/detail.dart';
import 'package:app_navegacion_estado/screens/home/home.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: "home",
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: "/detail",
        name: "detail", //falta el producto
        builder: (context, state) => const DetailProduct(),
      ),
      GoRoute(
        path: "/cart",
        name: "cart",
        builder: (context, state) => const CartScreen(),
      ),
    ],
  );
}
