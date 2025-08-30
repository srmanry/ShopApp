import 'package:flutter/material.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:flutter_html/flutter_html.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSize),
        child: Html(
      data: htmlData,
      // Optional parameters for customization:
      style: {
        "h1": Style(
          textAlign: TextAlign.center,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.secondary
        ),
        "h2": Style(
            textAlign: TextAlign.left,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary
        ),
        "p": Style(
          textAlign: TextAlign.justify,
            color: Theme.of(context).colorScheme.onSecondary
        ),
      },
    ));
  }

  final String htmlData = """<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Flight - Terms and Conditions</title>
</head>
<body>
  <h2>Terms and Conditions</h1>
  <p>Thank you for choosing Flight! By using our flight booking application, you agree to abide by the following terms and conditions. Please read them carefully before proceeding.</p>

  <h2>1. Acceptance of Terms</h2>
  <p>By accessing and using the Flight app, you acknowledge that you have read, understood, and agreed to be bound by these terms and conditions. If you do not agree to these terms, please do not use the app.</p>

  <h2>2. User Accounts</h2>
  <p>You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to immediately notify us of any unauthorized use of your account or any other breach of security.</p>

  <h2>3. Modifications to Terms</h2>
  <p>We reserve the right to modify these terms at any time. Your continued use of the app after any such modifications constitutes your acceptance of the new terms.</p>

  <h2>4. Privacy Policy</h2>
  <p>Your privacy is important to us. Our Privacy Policy, which is part of these terms, describes how we handle the information you provide to us when you use our services. You agree to the use of your data in accordance with our Privacy Policy.</p>

  <h2>5. Booking and Cancellations</h2>
  <p>When you book a flight through Flight, you agree to enter into a contract with the airline and not Flight itself. We act as an intermediary between you and the airline. Cancellations and changes to your booking are subject to the airline's terms and conditions.</p>

  <h2>6. Fees and Payments</h2>
  <p>You agree to pay the total fees and charges for any bookings made via Flight. All fees are due immediately and are non-refundable, except as otherwise stated in the specific airline's terms and conditions.</p>

  <h2>7. Intellectual Property</h2>
  <p>The content and information on this app (including, but not limited to, messages, data, information, text, music, sound, photos, graphics, video, maps, icons, software, code or other material), as well as the infrastructure used to provide such content and information, is proprietary to Flight or licensed to the Flight by third parties. You agree not to otherwise copy, reproduce, retransmit, distribute, publish, commercially exploit or otherwise transfer any material.</p>

  <h2>8. Limitation of Liability</h2>
  <p>Flight shall not be liable for any damages resulting from the use of or inability to use the app, any unauthorized access to or alteration of your transmissions or data, any material or data sent or received or not sent or received, or any transactions entered into through the app.</p>

  <h2>9. Indemnity</h2>
  <p>You agree to indemnify and hold Flight, its subsidiaries, affiliates, officers, agents, and other partners and employees, harmless from any loss, liability, claim, or demand, including reasonable attorney's fees, made by any third party due to or arising out of your use of the app in violation of this Agreement and/or arising from a breach of these terms and/or any breach of your representations and warranties set forth above.</p>

  <p>By using Flight, you agree to these terms and conditions. If you have any questions, please contact us.</p>
</body>
</html>
""";
}
