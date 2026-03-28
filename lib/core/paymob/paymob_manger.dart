import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PaymobManger {
  final Dio _dio = Dio();
  static const String _baseUrl = 'https://accept.paymob.com/api';

  String get _apiKey => dotenv.env['PAYMOB_API_KEY'] ?? '';
  int get _cardIntegrationId =>
      int.parse(dotenv.env['PAYMOB_CARD_INTEGRATION_ID'] ?? '0');
  int get _walletIntegrationId =>
      int.parse(dotenv.env['PAYMOB_WALLET_INTEGRATION_ID'] ?? '0');
  String get _cardIframeId => dotenv.env['PAYMOB_CARD_IFRAME_ID'] ?? '';

  Future<String> _getAuthToken() async {
    final response = await _dio.post(
      '$_baseUrl/auth/tokens',
      data: {'api_key': _apiKey},
    );
    return response.data['token'];
  }

  Future<int> _registerOrder({
    required String authToken,
    required int amountCents,
  }) async {
    final response = await _dio.post(
      '$_baseUrl/ecommerce/orders',
      data: {
        'auth_token': authToken,
        'delivery_needed': false,
        'amount_cents': amountCents,
        'currency': 'EGP',
        'items': [],
      },
    );
    return response.data['id'];
  }

  Future<String> _getPaymentKey({
    required String authToken,
    required int orderId,
    required int amountCents,
    required int integrationId,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    final response = await _dio.post(
      '$_baseUrl/acceptance/payment_keys',
      data: {
        'auth_token': authToken,
        'amount_cents': amountCents,
        'expiration': 3600,
        'order_id': orderId,
        'billing_data': {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'phone_number': phone,
          'apartment': 'NA',
          'floor': 'NA',
          'street': 'NA',
          'building': 'NA',
          'shipping_method': 'NA',
          'postal_code': 'NA',
          'city': 'NA',
          'country': 'EG',
          'state': 'NA',
        },
        'currency': 'EGP',
        'integration_id': integrationId,
      },
    );
    return response.data['token'];
  }

  Future<String> getIframeUrl({
    required int amountCents,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    final authToken = await _getAuthToken();
    final orderId = await _registerOrder(
      authToken: authToken,
      amountCents: amountCents,
    );
    final paymentKey = await _getPaymentKey(
      authToken: authToken,
      orderId: orderId,
      amountCents: amountCents,
      integrationId: _cardIntegrationId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    );

    return 'https://accept.paymob.com/api/acceptance/iframes/$_cardIframeId?payment_token=$paymentKey';
  }

  Future<void> payWithWallet({
    required int amountCents,
    required String phone,
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    final authToken = await _getAuthToken();
    final orderId = await _registerOrder(
      authToken: authToken,
      amountCents: amountCents,
    );
    final paymentKey = await _getPaymentKey(
      authToken: authToken,
      orderId: orderId,
      amountCents: amountCents,
      integrationId: _walletIntegrationId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    );

    await _dio.post(
      '$_baseUrl/acceptance/payments/pay',
      data: {
        'source': {
          'identifier': phone,
          'subtype': 'WALLET',
        },
        'payment_token': paymentKey,
      },
    );
  }
}
