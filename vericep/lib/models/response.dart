class Response {
  int result;
  String message;

  Response({this.result, this.message});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      result: json['result'],
      message: json['message'],
    );
  }
}
