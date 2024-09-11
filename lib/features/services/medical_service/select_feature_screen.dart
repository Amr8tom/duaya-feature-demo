import 'package:duaya_app/app/app.dart';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/l10n.dart';
import '../../../utils/constants/colors.dart';
import 'app_features_selection/chat_and_communication.dart';
import 'app_features_selection/customization.dart';
import 'app_features_selection/location_and_maps.dart';
import 'app_features_selection/loginfeature.dart';
import 'app_features_selection/notifications_and_alerts.dart';
import 'app_features_selection/payment_and_shopping.dart';

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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => customization()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.sharing_features),
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
                S.current.privacy_settings),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => customization()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.ui_customization),
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
                S.current.appointment_scheduling),
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
                S.current.doctor_patient_communication),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => customization()));
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
                      builder: (context) => NotificationsAndAlerts()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.telemedicine),
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
                S.current.lab_test_results),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LocationAndMaps()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.health_articles),
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
                S.current.insurance_integration),
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
                S.current.emergency_services),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LocationAndMaps()));
            },
          ),
          ListTile(
            title: Text(
                style: TextStyle(color: ColorRes.greenBlue),
                S.current.symptom_checker),
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
                S.current.health_goals_tracking),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LocationAndMaps()));
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
                      builder: (context) => SecurityLoginScreen()));
            },
          ),

          // Add more ListTile items here for other features
        ],
      ),
    );
  }
}
