import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prompt_lib/features/library/presentation/viewmodels/library_viewmodel.dart';
import 'package:prompt_lib/features/library/presentation/widgets/prompt_card.dart';
import 'package:prompt_lib/core/theme/app_theme.dart'; // Assuming AppTheme is defined here or similar

@RoutePage()
class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promptsAsync = ref.watch(libraryViewModelProvider);

    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackgroundColor,
      body: promptsAsync.when(
        data: (prompts) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title at the top
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: Text(
                  'Prompt Library',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              // Prompt cards
              ...prompts.map(
                (prompt) => Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: PromptCard(prompt: prompt),
                ),
              ),
              const SizedBox(height: 100), // Bottom padding
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
