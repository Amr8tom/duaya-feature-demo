import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/common/widgets/custom_button/custom_button_with_icon.dart';
import 'package:duaya_app/common/widgets/text_form_field/custom_text_form_field.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ReturnRequestScreen extends StatelessWidget {
  ReturnRequestScreen({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: DAppBar(
        title: Text(S.current.returnRequest),
        centerTitle: true,
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.all(AppSizes.spaceBtwItems),
          child: Column(
            children: [
             /// Text Form Field
              CustomTextFormField(hintText: "Please enter a service name", controller: controller),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppSizes.spaceBtwItems),
        child: CustomButtonWithIcon(textButton:S.current.send,onTap: (){},color: ColorRes.primary,height: AppSizes.imageSize * 1.2,width: width, borderColor: Colors.transparent, textButtonColor: ColorRes.white, isAddToCart: true),
      ),

    );
  }
}
