import 'package:movie_app/res/widgets/constants.dart';

enum Flavor {
  dev(
    name: 'Development',
    entrypoint: 'lib/main_dev.dart',
    baseUrl: Constants.baseUrl,
  ),
  prod(
    name: 'Production',
    entrypoint: 'lib/main_prod.dart',
    baseUrl: 'empty',
  );

  final String name;
  final String entrypoint;
  final String baseUrl;

  const Flavor({
    required this.name,
    required this.entrypoint,
    required this.baseUrl,
  });
}
