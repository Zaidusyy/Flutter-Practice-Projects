import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vmath; // Alias to avoid name conflicts

void main() {
  runApp(ARSortingApp());
}

class ARSortingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AR Sorting Visualizer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ARSortingHome(),
    );
  }
}

class ARSortingHome extends StatefulWidget {
  @override
  _ARSortingHomeState createState() => _ARSortingHomeState();
}

class _ARSortingHomeState extends State<ARSortingHome> {
  ArCoreController? arCoreController;
  List<int> numbers = [5, 2, 9, 1, 7]; // Example array
  List<ArCoreNode> cubes = []; // To hold 3D objects

  @override
  void dispose() {
    arCoreController?.dispose();
    super.dispose();
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    _placeCubes();
  }

  Future<void> _placeCubes() async {
    // Place cubes in AR space corresponding to array elements
    for (int i = 0; i < numbers.length; i++) {
      final material = ArCoreMaterial(color: Colors.primaries[i % Colors.primaries.length]);
      final cube = ArCoreCube(materials: [material], size: vmath.Vector3(0.1, 0.1, 0.1)); // Using vector_math alias

      final node = ArCoreNode(
        shape: cube,
        position: vmath.Vector3(i * 0.15 - 0.3, 0, -1), // Spread the cubes horizontally in front of the user
      );
      arCoreController!.addArCoreNode(node);
      cubes.add(node);
    }
  }

  Future<void> _bubbleSort() async {
    for (int i = 0; i < numbers.length - 1; i++) {
      for (int j = 0; j < numbers.length - i - 1; j++) {
        if (numbers[j] > numbers[j + 1]) {
          // Swap positions in the array
          int temp = numbers[j];
          numbers[j] = numbers[j + 1];
          numbers[j + 1] = temp;

          // Swap 3D cubes in AR space
          await _swapCubes(j, j + 1);
        }
      }
    }
  }

  Future<void> _swapCubes(int i, int j) async {
    final posI = cubes[i].position!.value; // Get Vector3 using .value
    final posJ = cubes[j].position!.value;

    // Remove and add nodes at new positions
    arCoreController!.removeNode(nodeName: cubes[i].name!);
    arCoreController!.removeNode(nodeName: cubes[j].name!);

    cubes[i].position!.value = vmath.Vector3(posJ.x, posI.y, posI.z);
    cubes[j].position!.value = vmath.Vector3(posI.x, posJ.y, posJ.z);

    arCoreController!.addArCoreNode(cubes[i]);
    arCoreController!.addArCoreNode(cubes[j]);

    // Swap cube references in the list
    final tempCube = cubes[i];
    cubes[i] = cubes[j];
    cubes[j] = tempCube;

    // Pause for a bit to visualize the swap
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AR Sorting Visualizer'),
      ),
      body: Stack(
        children: [
          ArCoreView(
            onArCoreViewCreated: _onArCoreViewCreated,
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: _bubbleSort,
              child: Text('Start Bubble Sort'),
            ),
          ),
        ],
      ),
    );
  }
}
