import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/service_bloc.dart';

class ServiceListPage extends StatelessWidget {
  const ServiceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar servicios'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              BlocProvider.of<ServiceBloc>(context).add(GetServicesEvent());
            },
          ),IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText:
                            'Buscar servicios por contacto, categoria, teléfono o nombre del servicio',
                        labelStyle: TextStyle(
                          color: Colors.black
                              .withOpacity(0.6), // Color de texto más opaco
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        prefixIcon: const Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        BlocProvider.of<ServiceBloc>(context)
                            .add(SearchServicesEvent(value));
                      },
                      style: TextStyle(
                        color: Colors.black
                            .withOpacity(0.6), // Color de texto más opaco
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final result = await Navigator.pushNamed(context, '/add');
                      if (result == true) {
                        // Refresca la lista de servicios
                        BlocProvider.of<ServiceBloc>(context)
                            .add(GetServicesEvent());
                      }
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Agregar servicio'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<ServiceBloc, ServiceState>(
                  builder: (context, state) {
                    if (state is ServiceLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ServiceLoaded) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Se encontraron ${state.services.length} servicios',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.services.length,
                              itemBuilder: (context, index) {
                                final service = state.services[index];
                                return Card(
                                  elevation: 4,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.accessibility_rounded,
                                              size: 40,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    service.name,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(service.description),
                                                  const SizedBox(height: 8),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Divider(),
                                        Text(
                                          'Contacto: ${service.contactName}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Email: ${service.email}',
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          'Celular: ${service.phone}',
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          'Dirección: ${service.address}',
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(height: 8),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    } else if (state is ServiceError) {
                      return Center(child: Text(state.message));
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
