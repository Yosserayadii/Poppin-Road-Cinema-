import 'dart:math';

class Chair {
  String row;
  int column;
  int status;
  double price;

  Chair({
    required this.row,
    required this.column,
    required this.status,
    required this.price,
  });

  @override
  String toString() {
    return 'Chair{row: $row, column: $column, status: $status, price: $price}';
  }
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
        price: 30,
      ));
    }

    matrix.add(row);
  }

  return matrix;
}

void main() {
  // Example usage:
  List<List<Chair>> chairsMatrix = generateChairsMatrix(5, 4);
  print("Matrix: $chairsMatrix");
}
