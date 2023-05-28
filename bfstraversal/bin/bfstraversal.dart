import 'dart:collection';

class Graph {
  late List<List<int>> adjacencyList;
  int vertexCount;

  Graph(this.vertexCount) {
    adjacencyList = List.generate(vertexCount, (_) => []);
  }

  void addEdge(int source, int destination) {
    adjacencyList[source].add(destination);
    adjacencyList[destination].add(source);
  }

  void printGraph() {
    for (int i = 0; i < vertexCount; i++) {
      String row = "$i: ";
      for (int j = 0; j < adjacencyList[i].length; j++) {
        row += "${adjacencyList[i][j]} ";
      }
      print(row);
    }
  }

  void bfs(int startVertex) {
    Queue<int> queue = Queue();
    Set<int> visited = Set();
    List<int> bfsOrder = [];

    queue.add(startVertex);
    visited.add(startVertex);

    while (queue.isNotEmpty) {
      int currentVertex = queue.removeFirst();
      bfsOrder.add(currentVertex);

      for (int neighbor in adjacencyList[currentVertex]) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          queue.add(neighbor);
        }
      }
    }

    print('BFS order: ${bfsOrder.join(" ")}');
  }
}

void main() {
  Graph graph = Graph(5);
  graph.addEdge(0, 1);
  graph.addEdge(0, 4);
  graph.addEdge(1, 2);
  graph.addEdge(1, 3);
  graph.addEdge(1, 4);
  graph.addEdge(2, 3);
  graph.addEdge(3, 4);

  graph.printGraph();

  print(' ');
  graph.bfs(0);
}
