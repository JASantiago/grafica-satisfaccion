# grafica-satisfaccion

Respuestas de Texto:

Ciclo de vida de ViewController:
1- ViewDidLoad: sucede una vez cargan las vistas relacionadas y solo sucede una vez.
2- viewWillAppear: Sucede luego de ser cargada pero antes de ser mostrada, sucede cada vez que navegamos a dicha vista
3/4- viewWillLayoutSubViews/ viewDidLayoutSubviews: se llaman cuando cambias los valores de los bounds de las vistas
5- viewDidAppear: sucede cuando la vista es presentada
6- viewWillDisappear: sucede antes de que la vista sea removida de la jerarquia de vistas
7- viewDidDisappear: sucede cuando la vista es removida de la jerarquia

En que casos se usa weak, strong y unwoned:
estos se utilizan para el manejo del conteo de referencias y evitar memory leaks
Strong es el tipo de relacion que se crea por defecto, en caso de una referencia strong que hace referencia a otra strong se elimina
esta crea un memory leak, ya que estos valores no se liberaran de memoria porque el conteo de referencias no llegara a 0

Weak es una referencia que no protege al objeto de ser liberado de memoria, las referencias Weak no aumentan el conteo
del retain cycle, por tanto si eliminamos el objeto "padre" que tiene la referencia Strong, se liberaran ambos de memoria
porque el conteo llegara a 0 ya que la referencia weak no aumenta el conteo.

Unowned es bastante similar a weak, con la diferencia de que no es opcional por tanto solo debe ser utilizado cuando
sabers que la referencia nunca sera nil luego de inicializarse

el ARC: Automatic Reference Cycle es el encargado de manejar la memoria, cada vez que se crea una instancia de clase este la aloja en 
memoria, y cada vez que se destruye una instancia esta la libera de memoria.

Lo importante saber sobre el ARC es el conteo de las referencias, como mencionado arriba las relaciones Strong aumentan
el conteo, y para ser posible para el ARC liberar la memoria, el conteo debe llegar a 0, en caso de no llegar a 0
esto creara un memory leak, ya que no se va a poder elimiar la instancia de la referencia y por tanto el conteo nunca
llegara a 0, al no liberarse ese espacio de memoria, estamos perdiendo disponiblidad de recursos.

a los padres de nuestro querido Batman los mato Joe Chill saliendo del teatro, aunque por un momento, en la pelicula de
TeenTitans Go, estos fueron salvados (Hurra!)
