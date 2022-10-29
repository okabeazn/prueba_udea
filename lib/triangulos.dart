class Triangulo {
  late int ladoA, ladoB, ladoC;
  late String tipo, img;

  Triangulo(this.ladoA, this.ladoB, this.ladoC);

  void tipoTriangulo() {
    if (ladoA > 0 && ladoB > 0 && ladoC > 0) {
      if (ladoA == ladoB && ladoB == ladoC) {
        tipo = "Equilatero";
        img = "assets/images/equilatero.png";
      } else if (ladoA == ladoB || ladoB == ladoC || ladoA == ladoC) {
        tipo = "Isoceles";
        img = "assets/images/isoceles.png";
      } else {
        tipo = "Escaleno";
        img = "assets/images/escaleno.png";
      }
    } else {
      tipo = "No es triangulo";
      img = "assets/images/error.png";
    }
  }
}
