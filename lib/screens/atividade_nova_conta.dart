import 'package:flutter/material.dart';

class AtividadeNova extends StatefulWidget {
  const AtividadeNova({super.key});

  @override
  State<AtividadeNova> createState() => _AtividadeNovaState();
}

class _AtividadeNovaState extends State<AtividadeNova> {
  TextEditingController nameController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 26, 26, 26),
        appBar: AppBar(
          title: const Text('Nova Tarefa'),
          backgroundColor: const Color.fromARGB(255, 0, 0, 45),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Insira o nome da Tarefa';
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) < 1) {
                          return 'Insira uma idade válida';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: yearController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Idade',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira a senha';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Senha',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (text) {
                        setState(() {});
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Insira um e-mail válido';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'E-mail',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                  ),
                  // Container(
                  //     height: 100,
                  //     width: 72,
                  //     decoration: BoxDecoration(
                  //       color: const Color.fromARGB(255, 0, 0, 45),
                  //       borderRadius: BorderRadius.circular(10),
                  //       border: Border.all(width: 2, color: Colors.blue),
                  //     ),
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(10),
                  //       child: Image.network(
                  //         emailController.text,
                  //         errorBuilder: (BuildContext context, Object exception,
                  //             StackTrace? stackTrace) {
                  //           return Image.asset(
                  //             'assets/images/nophoto.png',
                  //             fit: BoxFit.cover,
                  //           );
                  //         },
                  //         fit: BoxFit.cover,
                  //       ),
                  //     )),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red
                    ),
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        print('Nome: ${nameController.text}');
                        print(
                            'Dificuldade: ${int.parse(yearController.text)}');
                        print('Image: ${emailController.text}');
                      }
                    },
                    child: const Text('Add'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
