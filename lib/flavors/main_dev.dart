import '../app/app.dart';
import '../core/enums/environment_enum.dart';
import '../gen/assets.gen.dart';
import 'main.dart';

Future<void> main() async {
  await mainCommon(
    env: Environment.dev,
    envFilePath: Assets.env.aEnvDev,
    child: const App(),
  );
}
