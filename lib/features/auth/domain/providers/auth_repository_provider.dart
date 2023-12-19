


import 'package:hospital_riverpod/features/auth/data/datasource/authentication_remote_data_source.dart';
import 'package:hospital_riverpod/features/auth/data/repositories/auth_repo_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hospital_riverpod/shared/domain/providers/dio_network_service_provider.dart';

import '../../../../../shared/data/remote/network_service.dart';
import '../repositories/authentication_repository.dart';

final authDataSourceProvider = Provider.family<AuthUserDataSource, NetworkService>((_, networkService) => AuthUserRemoteDataSource(networkService),);

final authRepositoryProvider = Provider<AuthenticationRepository>((ref) {
  final NetworkService networkService = ref.watch(networkServiceProvider);
  final AuthUserDataSource dataSource = ref.watch(authDataSourceProvider(networkService));
  return AdminAuthenticationRepositoryImpl(dataSource);
},
);