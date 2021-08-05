import 'package:get_it/get_it.dart';
import 'package:mytest/domain/meme_controller.dart';
import 'package:mytest/repository/meme_repo.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<MemeRepo>(
          () => MemeRepo());
  locator.registerLazySingleton<MemeDomainController>(
      () => MemeDomainController());
}
