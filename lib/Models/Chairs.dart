class Chair {
  int row;
  int column;
  int status;

  Chair({required this.row, required this.column, required this.status});

  factory Chair.free(int row, int column) {
    return Chair(row: row, column: column, status: 1); // 1 represents free
  }

  factory Chair.reserved(int row, int column) {
    return Chair(row: row, column: column, status: 2); // 2 represents reserved
  }

  factory Chair.notAvailable(int row, int column) {
    return Chair(
        row: row, column: column, status: 3); // 3 represents not available
  }
}
