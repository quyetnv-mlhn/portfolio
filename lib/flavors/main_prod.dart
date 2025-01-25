import '../app/app.dart';
import '../core/enums/environment_enum.dart';
import '../gen/assets.gen.dart';
import 'main.dart';

Future<void> main() async {
  await mainCommon(
    env: Environment.prod,
    envFilePath: Assets.env.aEnvProd,
    child: const App(),
  );
}
