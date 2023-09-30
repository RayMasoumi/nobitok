import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user.dart';

class UserCubit extends Cubit<User?> {
  UserCubit() : super(null);

  void setUser(User user) {
    emit(user);
  }
}
