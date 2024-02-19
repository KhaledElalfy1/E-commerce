part of 'complete_profile_cubit.dart';


sealed class CompleteProfileState {}

final class CompleteProfileInitial extends CompleteProfileState {}

final class CompleteProfileLoading extends CompleteProfileState {}

final class CompleteProfileSuccess extends CompleteProfileState {}

final class CompleteProfileFailure extends CompleteProfileState {}

final class CompleteProfileUpdateList extends CompleteProfileState {}
