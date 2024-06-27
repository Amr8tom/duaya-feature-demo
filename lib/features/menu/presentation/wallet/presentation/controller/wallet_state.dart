part of 'wallet_cubit.dart';

@immutable
sealed class WalletState {}

final class WalletInitial extends WalletState {}

final class WalletDataFetchedSuccess extends WalletState {}

final class WalletDataFetchedLoading extends WalletState {}
