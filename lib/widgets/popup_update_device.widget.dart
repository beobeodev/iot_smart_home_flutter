import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iot_smart_home/core/constants/font_family.dart';
import 'package:iot_smart_home/core/theme/palette.dart';
import 'package:iot_smart_home/domain/entities/device.entity.dart';
import 'package:iot_smart_home/widgets/rounded_text_form_field.widget.dart';

class PopupUpdateDevice extends StatefulWidget {
  final void Function(DeviceEntity) addDeviceToList;
  final DeviceEntity? device;

  const PopupUpdateDevice({
    Key? key,
    required this.addDeviceToList,
    this.device,
  }) : super(key: key);

  @override
  State<PopupUpdateDevice> createState() => _PopupUpdateDeviceState();
}

class _PopupUpdateDeviceState extends State<PopupUpdateDevice> {
  final GlobalKey<FormState> keyPopup = GlobalKey<FormState>();

  late DeviceEntity device;

  @override
  void initState() {
    super.initState();

    device = widget.device ?? DeviceEntity(id: '', name: '');
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Nhập tên của thiết bị';
    }
    return null;
  }

  String? validateGate(String? value) {
    if (value!.isEmpty) {
      return 'Nhập số cổng của thiết bị';
    }
    return null;
  }

  void onTapUpdate() {
    if (!keyPopup.currentState!.validate()) {
      return;
    }
    widget.addDeviceToList(device);
    Get.back(); // close popup
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runAlignment: WrapAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        Material(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: Get.width - 40,
            height: 260.h,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Palette.blue200,
                  offset: Offset(0, 1),
                  blurRadius: 18,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              // border:Border.all(color: Palette.darkCerulean400)
            ),
            child: Form(
              key: keyPopup,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedTextFormField(
                    hintText: 'Tên thiết bị',
                    initValue: device.name,
                    validator: validateName,
                    onChanged: (value) {
                      device.name = value;
                    },
                  ),
                  RoundedTextFormField(
                    hintText: 'Số cổng',
                    initValue: device.gate?.toString(),
                    validator: validateGate,
                    textInputType: TextInputType.number,
                    onChanged: (value) {
                      device.gate = int.parse(value);
                    },
                  ),
                  TextButton(
                    onPressed: onTapUpdate,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      backgroundColor: Palette.blue300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      widget.device != null ? 'Cập nhật' : 'Thêm thiết bị',
                      style: TextStyle(
                        fontFamily: FontFamily.fontMulish,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
