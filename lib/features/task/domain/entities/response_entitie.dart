class Response {
  final Map<String, dynamic> data;
  final String message;
  final bool success;

  const Response({required this.data, required this.message, required this.success});
}

class Responses {
  final List<Map<String, dynamic>> data;
  final String message;
  final bool success;

  const Responses({required this.data, required this.message, required this.success});
}