import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:guruh1/features/countries/presentation/provider/country_provider.dart';
import 'package:provider/provider.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CountryProvider>().getCountries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CountryProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (provider.error != null) {
            return Center(child: Text(provider.error!));
          } else if (provider.countries.isNotEmpty) {
            return GridView.builder(
              itemCount: provider.countries.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 300,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: .center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: provider.countries[index].media.emblem,
                          errorWidget: (context, url, error) {
                            return Center(child: Icon(Icons.broken_image));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
