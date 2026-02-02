class PromptModel {
  final String id;
  final String title;
  final String imageUrl;
  final String prompt;
  final String model;

  PromptModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.prompt,
    required this.model,
  });

  factory PromptModel.fromJson(Map<String, dynamic> json) {
    return PromptModel(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['image_url'] as String,
      prompt: json['prompt'] as String,
      model: json['model'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image_url': imageUrl,
      'prompt': prompt,
      'model': model,
    };
  }
}
