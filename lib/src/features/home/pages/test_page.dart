import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/others/http/bloc/http_bloc.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/others/loading_widget.dart';
import '../../../core/widgets/texts/text_r.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
    context.read<HttpBloc>().add(GetCategories());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocBuilder<HttpBloc, HttpState>(
        builder: (context, state) {
          if (state is HttpLoading) {
            return const LoadingWidget();
          }

          if (state is HttpLoaded) {
            return ListView.builder(
              itemCount: state.albums.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextM(
                    state.albums[index].title,
                    fontSize: 12,
                    maxLines: 2,
                  ),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
