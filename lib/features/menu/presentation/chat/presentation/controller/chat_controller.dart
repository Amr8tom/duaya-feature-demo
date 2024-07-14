import 'package:url_launcher/url_launcher.dart';

Future<void> openWhatsAppChat() async {
  String phoneNumber = "+201008541308"; // Replace with the desired phone number
  String message =
      "Hello!"; // Optional: Replace with your desired initial message

  String url = "https://wa.me/$phoneNumber/?text=${Uri.parse(message)}";

  await launchUrl(Uri.parse(url));
  ; // Launch the WhatsApp URL
}
