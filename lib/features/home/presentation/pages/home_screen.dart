import 'package:flutter/material.dart';
import 'package:guruh1/features/home/models/electronics_model.dart';
import 'package:guruh1/features/home/presentation/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().getElectronics();
    });
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text('New Smartphone'),
                    content: Column(
                      spacing: 10.0,
                      mainAxisSize: .min,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Name',
                          ),
                        ),
                        TextFormField(
                          controller: _typeController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Type',
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          final gadget = ElectronicsModel(
                            id: '',
                            name: _nameController.text.trim(),
                            image: 'https://picsum.photos/200',
                            type: _typeController.text.trim(),
                            price: 1000,
                          );

                          await context.read<HomeProvider>().createGadget(
                            gadget,
                          );
                          if (provider.createError != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(provider.createError!)),
                            );
                            Navigator.pop(context);
                          } else if (provider.isCreated == true) {
                            context.read<HomeProvider>().getElectronics();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Yangi product qo'shildi"),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: provider.isCreating
                            ? CircularProgressIndicator.adaptive()
                            : Text('Apply'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(title: Text('Home')),
          body: Builder(
            builder: (context) {
              if (provider.isGetting) {
                return Center(child: CircularProgressIndicator.adaptive());
              } else if (provider.error != null) {
                return Center(child: Text(provider.error!));
              } else if (provider.electronics.isNotEmpty) {
                return ListView.separated(
                  itemCount: provider.electronics.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10.0),
                  itemBuilder: (context, index) {
                    final electronic = provider.electronics[index];
                    return ListTile(title: Text(electronic.name));
                  },
                );
              }
              return SizedBox.shrink();
            },
          ),
        );
      },
    );
  }
}
/*



 */