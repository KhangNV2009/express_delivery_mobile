import 'dart:convert';

import 'package:express_delivery/app/data/models/core/base_response.dart';
import 'package:express_delivery/app/utils/snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/repositories/incident_remote_repository.dart';

class DriverCreateReportController extends GetxController {
  int? customerId;
  int? deliveryId;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final enableButton = false.obs;

  /// services
  final incidentRemoteRepository = IncidentRemoteRepository();

  @override
  void onInit() {
    super.onInit();
    final _parameters = Get.parameters;
    customerId = jsonDecode(_parameters['customer_id'] ?? '');
    deliveryId = jsonDecode(_parameters['delivery_id'] ?? '');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onTitleChanged(String value) {
    validateButton();
  }

  void onDescriptionChanged(String value) {
    validateButton();
  }

  void validateButton() {
    enableButton.value = titleController.text.isNotEmpty && descriptionController.text.isNotEmpty;
  }

  void sendReport() async {
    BaseResponse response = await incidentRemoteRepository.createIncident(
      deliveryId: deliveryId?? 0,
      customerId: customerId ?? 0,
      title: titleController.text,
      description: descriptionController.text,
    );
    if(response.success) {
      SnackBarUtils().showMessageSnackBar('success');
    } else {
      SnackBarUtils().showErrorSnackBar('error');
    }
  }
}
