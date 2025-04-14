class TransactionModel {
  final bool isDeposit;
  final String title, date, money;

  const TransactionModel(
      {required this.isDeposit,
      required this.title,
      required this.date,
      required this.money});
}
