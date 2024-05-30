import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/service.dart';
import '../blocs/service_bloc.dart';

class AddServicePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController contactNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  AddServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar un nuevo Servicio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Servicio',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(Icons.business),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingrese el nombre del servicio';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                            labelText: 'Descripción',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(Icons.description),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingrese la descripción';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: categoryController,
                          decoration: InputDecoration(
                            labelText: 'Categoría',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(Icons.category),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingrese la categoría';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: contactNameController,
                          decoration: InputDecoration(
                            labelText: 'Nombre de Contacto',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingrese el nombre de contacto';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(Icons.email),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingrese el email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            labelText: 'Teléfono',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(Icons.phone),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingrese el teléfono';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: addressController,
                          decoration: InputDecoration(
                            labelText: 'Dirección',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(Icons.location_on),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingrese la dirección';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final service = Service(
                                id: DateTime.now().toString(),
                                name: nameController.text,
                                description: descriptionController.text,
                                category: categoryController.text,
                                contactName: contactNameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                address: addressController.text,
                              );
                              BlocProvider.of<ServiceBloc>(context).add(AddServiceEvent(service));
                              Navigator.pop(context, true); // Regresar a ServiceListPage con resultado true
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Guardar',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 16),
                        BlocBuilder<ServiceBloc, ServiceState>(
                          builder: (context, state) {
                            if (state is ServiceAdded) {
                              return const Text(
                                'Servicio agregado con éxito',
                                style: TextStyle(color: Colors.green),
                              );
                            } else if (state is ServiceError) {
                              return const Text(
                                'Error al agregar servicio',
                                style: TextStyle(color: Colors.red),
                              );
                            }
                            return Container();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
