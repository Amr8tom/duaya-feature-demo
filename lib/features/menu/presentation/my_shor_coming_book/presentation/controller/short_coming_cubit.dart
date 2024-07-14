import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../../../generated/l10n.dart';
import '../../data/dataSources/remoteDataSources.dart';
import '../../data/model/shortCommingBook.dart';

part 'short_coming_state.dart';

class ShortComingCubit extends Cubit<ShortComingState> {
  ShortComingCubit() : super(ShortComingInitial());
  late ShortCommingBook shortCommingModel;
  XFile? selectedImage;
  FormData? formData; // Variable to hold FormData
  XFile? selectedImageFromCamera;
  ShortComingRemoteDataSourcesImp remote = ShortComingRemoteDataSourcesImp();
  void updateFormData({required BuildContext context}) async {
    if (selectedImage != null || selectedImageFromCamera != null) {
      // Create FormData object with MultipartFile
      formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          selectedImage?.path ?? selectedImageFromCamera!.path,
          filename: selectedImage?.path.split('/').last ??
              selectedImageFromCamera?.path.split('/').last,
        ),
        'note': 'تيست ', // Add other form fields if needed
      });
      // Send FormData to remote data source
      Map<String, dynamic>? response =
          await remote.sendComingShortFile(dataImage: formData);
      shortCommingModel = ShortCommingBook.fromJson(response);
      Navigator.pop(context);
      commonToast(shortCommingModel.message.toString());
    } else {
      commonToast(S.current.pleaseEndterValue);
    }
  }

  Future<void> openImageGallery({required BuildContext context}) async {
    emit(SelectImageStudioLoading());
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage = image;
      updateFormData(context: context);
      emit(SelectImageStudioSuccess());
    } else {
      // User canceled the image picking
      emit(SelectImageStudioSuccess());
    }
  }

  Future<void> openCamera({required BuildContext context}) async {
    emit(TakeImageStudioLoading());
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      selectedImageFromCamera = image;
      updateFormData(context: context);
      emit(TakeImageStudioSuccess());
    } else {
      // User canceled the image picking
      emit(SelectImageStudioSuccess());
    }
  }
}
