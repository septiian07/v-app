import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:tactical_app/di/injection.config.dart';

/// Global [GetIt] service locator instance.
final getIt = GetIt.instance;

/// Initializes all injectable dependencies.
///
/// Call this in `main()` before `runApp()`.
/// After running `build_runner`, the generated `injection.config.dart`
/// will wire up all `@injectable` / `@lazySingleton` annotated classes.
@InjectableInit(preferRelativeImports: false)
void configureDependencies() => getIt.init();
