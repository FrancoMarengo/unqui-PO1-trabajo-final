# unqui-PO1-trabajo-final
Trabajo final de Programación con objetos 1 en la Universidad Nacional de Quilmes, en colaboración con otro compañero.

Este trabajo fue desarrollado en 2 semanas con la ayuda de un compañero de universidad, en donde se nos planteó una consigna a resolver (adjunta en este archivo).
La solución fue realizada en CuisUniversity, utilizando el lenguaje Smalltalk, utilizando Test-Driven Development.

CONSIGNA: 

Carmen Sandiego
Carmen Sandiego es un juego donde un objeto de valor histórico es robado de un país y el
detective debe encontrar al delincuente, persiguiéndole a través de diferentes países del
mundo.
Para poder crear una partida, se necesita tener el listado de sospechosos (donde se encuentra
el ladrón), los países para viajar y el detective asignado ubicado en el país donde se efectuó el
robo. Además, es una partida a contrarreloj, es decir, que el detective tiene un límite de tiempo
para encontrar al delincuente, si el tiempo se agota la partida es considerada perdida.
Al ser un agente internacional, el detective tiene la posibilidad de viajar a otro país lo que
implica que debe esperar una cierta cantidad de horas definidas por el departamento de
migraciones del país destino, a esto se le suma la cantidad de tiempo que le consume el mismo
viaje. Aunque si este viaja a un país limítrofe, el tiempo de viaje hacia el país es acortado a la
mitad.
Para poder recolectar información, un detective podrá obtener pistas interrogando a los testigos
del país en que se encuentra actualmente. Hay tres testigos por país. Una de las pistas
obtenidas le indicará a qué país viajar para perseguir al delincuente y las otras dos le otorgará
datos del mismo, si el detective se equivoca de destino y viaja a un país donde el ladrón nunca
estuvo, los testigos sólo dirán que no vieron a ningún sospechoso, por ende no obtiene
información.
Cada vez que el detective interrogue a un testigo, este perderá un cierto tiempo interrogándolo
dependiendo de la habilidad del detective multiplicada por la dificultad que tenga el testigo
interrogado.
Cuando el detective obtiene una pista sobre el aspecto del delincuente, deberá anotarla en su
PDA (Personal Digital Assistant) para poder consultarlas en el futuro.
Se puede en cualquier momento filtrar los sospechosos usando las pistas obtenidas.
En cualquier momento el detective puede emitir una orden de arresto a un sospechoso
cualquiera. La partida se considera ganada si resulta ser el ladrón, pero, si se equivoca,
entonces se considera perdida.
De los sospechosos sabemos los siguientes datos:
● Nombre
● Color de ojos
● Forma del cabello (pelado, corto, largo, lacio, ondulado, etc)
● Color de cabello
Cada pista nos devuelve 1 característica de un sospechoso, podría ser repetida.
Implemente el Carmen Sandiego teniendo en cuenta que:
● Se debe poder obtener una lista de sospechosos dadas unas características
● Los testigos pueden darte pistas repetidas, pero no se vuelven a agregar.
● Puede que no se requieran todas las pistas para arrestar a un sospechoso.
Por ejemplo, si la primera pista que obtiene el detective es que el culpable tiene el
cabello negro y solo un sospechoso tiene cabello negro, la orden de arresto podría ser
emitida inmediatamente.
● Debe decrementarse el tiempo restante cuando se viaja o se interroga según
corresponda.
● Si el detective se queda sin tiempo, la partida se considera perdida.
● Cada país tiene un objeto de valor que puede ser robado.
● Existen distintos detectives: El clásico, el persuasivo y el de Interpol.
El clásico obtiene 1 pista al interrogar un testigo y pierde 2 horas, cuando viaja a otro
país pierde 10 horas.
El persuasivo es hábil interrogando testigos, a cada testigo le saca 2 pistas y sólo pierde
1 hora interrogando.
El de Interpol tiene más contactos y pasaportes por lo que sus viajes a otros países se
realizan en menor tiempo. El tiempo de migraciones es anulado.
● Poder realizar una orden de arresto.
● Tiene que ser posible imprimir el estado final de la partida tras emitir una orden de
arresto en un archivo.
El archivo tiene que contener
○ El nombre del ladrón junto con sus características.
○ El objeto que robó
○ La ruta de escape del ladrón, es decir, los países por donde viajó.
○ El tiempo restante de la partida
○ Si ganó o perdió el detective
