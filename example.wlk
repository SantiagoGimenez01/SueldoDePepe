// Sueldo de pepe
/*
Implementar en Wollok los objetos necesarios para calcular el sueldo de Pepe.
El sueldo de pepe se calcula así: sueldo = neto + bono x presentismo + bono x resultados.
El neto es el de la categoría, hay dos categorías: gerentes que ganan $1000 de neto, y cadetes que ganan $1500.
Hay dos bonos por presentismo:
Es $100 si la persona a quien se aplica no faltó nunca, $50 si faltó un día, $0 en cualquier otro caso;
En el otro, nada.
Hay tres posibilidades para el bono por resultados:
10% sobre el neto
$80 fijos
O nada
Jugar cambiándole a pepe la categoría, la cantidad de días que falta y sus bonos por presentismo y por resultados; y preguntarle en cada caso su sueldo.
Nota: acá aparecen varios objetos, piensen bien a qué objeto le piden cada cosa que hay que saber para poder llegar al sueldo de pepe.
*/

object pepe{
  var property categoria = cadete
  var property bonoPresentismo = bonoPresentismoA 
  var property bonoResultados = bonoResultadosA 
  var faltas = 0
  method sueldo() = categoria.neto() + bonoPresentismo.valor(faltas) + bonoResultados.valor(categoria)
  method faltar(){
    faltas += 1
  }
  method recuperarDia() {
    faltas -= 1
  }
}

object gerente{
  var property neto = 1000
}

object cadete{
  var property neto = 1500 
}

object bonoPresentismoA{
  method valor(faltas){
    if(faltas == 0){
      return 100
    }else if(faltas == 1){
      return 50
    }else{
      return 0
    }
  }
}

object bonoPresentismoB {
  method valor(faltas) = 0 
}

object bonoResultadosA{
  method valor(categoria) = categoria.neto()/10 
}

object bonoResultadosB{
  method valor(categoria) = 80
}

object bonoResultadosC{
  method valor(categoria) = 0 
}
