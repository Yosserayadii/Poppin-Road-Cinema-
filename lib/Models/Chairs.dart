import 'dart:math';

class Chair {
  String row;
  int column;
  int status;
  double price;

  Chair(
      {required this.row,
      required this.column,
      required this.status,
      required this.price});
}

List<List<Chair>> generateChairsMatrix(int columns, int rows) {
  List<List<Chair>> matrix = [];
  Random random = Random();

  for (int i = 0; i < rows; i++) {
    List<Chair> row = [];
    for (int j = 0; j < columns; j++) {
      String alphabetRow = String.fromCharCode('A'.codeUnitAt(0) + i);
      row.add(Chair(
          row: alphabetRow,
          column: j + 1,
          status: random.nextInt(2),
          // Generate a random double between 20.0 and 100.0 with increments of 0.5
          price: (20.0 + random.nextInt(61) * 0.5)));
    }

    matrix.add(row);
  }

  return matrix;
}
