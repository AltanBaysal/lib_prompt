import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibe_lib/core/theme/app_theme.dart';
import 'package:vibe_lib/features/library/domain/entities/prompt_entity.dart';

class PromptCard extends StatefulWidget {
  final PromptEntity prompt;

  const PromptCard({super.key, required this.prompt});

  @override
  State<PromptCard> createState() => _PromptCardState();
}

class _PromptCardState extends State<PromptCard> {
  bool _isCopied = false;

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: widget.prompt.prompt));

    // Trigger animation
    setState(() => _isCopied = true);

    // Reset after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _isCopied = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Image Container - Tappable to copy
        GestureDetector(
          onTap: () => _copyToClipboard(context),
          child: AspectRatio(
            aspectRatio: 4 / 5,
            child: Container(
              color: AppTheme.surfaceColor,
              child: Image.asset(
                widget.prompt.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      color: Colors.white24,
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        // Copy Button - Aligned Right with Animation
        Padding(
          padding: const EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.centerRight,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: ElevatedButton.icon(
                onPressed: () => _copyToClipboard(context),
                icon: Icon(_isCopied ? Icons.check : Icons.copy, size: 18),
                label: Text(_isCopied ? 'Copied!' : 'Copy Prompt'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isCopied ? Colors.green : Colors.white,
                  foregroundColor: _isCopied ? Colors.white : Colors.black,
                  elevation: 0,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
