import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/screen/profile/bloc/profile_event.dart';
import 'package:medica/screen/profile/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState()) {
    on<ProfileEvent>(_profileEvent);
  }

  void _profileEvent(ProfileEvent event, Emitter<ProfileState> emit) {
    debugPrint("fullName : ${state.fullName}");
    emit(state.copyWith(
        fullName: event.fullName,
        nickName: event.nickName,
        email: event.email,
        dateOfBirth: event.dateOfBirth,
        gender: event.gender));
  }
}
