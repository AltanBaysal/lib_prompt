class PromptEntity {
  final String id;
  final String title;
  final String imageUrl;
  final String prompt;
  final String model;

  const PromptEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.prompt,
    required this.model,
  });
}
