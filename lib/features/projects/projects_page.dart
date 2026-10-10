import 'package:flutter/material.dart';
import 'package:websiteportfilio/features/portfolio/portfolio_content.dart';
import 'package:websiteportfilio/features/projects/project_card.dart';
import 'package:websiteportfilio/l10n/app_localizations.dart';
import 'package:websiteportfilio/shared/widgets/fade_slide_in.dart';
import 'package:websiteportfilio/shared/widgets/page_frame.dart';
import 'package:websiteportfilio/shared/widgets/section_intro.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final projects = projectsOf(l10n);

    return SingleChildScrollView(
      child: PageFrame(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeSlideIn(
              child: SectionIntro(
                title: l10n.sectionProjects,
                subtitle: l10n.projectsIntro,
              ),
            ),
            const SizedBox(height: 28),
            LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth >= 760 ? 2 : 1;
                final tileWidth = columns == 1
                    ? constraints.maxWidth
                    : (constraints.maxWidth - 18) / 2;
                return Wrap(
                  spacing: 18,
                  runSpacing: 18,
                  children: [
                    for (var i = 0; i < projects.length; i++)
                      SizedBox(
                        width: tileWidth,
                        child: FadeSlideIn(
                          delay: Duration(milliseconds: 80 + (i * 70)),
                          child: ProjectCard(project: projects[i], index: i),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
