import 'dart:developer';

import 'package:auth_management/core.dart';

import '../domain/user.dart';

class UserBackup extends AuthorizedDataSourceImpl<UserModel> {
  @override
  Future<UserModel?> onFetchUser(String id) async {
    // fetch authorized user data from remote server
    log("Authorized user id : $id");
    return null;
  }

  @override
  Future<void> onCreateUser(UserModel data) async {
    // Store authorized user data in remote server
    log("Authorized user data : $data");
  }

  @override
  Future<void> onUpdateUser(String id, Map<String, dynamic> data) async {
    // Update authorized user data in remote server
    log("Authorized user data : $data");
  }

  @override
  Future<void> onDeleteUser(String id) async {
    // Clear unauthorized user data from remote server
    log("Unauthorized user id : $id");
  }

  @override
  UserModel build(Map<String, dynamic> source) => UserModel.from(source);
}
