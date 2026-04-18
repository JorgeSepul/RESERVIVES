import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:reservives/l10n/app_localizations.dart';
import 'package:reservives/providers/anuncios_provider.dart';
import 'package:reservives/widgets/design_system.dart';
import 'package:reservives/widgets/rv_image.dart';

class AnnouncementDetailScreen extends ConsumerStatefulWidget {
  final String anuncioId;

  const AnnouncementDetailScreen({super.key, required this.anuncioId});

  @override
  ConsumerState<AnnouncementDetailScreen> createState() => _AnnouncementDetailScreenState();
}

class _AnnouncementDetailScreenState extends ConsumerState<AnnouncementDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(anunciosProvider.notifier).registrarVisualizacion(widget.anuncioId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final anunciosAsync = ref.watch(anunciosProvider);
    final size = MediaQuery.of(context).size;
    final bool isWide = size.width > 800;

    return Scaffold(
      body: SafeArea(
        child: anunciosAsync.when(
          data: (anuncios) {
            final matches = anuncios.where((a) => a.id == widget.anuncioId);
            final anuncio = matches.isEmpty ? null : matches.first;
            if (anuncio == null) {
              return RvEmptyState(
                icon: Icons.article_outlined,
                title: context.tr('announcement.notFoundTitle'),
                subtitle: context.tr('announcement.notFoundSubtitle'),
              );
            }

            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 14, 20, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RvGhostIconButton(
                        icon: Icons.arrow_back_rounded,
                        onTap: () => context.pop(),
                      ),
                      const SizedBox(height: 18),
                      Text(anuncio.titulo, style: Theme.of(context).textTheme.headlineLarge),
                      const SizedBox(height: 10),
                      Text(
                        DateFormat('d MMM yyyy', Localizations.localeOf(context).languageCode).format(anuncio.fechaPublicacion),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 18),
                      if (anuncio.imagenUrl != null && anuncio.imagenUrl!.isNotEmpty) ...[
                        RvImage(
                          imageUrl: anuncio.imagenUrl!,
                          width: double.infinity,
                          height: isWide ? 400 : 250,
                          fit: BoxFit.cover,
                          borderRadius: BorderRadius.circular(24),
                          fallbackWidget: _AnnouncementImageError(
                            message: context.tr('common.imageLoadError'),
                            height: isWide ? 400 : 250,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                      Text(
                        anuncio.contenido,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.65),
                      ),
                      if (anuncio.nombreAutor != null) ...[
                        const SizedBox(height: 20),
                        Text(
                          anuncio.nombreAutor!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          },
          loading: () => Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const RvSkeleton(width: 40, height: 40, borderRadius: 20),
                    const SizedBox(height: 30),
                    const RvSkeleton(width: double.infinity, height: 32),
                    const SizedBox(height: 10),
                    const RvSkeleton(width: 200, height: 32),
                    const SizedBox(height: 20),
                    const RvSkeleton(width: 100, height: 16),
                    const SizedBox(height: 30),
                    RvSkeleton(width: double.infinity, height: isWide ? 400 : 200, borderRadius: 24),
                    const SizedBox(height: 20),
                    const RvSkeleton(width: double.infinity, height: 16),
                    const SizedBox(height: 10),
                    const RvSkeleton(width: double.infinity, height: 16),
                  ],
                ),
              ),
            ),
          ),
          error: (error, _) => const Center(child: RvApiErrorState()),
        ),
      ),
    );
  }
}

class _AnnouncementImageError extends StatelessWidget {
  final String message;
  final double height;

  const _AnnouncementImageError({
    required this.message,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).dividerColor.withValues(alpha: 0.35)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.broken_image_outlined,
            size: 34,
            color: Theme.of(context).textTheme.bodySmall?.color,
          ),
          const SizedBox(height: 10),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
