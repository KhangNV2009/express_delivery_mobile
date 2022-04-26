import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../../../components/app_bars/custom_app_bars.dart';
import '../../../../../components/base/base_screen_view.dart';
import '../../../../../components/chat/current_user/current_user_chat.dart';
import '../../../../../components/chat/partner_chat/partner_chat.dart';
import '../../../../../constants/custom_colors.dart';
import '../../../../../constants/custom_text_styles.dart';
import '../../../../../data/services/long_press_chat_service.dart';
import '../controllers/driver_chat_detail_controller.dart';

class DriverChatDetailView extends GetView<DriverChatDetailController> {
  final Map<String, FocusNode> mapFocusNode = {
    "chat_field": FocusNode(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBars().primaryAppBar(
        title: controller.customerName,
      ),
      body: BaseScreenView(
        child: Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              Expanded(
                child: Obx(
                      () => ListView.builder(
                    shrinkWrap: false,
                    reverse: true,
                    controller: controller.scrollController,
                    itemCount: controller.chats.length,
                    itemBuilder: (BuildContext context, int index) {
                      final chat = controller.chats.reversed.toList()[index];
                      return chat.userId == controller.currentUserId
                          ? CurrentUserChat(
                        chatModel: chat,
                        onLongPress: (GlobalKey key) async {
                          mapFocusNode['chat_field']?.unfocus();
                          await Future.delayed(Duration(milliseconds: 350), () {
                            LongPressChatUtils().showOverlayVisible(
                              child: CurrentUserChat(
                                chatModel: chat,
                                onLongPress: (_) {},
                              ),
                              positionY: controller.initialShowCaseView(key),
                              isCurrent: true,
                              onEditCallback: () {
                                controller.messageController.text = chat.text ?? '';
                                LongPressChatUtils().hideOverlay();
                                FocusScope.of(Get.context!)
                                    .requestFocus(mapFocusNode['chat_field']);
                              },
                              onCopyCallback: () {
                                Clipboard.setData(ClipboardData(text: chat.text));
                                LongPressChatUtils().hideOverlay();
                              },
                            );
                          });
                        },
                      )
                          : PartnerChat(
                        chatModel: chat,
                        onLongPress: (GlobalKey key) async {
                          mapFocusNode['chat_field']?.unfocus();
                          await Future.delayed(Duration(milliseconds: 350), () {
                            LongPressChatUtils().showOverlayVisible(
                              child: PartnerChat(
                                chatModel: chat,
                                onLongPress: (_) {},
                              ),
                              positionY: controller.initialShowCaseView(key),
                              isCurrent: false,
                              onCopyCallback: () {
                                Clipboard.setData(ClipboardData(text: chat.text));
                                LongPressChatUtils().hideOverlay();
                              },
                              onEditCallback: null,
                            );
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              _buildChatInput(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildChatInput() {
    return Container(
      margin: EdgeInsets.only(
        left: 14,
        right: 14,
        bottom: 14,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: CustomColors.gray167),
        color: CustomColors.blue255,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // height: controller.height.value,
            child: TextField(
              focusNode: mapFocusNode['chat_field'],
              controller: controller.messageController,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(0),
                hintText: 'Nhập tin nhắn...',
                hintStyle: CustomTextStyles.zeplin8pt().copyWith(
                  color: CustomColors.gray183,
                ),
              ),
              maxLines: 5,
              minLines: 1,
              style: CustomTextStyles.zeplin8pt().copyWith(
                color: CustomColors.gray78,
              ),
              onChanged: controller.onMessageChanged,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: 10),
              _buildMessageAction(
                onTap: controller.onSendMessage,
                icon: FontAwesomeIcons.paperPlane,
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Container _buildMessageAction({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 26,
      width: 26,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: onTap,
          child: Center(
            child: Icon(icon, size: 20),
          ),
        ),
      ),
    );
  }
}
