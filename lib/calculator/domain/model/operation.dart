class Operation {
  final int? id;
  final int operation;
  final String result;

  Operation({
    this.id,
    required this.operation,
    required this.result,
  });

  factory Operation.fromJson(Map<String, dynamic> json) => Operation(
        id: json["id"],
        operation: json["operation"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "operation": operation,
        "result": result,
      };
}
