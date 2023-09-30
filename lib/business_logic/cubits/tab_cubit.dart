import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/enums/tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit()
      : super(TabState.appointments); // * Initialize with the default tab

  void setTabAppointments() {
    emit(TabState.appointments);
  }

  void setTabPreAppointments() {
    emit(TabState.preAppointments);
  }

  void setTabDocuments() {
    emit(TabState.documents);
  }
}
