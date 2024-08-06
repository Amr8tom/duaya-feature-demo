import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/common/widgets/floating_action_button/custom_floating_action_button.dart';
import 'package:duaya_app/features/services/medical_service/presentation/widgets/custom_container_medical_service_component/custom_container_medical_service_component.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/constants.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

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
                ? Center(child: Lottie.asset(AssetRes.loadingSliders))
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: 1 / 2.12),
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
                      return MedicalServiceCard(
                        strockedPrice: strockedPrice!,
                        productImage: image!,
                        description: name!,
                        price: price!,
                        id: ID!,
                        discount: discount,
                      );
                    },
                  ),
          ),
          // floatingActionButton: const CustomFloatingActionButton(textButton: "New Service"),
        );
      },
    );
  }
}
