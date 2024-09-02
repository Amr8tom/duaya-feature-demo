part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentFailure extends PaymentState {}

final class PaymentSucessed extends PaymentState {
  final InvoiceInitPayModel invoiceModel;
  PaymentSucessed({required this.invoiceModel});
}
