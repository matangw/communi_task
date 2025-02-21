import 'package:is_prime_number/is_prime_number.dart' as is_prime_number;

class NumberObject {
  final int number;
  late final bool isPrime;

  NumberObject({
    required this.number,
  }) {
    isPrime = is_prime_number.isPrime(number);
  }
}
