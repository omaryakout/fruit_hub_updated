import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/firebase_auth.dart';
import 'package:fruits_hub/core/services/firestore.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo_imp.dart';
import 'package:fruits_hub/features/auth/domain/repos/product_repo.dart';
import 'package:fruits_hub/features/auth/domain/repos/product_repo_impl.dart';
import 'package:get_it/get_it.dart';

// GetIt getIt = GetIt.instance;

// void setupGetIt() {
//   getIt.registerSingleton<FireBaseAuthService>(FireBaseAuthService());
//   getIt.registerSingleton<AuthRepo>(
//     AuthRepoImpl(fireBaseAuthService: getIt<FireBaseAuthService>()),
//   );
// }
final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FireBaseAuthService>(FireBaseAuthService());
  getIt.registerSingleton<DataBaseService>(FireStoreDataBase());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      fireBaseAuthService: getIt<FireBaseAuthService>(),
      dataBaseService: getIt<DataBaseService>(),
    ),
  );
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(
      dataBaseService: getIt<DataBaseService>(),
    ),
  );
}
