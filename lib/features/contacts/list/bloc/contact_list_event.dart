part of 'contact_list_bloc.dart';

@freezed
abstract class ContactListEvent with _$ContactListEvent {
  
  const factory ContactListEvent.findAll() = _ContactListEventFindAll;
}