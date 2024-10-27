class Todo {
  final String title;
  final String subtitle;
  bool isD0ne;

  Todo({
    this.title = '',
    this.subtitle = '',
    this.isD0ne = false,
  });

  Todo copyWith({
    String? title,
    String? subtitle,
    bool? isD0ne,
  }) {
    return Todo(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isD0ne: isD0ne ?? this.isD0ne,
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      subtitle: json['subtitle'],
      isD0ne: json['isD0ne'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'isD0ne': isD0ne,
    };
  }
}
