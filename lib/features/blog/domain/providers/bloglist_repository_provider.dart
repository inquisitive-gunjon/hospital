
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hospital_riverpod/features/blog/data/datasource/blog_remote_data_source.dart';
import 'package:hospital_riverpod/features/blog/data/repositories/blog_repo_implementation.dart';
import 'package:hospital_riverpod/features/blog/domain/repositories/bloglist_repository.dart';
import 'package:hospital_riverpod/shared/data/remote/network_service.dart';
import 'package:hospital_riverpod/shared/domain/providers/dio_network_service_provider.dart';





final blogDataSourceProvider =
  Provider.family< BlogDataSource, NetworkService>((_, networkService) => BlogRemoteDatasource(networkService),
);


final blogRepositoryProvider = Provider<BlogRepository>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  final datasource = ref.watch(blogDataSourceProvider(networkService));
  final repository = BlogRepositoryImpl(datasource);
  return repository;
});

