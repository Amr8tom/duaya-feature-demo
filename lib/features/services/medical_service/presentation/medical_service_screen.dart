import 'package:duaya_app/common/custom_ui.dart';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/common/widgets/floating_action_button/custom_floating_action_button.dart';
import 'package:duaya_app/features/services/medical_service/presentation/widgets/custom_container_medical_service_component/custom_container_medical_service_component.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/constants.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../routing/routes_name.dart';
import '../../../../utils/constants/colors.dart';
import '../select_feature_screen.dart';
import 'controller/medical_services_cubit.dart';

class MedicalServiceScreen extends StatelessWidget {
  const MedicalServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicalServicesCubit, MedicalServicesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        print(state);
        final medController = context.read<MedicalServicesCubit>();
        return Scaffold(
          appBar: DAppBar(
            title: Text(S.current.medicalService),
            centerTitle: true,
            showBackArrow: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppSizes.spaceBtwItems,
                horizontal: AppSizes.spaceBtwTexts * 2),

            /// Component Medical Service
            child: state is MedicalServicesGetListLoading
                ? CustomUI.simpleLoader()
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: 1 / 1.6),
                    shrinkWrap: true,
                    itemCount: medController.medicalServicesModel.data!.length,
                    itemBuilder: (context, index) {
                      final image = medController
                          .medicalServicesModel.data![index].thumbnailImage;
                      final name =
                          medController.medicalServicesModel.data![index].name;
                      final price = medController
                          .medicalServicesModel.data![index].mainPrice;
                      final strockedPrice = medController
                          .medicalServicesModel.data![index].strokedPrice;
                      final ID =
                          medController.medicalServicesModel.data![index].id;
                      final discount = medController
                          .medicalServicesModel.data![index].discount;
                      return GestureDetector(
                        onTap: () {
                          context.pushNamed(DRoutesName.detailsProductRoute,
                              arguments: {
                                "productName": name.toString(),
                                "productID": ID.toString(),
                                "discount": ID.toString(),
                                "productImage": image.toString(),
                                "companyName": "Duaya",
                                "discount": discount.toString() ?? "0",
                                "price": price.toString(),
                                "strockedPrice": strockedPrice!.toString(),
                                "hasDicount": true,
                              });
                        },
                        child: MedicalServiceCard(
                          strockedPrice: strockedPrice!,
                          productImage: image!,
                          description: name!,
                          price: price!,
                          id: ID!,
                          discount: discount,
                        ),
                      );
                    },
                  ),
          ),
          floatingActionButton: TextButton(
            child: Container(
              // color: ColorRes.greenBlueLight,
              decoration: BoxDecoration(
                  color: ColorRes.greenBlueLight,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: ColorRes.greenBlue)),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  "أختر خصائص تطبيقك",
                  style: TextStyle(
                    color: ColorRes.greenBlue,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectFeaturesScreen()));
            },
          ),
        );
      },
    );
  }
}
