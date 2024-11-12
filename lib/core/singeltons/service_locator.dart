import 'package:get_it/get_it.dart';
import 'package:volleyball_training/core/singeltons/storage/storage.dart';

final serviceLocator = GetIt.instance;

final serviceLocatorAudioHandler = GetIt.asNewInstance();


Future<void> setupLocator() async {
  await StorageRepository.getInstance();

}
