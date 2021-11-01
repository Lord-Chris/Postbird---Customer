import 'package:postbird/core/index.dart';

class FaqController extends BaseController {
  final List<FAQ> topQuestions = [
    FAQ(title: 'How do I deliver my packages?', body: ''),
    FAQ(title: 'How many days refund ticket?', body: ''),
    FAQ(title: 'How do I enter promo code?', body: ''),
  ];
  final List<FAQ> popularTopics = [
    FAQ(title: 'How do I cancel an order?', body: ''),
    FAQ(title: 'Give Review or tips to Courier?', body: ''),
    FAQ(title: 'Top Up E-Wallet?', body: ''),
    FAQ(title: 'How do I enter voucher?', body: ''),
  ];

  final List<FAQ> frequentlyAsked = [
    FAQ(title: 'How to send my package?', body: ''),
    FAQ(title: 'Can i change pick up location?', body: ''),
    FAQ(title: 'How do i know exactly my package weight?', body: ''),
    FAQ(title: 'Can i send a fragile package?', body: ''),
    FAQ(title: 'Can i track my package?', body: ''),
  ];
}

class FAQ {
  final String title, body;
  bool isExpanded;

  FAQ({
    required this.title,
    required this.body,
    this.isExpanded = false,
  });
}
