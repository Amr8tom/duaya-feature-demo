import 'package:duaya_app/app/app.dart';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/services/medical_service/app_features_selection/add_more_features_screen.dart';
import 'package:duaya_app/features/services/medical_service/app_features_selection/emergency_services.dart';
import 'package:duaya_app/features/services/medical_service/app_features_selection/health_articles.dart';
import 'package:duaya_app/features/services/medical_service/app_features_selection/health_goals_tracking.dart';
import 'package:duaya_app/features/services/medical_service/app_features_selection/multimedia_features.dart';
import 'package:duaya_app/features/services/medical_service/app_features_selection/symptom_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/l10n.dart';
import '../../../utils/constants/colors.dart';
import 'app_features_selection/appointment_scheduling.dart';
import 'app_features_selection/chat_and_communication.dart';
import 'app_features_selection/customization.dart';
import 'app_features_selection/doctor_patient_communication.dart';
import 'app_features_selection/insurance_integration.dart';
import 'app_features_selection/lab_test_results.dart';
import 'app_features_selection/location_and_maps.dart';
import 'app_features_selection/loginfeature.dart';
import 'app_features_selection/notifications_and_alerts.dart';
import 'app_features_selection/payment_and_shopping.dart';
import 'app_features_selection/prescription_management.dart';
import 'app_features_selection/privacy_settings.dart';
import 'app_features_selection/sharing_features.dart';
import 'app_features_selection/telemedicine.dart';
import 'app_features_selection/ui_customization.dart';

class SelectFeaturesScreen extends StatelessWidget {
  const SelectFeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        showBackArrow: true,
        // arrowBackColor: true,
        centerTitle: true,
        title: Text(
          S.current.Appfeatures,
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.security_and_login),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecurityLoginScreen()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.chat_and_communication),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatAndCommunication()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.customization),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => customization()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.notifications_and_alerts),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationsAndAlerts()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.payment_and_shopping),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentAndShopping()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.location_and_maps),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LocationAndMaps()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.multimedia_features),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MultimediaFeatures()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.sharing_features),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SharingFeature()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.privacy_settings),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PrivacySetting()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.ui_customization),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UiCustomization()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.appointment_scheduling),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AppointmentScheduling()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.doctor_patient_communication),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DoctorPatientCommunication()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.prescription_management),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PrescriptionManagement()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.telemedicine),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Telemedicine()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.lab_test_results),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LabTestResults()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.health_articles),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HealthArticles()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.insurance_integration),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InsuranceIntegration()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.emergency_services),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EmergencyServices()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.symptom_checker),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SymptomChecker()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.health_goals_tracking),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HealthGoalsTracking()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.addMoreFeats),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddMoreFeaturesScreen()));
            },
          ),

          // Add more ListTile items here for other features
        ],
      ),
      floatingActionButton: TextButton(
        child: Container(
          // color: ColorRes.greenBlueLight,
          decoration: BoxDecoration(
              color: ColorRes.greenBlue,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: ColorRes.black)),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Text(
              S.current.sendToDuaya,
              style: TextStyle(
                color: ColorRes.white,
                fontSize: 17,
              ),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SelectFeaturesScreen()));
        },
      ),
    );
  }
}
