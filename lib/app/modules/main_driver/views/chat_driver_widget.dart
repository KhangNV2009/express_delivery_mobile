import 'dart:convert';

import 'package:express_delivery/app/modules/main_driver/controllers/main_driver_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../components/app_bars/custom_app_bars.dart';
import '../../../components/base/base_screen_view.dart';
import '../../../components/chat/chat_tile.dart';
import '../../../constants/core_remote_constants.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/app_strings.dart';

class ChatDriverWidget extends GetView<MainDriverController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: Strings.CHAT_TEXT.tr,
      ),
      body: BaseScreenView(
        child: Column(
          children: [
            SizedBox(height: 10),
            _buildChatTiles(),
          ],
        ),
      ),
    );
  }

  Widget _buildChatTiles() {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          controller.sessions.clear();
          controller.getSessions();
        },
        child: AnimationLimiter(
          child: Obx(
                () => ListView.builder(
              itemCount: controller.sessions.length,
              itemBuilder: (BuildContext context, int index) {
                final session = controller.sessions[index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        child: ChatTile(
                          avatarUrl: '${CoreRemoteConstants.baseImageUrl}'
                              '${session.customer?.avatar}',
                          content: session.chats!.isEmpty ? '': session.chats?.first.text ?? '',
                          name: session.customer?.fullName ?? '',
                          date: '',
                          onTap: () {
                            final Map<String, String> _parameters = {};
                            _parameters['customer_name'] = jsonEncode(session.customer?.fullName ?? '');
                            _parameters['customer_avatar'] = jsonEncode(session.customer?.avatar ?? '');
                            _parameters['session_id'] = jsonEncode(session.id ?? 0);
                            Get.toNamed(
                              Routes.DRIVER_CHAT_DETAIL,
                              parameters: _parameters,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}