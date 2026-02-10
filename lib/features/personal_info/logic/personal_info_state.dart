import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_info_state.freezed.dart';

@Freezed()
class PersonalInfoState with _$PersonalInfoState {
  const factory PersonalInfoState.initial() = _Initial;
  const factory PersonalInfoState.uploadingImage() = UploadingImage;
  const factory PersonalInfoState.imageUploaded() = ImageUploaded;
  const factory PersonalInfoState.imageUploadError(String error) = ImageUploadError;
  const factory PersonalInfoState.updatingProfile() = UpdatingProfile;
  const factory PersonalInfoState.profileUpdated() = ProfileUpdated;
  const factory PersonalInfoState.profileUpdateError(String error) = ProfileUpdateError;
  const factory PersonalInfoState.dataChanged({required bool hasChanges}) = DataChanged;
}