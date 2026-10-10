import 'package:flutter/material.dart';
import 'package:websiteportfilio/core/theme/portfolio_colors.dart';
import 'package:websiteportfilio/core/utils/open_external.dart';
import 'package:websiteportfilio/features/portfolio/portfolio_content.dart';
import 'package:websiteportfilio/l10n/app_localizations.dart';
import 'package:websiteportfilio/shared/widgets/magnetic_surface.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    required this.project,
    required this.index,
    this.compact = false,
    super.key,
  });

  final ProjectItem project;
  final int index;
  final bool compact;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.portfolioColors;
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final indexLabel = (widget.index + 1).toString().padLeft(2, '0');

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: MagneticSurface(
        onTap: () => openExternal(widget.project.url),
        borderRadius: const BorderRadius.all(Radius.circular(28)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AnimatedScale(
                    scale: _hovered ? 1.06 : 1,
                    duration: const Duration(milliseconds: 520),
                    curve: Curves.easeOutCubic,
                    child: Image.asset(
                      widget.project.image,
                      fit: BoxFit.cover,
                      semanticLabel: widget.project.title,
                    ),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x00000000), Color(0x990E0B16)],
                        stops: [0.45, 1],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    bottom: 12,
                    child: Text(
                      indexLabel,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 18, 22, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.project.title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.project.body,
                    maxLines: widget.compact ? 3 : null,
                    overflow: widget.compact ? TextOverflow.ellipsis : null,
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.viewProject,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: colors.accent,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
