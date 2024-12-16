class ResponseBody {
  final bool? status;
  final String? message;
  ResponseBody({required this.status, required this.message});

  const ResponseBody.empty()
      : status = false,
        message = "";
}
