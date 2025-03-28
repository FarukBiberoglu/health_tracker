part of 'injection.dart';

mixin FatsecretApiInjectionMixin {
  void fatsecretApiInjection(GetIt sl) {
    final fatsecretDio = Dio(
      BaseOptions(
        baseUrl: AppEnvironments.I.serverApiUrl,
        headers: {'Content-Type': 'application/json'},
        queryParameters: {},
      ),
    );

    sl
      ..registerLazySingleton(
        () => FatsecretRemoteDatasource(fatsecretDio: fatsecretDio),
      )
      ..registerLazySingleton(FatsecretApiRepo.new);
  }
}
