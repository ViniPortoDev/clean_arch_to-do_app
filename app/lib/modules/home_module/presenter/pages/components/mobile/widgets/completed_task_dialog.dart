import 'package:flutter/material.dart';

class CompletedTaskDialog extends StatelessWidget {
  final void Function()? removeTask;
  const CompletedTaskDialog({Key? key, this.removeTask}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 200,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Tarefa Concluida !!!'),
            const Text('Deseja remover a tarefa concluida?'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                  ),
                  onPressed: removeTask,
                  child: const Text('sim'),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('nao'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
