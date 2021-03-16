import 'package:flutter/material.dart';
import 'package:project/src/bloc/validation_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<bool>(
          stream: context.read<ValidationBloc>().validationStream,
          initialData: false,
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder<String>(
                  stream: context.read<ValidationBloc>().emailStream,
                  builder: (_, snap) => TextField(
                    onChanged: context.read<ValidationBloc>().emailChanged,
                    decoration: InputDecoration(
                        errorText: snapshot.data ? snap.error : null),
                  ),
                ),
                StreamBuilder<String>(
                  stream: Provider.of<ValidationBloc>(context).passwordStream,
                  builder: (_, snap) => TextField(
                    onChanged: context.read<ValidationBloc>().passwordChanged,
                    decoration: InputDecoration(
                        errorText: snapshot.data ? snap.error : null),
                  ),
                ),
                StreamBuilder<String>(
                  stream: context.read<ValidationBloc>().confirmPasswordStream,
                  builder: (_, snap) => TextField(
                    onChanged:
                        context.read<ValidationBloc>().confirmPasswordChanged,
                    decoration: InputDecoration(
                        errorText: snapshot.data ? snap.error : null),
                  ),
                ),
                ElevatedButton(
                    onPressed: () =>
                        context.read<ValidationBloc>().updateValidationStatus(),
                    child: Text('Submit'))
              ],
            );
          },
        ),
      );
}
