import 'package:portfolio/app/app.dart';
import 'package:portfolio/core/enums/environment_enum.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/flavors/main.dart';

Future<void> main() async {
  await mainCommon(
    env: Environment.prod,
    envFilePath: Assets.env.aEnvProd,
    child: const App(),
  );
}
