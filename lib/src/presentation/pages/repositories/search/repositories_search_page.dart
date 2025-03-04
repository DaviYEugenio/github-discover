// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:github_discover/src/constants/spacings.dart';
import 'package:github_discover/src/constants/theme.dart';
import 'package:github_discover/src/constants/typographies.dart';
import 'package:github_discover/src/domain/entities/repository.dart';
import 'package:github_discover/src/presentation/components/app_bar.dart';
import 'package:github_discover/src/presentation/components/app_bar_bottom.dart';
import 'package:github_discover/src/presentation/components/text.dart';
import 'package:github_discover/src/presentation/pages/repositories/widgets/repository_list_tile.dart';
import 'package:github_discover/src/utils/extensions/build_context_extensions.dart';
import 'package:github_discover/src/utils/extensions/theme_data_extensions.dart';
import 'package:intl/intl.dart';

class RepositoriesSearchPage extends StatefulWidget {
  final List<Repository> repository;
  final Function(String) onSearch;
  final void Function(Repository) onDetailTap;

  const RepositoriesSearchPage({
    super.key,
    required this.repository,
    required this.onSearch,
    required this.onDetailTap,
  });

  @override
  State<RepositoriesSearchPage> createState() => _RepositoriesSearchPageState();
}

class _RepositoriesSearchPageState extends State<RepositoriesSearchPage> {
  String _searchString = "";

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat.compact(locale: locale);

    return Scaffold(
      backgroundColor: context.colors.kBackgrounDefaultColor,
      appBar: CustomAppBar(
        bottom: CustomAppBarBottom(
          onChanged: (search) {
            setState(() {
              _searchString = search;
            });
          },
          onPressed: () => widget.onSearch(_searchString),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.s24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  text: context.locales
                      .resultHeader(formatter.format(widget.repository.length)),
                  textAlign: TextAlign.start,
                  style: TypographyType.header,
                ),
                const SizedBox(height: Spacing.s32),
                ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.repository.length,
                  itemBuilder: (context, index) {
                    var repostory = widget.repository[index];
                    return RepositoryListTile(
                      repository: repostory,
                      onTap: () {
                        widget.onDetailTap(widget.repository[index]);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
