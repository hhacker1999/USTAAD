import 'package:flutter/material.dart';
import 'package:project/src/bloc/validation_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<String>(
              stream: context.read<ValidationBloc>().emailStream,
              builder: (_, snap) => TextField(
                onChanged: context.read<ValidationBloc>().emailChanged,
                decoration: InputDecoration(errorText: snap.error),
              ),
            ),
            StreamBuilder<String>(
              stream: Provider.of<ValidationBloc>(context).passwordStream,
              builder: (_, snap) => TextField(
                onChanged: context.read<ValidationBloc>().passwordChanged,
                decoration: InputDecoration(errorText: snap.error),
              ),
            ),
            StreamBuilder<String>(
              stream: context.read<ValidationBloc>().confirmPasswordStream,
              builder: (_, snap) => TextField(
                onChanged:
                    context.read<ValidationBloc>().confirmPasswordChanged,
                decoration: InputDecoration(errorText: snap.error),
              ),
            ),
            StreamBuilder<bool>(
              stream: context.read<ValidationBloc>().buttonActive,
              builder: (context, snapshot) {
                return ElevatedButton(
                  onPressed: snapshot.hasData
                      ? () => context.read<ValidationBloc>().submitClicked()
                      : null,
                  child: Text('Submit'),
                );
              },
            )
          ],
        ),
      );
}
