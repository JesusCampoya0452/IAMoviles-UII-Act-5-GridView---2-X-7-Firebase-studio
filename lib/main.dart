import 'package:flutter/material.dart';

void main() {
  runApp(const MiLavanderiaApp());
}

class MiLavanderiaApp extends StatelessWidget {
  const MiLavanderiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la etiqueta de "DEBUG"
      home: PantallaLavanderia(),
    );
  }
}

class PantallaLavanderia extends StatelessWidget {
  const PantallaLavanderia({super.key});

  @override
  Widget build(BuildContext context) {
    // Generamos una lista de 14 URLs de imágenes de prueba.
    // En un proyecto real, aquí pondrías las URLs de tus detergentes, lavadoras, etc.
    final List<String> imagenes = List.generate(
      14,
      (index) => 'https://picsum.photos/seed/lavanderia$index/200/200',
    );

    return Scaffold(
      // Un fondo ligeramente gris oscuro hace que los contenedores blancos resalten (como en tu imagen)
      backgroundColor: const Color(0xFF2A2D34), 
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Lavanderia',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Un pequeño margen alrededor de la cuadrícula
        child: GridView.builder(
          itemCount: 14, // El total de imágenes (7 filas x 2 columnas = 14)
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Especificamos que queremos 2 columnas
            crossAxisSpacing: 8.0, // Espacio horizontal entre columnas
            mainAxisSpacing: 8.0, // Espacio vertical entre filas
            childAspectRatio: 0.8, // Ajusta la altura del contenedor. Cámbialo si se ve muy estirado
          ),
          itemBuilder: (context, index) {
            // Este es el "Contenedor" principal de cada tarjeta
            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  // 1. LA IMAGEN
                  // Expanded hace que la imagen tome todo el espacio disponible sobrante arriba
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        imagenes[index],
                        fit: BoxFit.contain, // Contain asegura que la imagen no se recorte
                      ),
                    ),
                  ),
                  
                  // 2. LAS 3 FILAS EN LA PARTE INFERIOR (Usando Row como pediste)
                  
                  // Fila 1: Título
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Producto ${index + 1}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  
                  // Fila 2: Subtítulo ("Hola" como en tu imagen)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Hola'),
                    ],
                  ),
                  
                  // Fila 3: Estrellitas
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.black),
                    ],
                  ),
                  
                  const SizedBox(height: 8), // Un pequeño espacio al final para que no quede pegado al borde
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}