import 'package:teslo_shop/features/auth/data/data.dart';
import 'package:teslo_shop/features/auth/domain/domain.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl({AuthDatasource? dataSource})
      : datasource = dataSource ?? AuthDatasourceImpl();

  @override
  Future<User> checkAuthStatus(String token) async {
    return await datasource.checkAuthStatus(token);
  }

  @override
  Future<User> login(String email, String password) async {
    return await datasource.login(email, password);
  }

  @override
  Future<User> register(String email, String password, String fullName) async {
    return await datasource.register(email, password, fullName);
  }
}
