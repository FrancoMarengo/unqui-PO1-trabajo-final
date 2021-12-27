!classDefinition: #DetectiveTest category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
TestCase subclass: #DetectiveTest
	instanceVariableNames: 'pistaDePaisEEUU canadaCon5HorasDeEspera mexicoCon3HorasDeEspera eeuuCon1HoraDeEspera unDetectiveClasicoEnMexico unDetectivePersuasivoEnCanada unDetectiveInterpolEnEeuu objetoDeValorGioconda unaPartidaNuevaDeCarmenSandiego nombreCarlos nombreJuan colorDeOjosAzul formaDelCabelloLacio formaDelCabelloOndulado colorDeCabelloCastaño colorDeCabelloRubio sospechosoCarlos sospechosoJuan pistaDeAspectoColorDeOjosAzul pistaDeAspectoFormaDeCabelloLacio unTestigoEnMexicoConPistaDePaisEeuu unTestigoEnMexicoSinPistaDePais unTestigoEnMexicoConPistaDeAspectoColorDeOjosAzul unTestigoEnMexicoConPistaDeAspectoFormaDeCabelloLacio unTestigoEnCanadaConPistaDeAspectoColorDeOjosAzul unTestigoEnCanadaConPistaDeAspectoFormaDeCabelloLacio testigoEnCanadaConPistaDePaisEeuu unaPistaDePaisMexico testigoEnEeuuConPistaPaisMexico testigoEnEeuuSinPistaDePais unTestigoEnEeuuConPistaDeAspectoColorDeOjosAzul unTestigoEnEeuuConPistaDeAspectoFormaDeCabelloLacio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!DetectiveTest methodsFor: 'detectiveClasico-tests' stamp: 'FM 12/3/2021 17:13:04'!
test001_CuandoUnDetectiveClasicoSeEncuentraEnMexico

	
	Assert that: unDetectiveClasicoEnMexico ubicacion isEqualTo: mexicoCon3HorasDeEspera .! !

!DetectiveTest methodsFor: 'detectiveClasico-tests' stamp: 'FM 12/3/2021 17:13:07'!
test002_CuandoUnDetectiveClasicoViaja_EntoncesSuUbicacionCambia
	
	unDetectiveClasicoEnMexico viajarA: canadaCon5HorasDeEspera .
	
	Assert that: unDetectiveClasicoEnMexico ubicacion isEqualTo: canadaCon5HorasDeEspera .
	! !

!DetectiveTest methodsFor: 'detectiveClasico-tests' stamp: 'FM 12/3/2021 17:13:10'!
test003_CuandoUnDetectiveClasicoViajaAUnPaisLimitrofe_EntoncesElTiempoDeVueloNoSeAcortaALaMitad


	Assert that: (unDetectiveClasicoEnMexico tiempoDeVueloHacia: canadaCon5HorasDeEspera ) isEqualTo: 10 * hour.! !

!DetectiveTest methodsFor: 'detectiveClasico-tests' stamp: 'FM 12/3/2021 17:13:13'!
test004_CuandoUnDetectiveClasicoViajaAUnPaisLimitrofe_EntoncesElTiempoDeVueloSeAcortaALaMitad

	mexicoCon3HorasDeEspera agregarPaisLimitrofe: { eeuuCon1HoraDeEspera }.
	
	Assert that: (unDetectiveClasicoEnMexico tiempoDeVueloHacia: eeuuCon1HoraDeEspera ) isEqualTo: 5 * hour.! !

!DetectiveTest methodsFor: 'detectiveClasico-tests' stamp: 'FM 12/9/2021 22:07:01'!
test005_CuandoUnDetectiveClasicoInterrogaAUnTestigoConPistaDePais_EntoncesLaObtiene

	unDetectiveClasicoEnMexico interrogarPorPistaPaisA: unTestigoEnMexicoConPistaDePaisEeuu .
	
	Assert that: unDetectiveClasicoEnMexico pistaDePais isEqualTo: pistaDePaisEEUU .! !

!DetectiveTest methodsFor: 'detectiveClasico-tests' stamp: 'FM 12/9/2021 22:08:10'!
test006_CuandoUnDetectiveClasicoInterrogaAUnTestigoSinPistaDePais
	
	unDetectiveClasicoEnMexico interrogarPorPistaPaisA: unTestigoEnMexicoSinPistaDePais .
	
	Assert isTrue: (unDetectiveClasicoEnMexico noTienePistaDePais).! !

!DetectiveTest methodsFor: 'detectiveClasico-tests' stamp: 'FM 12/3/2021 17:13:24'!
test007_CuandoUnDetectiveClasicoIntentaViajarAlPaisDondeSeEncuentra_EntoncesSeProduceUnError

	Assert should: [unDetectiveClasicoEnMexico viajarA: mexicoCon3HorasDeEspera ]
	             signal: Error
	             withDescription: Detective errorViajeMismoPais.
	! !

!DetectiveTest methodsFor: 'detectiveClasico-tests' stamp: 'FM 12/6/2021 14:58:11'!
test008_CuandoUnDetectiveClasicoInterrogaAUnTestigoConPistasDeAspecto_EntoncesObtieneUnaPistaDeAspecto
	
	| unTestigoEnMexicoConPistaDeAspecto pistaDeAspectoOjosAzules aspectoColorDeOjosAzul|

	aspectoColorDeOjosAzul _ ColorDeOjos es: 'Azul'.
	pistaDeAspectoOjosAzules _ PistaDeAspectoValida descripcion: aspectoColorDeOjosAzul.
	unTestigoEnMexicoConPistaDeAspecto _ Testigo ubicadoEn: mexicoCon3HorasDeEspera conNivelDeDificultad: 1.
	
	unTestigoEnMexicoConPistaDeAspecto agregarPistaDeAspecto: pistaDeAspectoOjosAzules.
	
	unDetectiveClasicoEnMexico interrogarPorPistaAspectoA: unTestigoEnMexicoConPistaDeAspecto.
	
	Assert isTrue: [unDetectiveClasicoEnMexico tienePistaDeAspectoAnotadas ].! !

!DetectiveTest methodsFor: 'detectiveClasico-tests' stamp: 'FM 12/9/2021 22:13:02'!
test009_CuandoUnDetectiveClasicoInterrogaALosTestigosDeUnPais_EntoncesObtieneLasPistasQueTenganEstosTestigos

	mexicoCon3HorasDeEspera agregarTestigo: unTestigoEnMexicoConPistaDePaisEeuu .
	mexicoCon3HorasDeEspera agregarTestigo: unTestigoEnMexicoConPistaDeAspectoColorDeOjosAzul .
	mexicoCon3HorasDeEspera agregarTestigo: unTestigoEnMexicoConPistaDeAspectoFormaDeCabelloLacio .
	
	unDetectiveClasicoEnMexico interrogarTestigosDelPaisActual.
	
	Assert isTrue: ( unDetectiveClasicoEnMexico pistasDeAspecto includes: pistaDeAspectoColorDeOjosAzul ).
	Assert isTrue: ( unDetectiveClasicoEnMexico pistasDeAspecto includes: pistaDeAspectoFormaDeCabelloLacio ).
	Assert that: unDetectiveClasicoEnMexico pistaDePais isEqualTo: pistaDePaisEEUU.
	

	! !

!DetectiveTest methodsFor: 'detectiveClasico-tests' stamp: 'FM 12/9/2021 22:13:38'!
test010_CuandoUnDetectiveClasicoIntentaInterrogarAUnTestigoQueEstaEnOtroPais_EntoncesSeProduceUnError
	
	| unTestigoEnCanada |
	
	unTestigoEnCanada _ Testigo ubicadoEn: canadaCon5HorasDeEspera conNivelDeDificultad: 1.
	
	Assert should: [unDetectiveClasicoEnMexico interrogarPorPistaAspectoA: unTestigoEnCanada ]
	             signal: Error
	             withDescription: Detective errorTestigoEnDistintoPaisQueDetective.
	
	Assert should: [unDetectiveClasicoEnMexico interrogarPorPistaPaisA: unTestigoEnCanada ]
	             signal: Error
	             withDescription: Detective errorTestigoEnDistintoPaisQueDetective.
! !

!DetectiveTest methodsFor: 'detectiveClasico-tests' stamp: 'FM 12/4/2021 11:32:13'!
test011_CuandoUnDetectiveClasicoViajaAUnPaisLimitrofeEntoncesElTiempoDeViajeTotalDependeDeLaMitadDeLasHorasDeVueloYElTiempoDeEsperaEnMigraciones

    | tiempoDeViajeEsperado |

    eeuuCon1HoraDeEspera agregarPaisLimitrofe: { mexicoCon3HorasDeEspera }.
    tiempoDeViajeEsperado _ (unDetectiveClasicoEnMexico tiempoDeVueloHacia: eeuuCon1HoraDeEspera ) + (eeuuCon1HoraDeEspera tiempoDeEsperaEnMigraciones ).

    Assert that: (unDetectiveClasicoEnMexico tiempoDeViajeTotalPorIrHacia: eeuuCon1HoraDeEspera ) isEqualTo: tiempoDeViajeEsperado.! !

!DetectiveTest methodsFor: 'detectiveClasico-tests' stamp: 'FM 12/4/2021 16:12:08'!
test012_CuandoUnDetectiveClasicoInterrogaAUnTestigo_EntoncesPierdeTiempo
	
	| unTestigoEnMexicoConNivelDeDificultad5 tiempoTotalPorInterrogarAlTestigo |
	
	unTestigoEnMexicoConNivelDeDificultad5 _ Testigo ubicadoEn: mexicoCon3HorasDeEspera conNivelDeDificultad: 5.
	tiempoTotalPorInterrogarAlTestigo _ (unDetectiveClasicoEnMexico habilidadDeInterrogación) * (unTestigoEnMexicoConNivelDeDificultad5 nivelDeDificultad).
	
	Assert that: (unDetectiveClasicoEnMexico tiempoPorInterrogarA: unTestigoEnMexicoConNivelDeDificultad5) isEqualTo: tiempoTotalPorInterrogarAlTestigo.! !

!DetectiveTest methodsFor: 'detectiveClasico-tests' stamp: 'FM 12/9/2021 21:11:58'!
test013_CuandoUnDetectiveClasicoRealizaUnaOrdenDeArrestoCorrecta

	| ordenDeArrestoAcertada delincuente |
	
	delincuente _ sospechosoJuan.
	delincuente robarObjetoDeValorDe: canadaCon5HorasDeEspera.
	ordenDeArrestoAcertada _ unDetectiveClasicoEnMexico realizarOrdenDeArrestoHacia: delincuente para: unaPartidaNuevaDeCarmenSandiego.
	
	Assert isTrue: ordenDeArrestoAcertada esOrdenDeArrestoAcertada. ! !

!DetectiveTest methodsFor: 'detectiveClasico-tests' stamp: 'FM 12/9/2021 21:13:22'!
test014_CuandoUnDetectiveClasicoRealizaUnaOrdenDeArrestoErrada

	| ordenDeArrestoErrada |
	
	sospechosoCarlos robarObjetoDeValorDe: canadaCon5HorasDeEspera.
	ordenDeArrestoErrada _ unDetectiveClasicoEnMexico realizarOrdenDeArrestoHacia: sospechosoJuan para: unaPartidaNuevaDeCarmenSandiego.
	
	Assert isFalse: ordenDeArrestoErrada esOrdenDeArrestoAcertada.! !


!DetectiveTest methodsFor: 'detectivePersuasivo-tests' stamp: 'FM 12/3/2021 17:13:43'!
test001_CuandoUnDetectivePersuasivoSeEncuentraEnCanada

	
	Assert that: unDetectivePersuasivoEnCanada ubicacion isEqualTo: canadaCon5HorasDeEspera .! !

!DetectiveTest methodsFor: 'detectivePersuasivo-tests' stamp: 'FM 12/3/2021 17:14:40'!
test002_CuandoUnDetectivePersuasivoViaja_EntoncesSuUbicacionCambia
	
	unDetectivePersuasivoEnCanada viajarA: mexicoCon3HorasDeEspera .
	
	Assert that: unDetectivePersuasivoEnCanada ubicacion isEqualTo: mexicoCon3HorasDeEspera .
	! !

!DetectiveTest methodsFor: 'detectivePersuasivo-tests' stamp: 'FM 12/3/2021 17:14:45'!
test003_CuandoUnDetectivePersuasivoViajaAUnPaisNoLimitrofe_EntoncesElTiempoDeVueloNoSeAcortaALaMitad

	Assert that: (unDetectivePersuasivoEnCanada tiempoDeVueloHacia: eeuuCon1HoraDeEspera ) isEqualTo: 10 * hour.! !

!DetectiveTest methodsFor: 'detectivePersuasivo-tests' stamp: 'FM 12/3/2021 17:14:30'!
test004_CuandoUnDetectivePersuasivoViajaAUnPaisLimitrofe_EntoncesElTiempoDeVueloSeAcortaALaMitad

	canadaCon5HorasDeEspera agregarPaisLimitrofe: { eeuuCon1HoraDeEspera }.
	
	Assert that: (unDetectivePersuasivoEnCanada tiempoDeVueloHacia: eeuuCon1HoraDeEspera ) isEqualTo: 5 * hour.! !

!DetectiveTest methodsFor: 'detectivePersuasivo-tests' stamp: 'FM 12/6/2021 10:50:19'!
test005_CuandoUnDetectivePersuasivoInterrogaAUnTestigoConPistaDePais_EntoncesLaObtiene

	| unTestigoEnCanadaConPistaDePaisEeuu pistaDePaisEeuu |
	
	pistaDePaisEeuu _ PistaDePaisValida delPais: eeuuCon1HoraDeEspera.
	unTestigoEnCanadaConPistaDePaisEeuu _ Testigo ubicadoEn: canadaCon5HorasDeEspera conNivelDeDificultad: 1.
	unTestigoEnCanadaConPistaDePaisEeuu agregarPistaDePais: pistaDePaisEeuu.
	
	unDetectivePersuasivoEnCanada interrogarPorPistaPaisA: unTestigoEnCanadaConPistaDePaisEeuu.
	
	Assert that: unDetectivePersuasivoEnCanada pistaDePais isEqualTo: pistaDePaisEeuu .! !

!DetectiveTest methodsFor: 'detectivePersuasivo-tests' stamp: 'FM 12/9/2021 22:14:10'!
test006_CuandoUnDetectivePersuasivoInterrogaAUnTestigoSinPistaDePais

	| testigoEnCanadaSinPistaDePais |

	testigoEnCanadaSinPistaDePais _ Testigo ubicadoEn: canadaCon5HorasDeEspera conNivelDeDificultad: 1.
	
	unDetectivePersuasivoEnCanada interrogarPorPistaPaisA: testigoEnCanadaSinPistaDePais .
	
	Assert isTrue: (unDetectivePersuasivoEnCanada noTienePistaDePais).! !

!DetectiveTest methodsFor: 'detectivePersuasivo-tests' stamp: 'FM 12/4/2021 11:07:16'!
test007_CuandoUnDetectivePersuasivoIntentaViajarAlPaisDondeSeEncuentra_EntoncesSeProduceUnError

	Assert should: [unDetectivePersuasivoEnCanada viajarA: canadaCon5HorasDeEspera ]
	             signal: Error
	             withDescription: Detective errorViajeMismoPais.
	! !

!DetectiveTest methodsFor: 'detectivePersuasivo-tests' stamp: 'FM 12/6/2021 14:59:11'!
test008_CuandoUnDetectivePersuasivoInterrogaAUnTestigoConPistasDeAspecto_EntoncesObtieneUnaPistaDeAspecto

	| unTestigoEnCanadaConPistaDeAspecto pistaDeAspectoOjosAzules aspectoColorDeOjosAzul|

	aspectoColorDeOjosAzul _ ColorDeOjos es: 'Azul'.
	pistaDeAspectoOjosAzules _ PistaDeAspectoValida descripcion: aspectoColorDeOjosAzul.
	unTestigoEnCanadaConPistaDeAspecto _ Testigo ubicadoEn: canadaCon5HorasDeEspera conNivelDeDificultad: 1.
	
	unTestigoEnCanadaConPistaDeAspecto agregarPistaDeAspecto: pistaDeAspectoOjosAzules.
	
	unDetectivePersuasivoEnCanada interrogarPorPistaAspectoA: unTestigoEnCanadaConPistaDeAspecto.
	
	Assert isTrue: [unDetectivePersuasivoEnCanada tienePistaDeAspectoAnotadas ].! !

!DetectiveTest methodsFor: 'detectivePersuasivo-tests' stamp: 'FM 12/9/2021 22:17:36'!
test009_CuandoUnDetectivePersuasivoInterrogaALosTestigosDeUnPais_EntoncesObtieneLasPistasQueTenganEstosTestigos

	canadaCon5HorasDeEspera agregarTestigo: testigoEnCanadaConPistaDePaisEeuu .
	canadaCon5HorasDeEspera agregarTestigo: unTestigoEnCanadaConPistaDeAspectoColorDeOjosAzul .
	canadaCon5HorasDeEspera agregarTestigo: unTestigoEnCanadaConPistaDeAspectoFormaDeCabelloLacio .
	
	unDetectivePersuasivoEnCanada interrogarTestigosDelPaisActual.
	
	Assert isTrue: ( unDetectivePersuasivoEnCanada pistasDeAspecto includes: pistaDeAspectoColorDeOjosAzul ).
	Assert isTrue: ( unDetectivePersuasivoEnCanada pistasDeAspecto includes: pistaDeAspectoFormaDeCabelloLacio ).
	Assert that: unDetectivePersuasivoEnCanada pistaDePais isEqualTo: pistaDePaisEEUU.
	! !

!DetectiveTest methodsFor: 'detectivePersuasivo-tests' stamp: 'FM 12/9/2021 22:22:06'!
test010_CuandoUnDetectivePersuasivoIntentaInterrogarAUnTestigoQueEstaEnOtroPais_EntoncesSeProduceUnError
	
	| unTestigoEnMexico |
	
	unTestigoEnMexico _ Testigo ubicadoEn: mexicoCon3HorasDeEspera conNivelDeDificultad: 1.
	
	Assert should: [unDetectivePersuasivoEnCanada interrogarPorPistaAspectoA: unTestigoEnMexico ]
	             signal: Error
	             withDescription: Detective errorTestigoEnDistintoPaisQueDetective.
	
	Assert should: [unDetectivePersuasivoEnCanada interrogarPorPistaPaisA: unTestigoEnMexico ]
	             signal: Error
	             withDescription: Detective errorTestigoEnDistintoPaisQueDetective.! !

!DetectiveTest methodsFor: 'detectivePersuasivo-tests' stamp: 'FM 12/4/2021 11:34:10'!
test011_CuandoUnDetectivePersuasivoViajaAUnPaisLimitrofeEntoncesElTiempoDeViajeTotalDependeDeLaMitadDeLasHorasDeVueloYElTiempoDeEsperaEnMigraciones

    | tiempoDeViajeEsperado |

    canadaCon5HorasDeEspera agregarPaisLimitrofe: { eeuuCon1HoraDeEspera }.
    tiempoDeViajeEsperado _ (unDetectivePersuasivoEnCanada tiempoDeVueloHacia: eeuuCon1HoraDeEspera ) + (eeuuCon1HoraDeEspera tiempoDeEsperaEnMigraciones ).

    Assert that: (unDetectivePersuasivoEnCanada tiempoDeViajeTotalPorIrHacia: eeuuCon1HoraDeEspera ) isEqualTo: tiempoDeViajeEsperado.! !

!DetectiveTest methodsFor: 'detectivePersuasivo-tests' stamp: 'FM 12/4/2021 16:14:00'!
test012_CuandoUnDetectivePersuasivoInterrogaAUnTestigo_EntoncesPierdeTiempo

	| unTestigoEnCanadaConNivelDeDificultad5 tiempoTotalPorInterrogarAlTestigo |
	
	unTestigoEnCanadaConNivelDeDificultad5 _ Testigo ubicadoEn: canadaCon5HorasDeEspera conNivelDeDificultad: 5.
	tiempoTotalPorInterrogarAlTestigo _ (unDetectivePersuasivoEnCanada habilidadDeInterrogación) * (unTestigoEnCanadaConNivelDeDificultad5 nivelDeDificultad).
	
	Assert that: (unDetectivePersuasivoEnCanada tiempoPorInterrogarA: unTestigoEnCanadaConNivelDeDificultad5) isEqualTo: tiempoTotalPorInterrogarAlTestigo.! !

!DetectiveTest methodsFor: 'detectivePersuasivo-tests' stamp: 'FM 12/9/2021 21:13:58'!
test013_CuandoUnDetectivePersuasivoRealizaUnaOrdenDeArrestoCorrecta

	| ordenDeArrestoAcertada delincuente |
	
	delincuente _ sospechosoJuan.
	delincuente robarObjetoDeValorDe: canadaCon5HorasDeEspera.
	ordenDeArrestoAcertada _ unDetectivePersuasivoEnCanada realizarOrdenDeArrestoHacia: delincuente para: unaPartidaNuevaDeCarmenSandiego.
	
	Assert isTrue: ordenDeArrestoAcertada esOrdenDeArrestoAcertada. ! !

!DetectiveTest methodsFor: 'detectivePersuasivo-tests' stamp: 'FM 12/9/2021 21:14:42'!
test014_CuandoUnDetectivePersuasivoRealizaUnaOrdenDeArrestoErrada

	| ordenDeArrestoErrada |
	
	sospechosoCarlos robarObjetoDeValorDe: canadaCon5HorasDeEspera.
	ordenDeArrestoErrada _ unDetectivePersuasivoEnCanada realizarOrdenDeArrestoHacia: sospechosoJuan para: unaPartidaNuevaDeCarmenSandiego.
	
	Assert isFalse: ordenDeArrestoErrada esOrdenDeArrestoAcertada.! !


!DetectiveTest methodsFor: 'detectiveInterpol-tests' stamp: 'FM 12/3/2021 17:15:32'!
test001_CuandoUnDetectiveInterpolSeEncuentraEnEEUU

	
	Assert that: unDetectiveInterpolEnEeuu ubicacion isEqualTo: eeuuCon1HoraDeEspera .! !

!DetectiveTest methodsFor: 'detectiveInterpol-tests' stamp: 'FM 12/3/2021 17:15:36'!
test002_CuandoUnDetectiveInterpolViaja_EntoncesSuUbicacionCambia
	
	unDetectiveInterpolEnEeuu viajarA: canadaCon5HorasDeEspera .
	
	Assert that: unDetectiveInterpolEnEeuu ubicacion isEqualTo: canadaCon5HorasDeEspera .
	! !

!DetectiveTest methodsFor: 'detectiveInterpol-tests' stamp: 'FM 12/3/2021 17:15:39'!
test003_CuandoUnDetectiveInterpolViajaAUnPaisNoLimitrofe_EntoncesElTiempoDeVueloNoSeAcortaALaMitad


	Assert that: (unDetectiveInterpolEnEeuu tiempoDeVueloHacia: eeuuCon1HoraDeEspera ) isEqualTo: 8 * hour.! !

!DetectiveTest methodsFor: 'detectiveInterpol-tests' stamp: 'FM 12/3/2021 17:15:43'!
test004_CuandoUnDetectiveInterpolViajaAUnPaisLimitrofe_EntoncesElTiempoDeVueloSeAcortaALaMitad

	eeuuCon1HoraDeEspera agregarPaisLimitrofe: { mexicoCon3HorasDeEspera }.
	
	Assert that: (unDetectiveInterpolEnEeuu tiempoDeVueloHacia: mexicoCon3HorasDeEspera ) isEqualTo: 4 * hour.! !

!DetectiveTest methodsFor: 'detectiveInterpol-tests' stamp: 'FM 12/9/2021 22:24:58'!
test005_CuandoUnDetectiveInterpolInterrogaAUnTestigoConPistaDePais_EntoncesLaObtiene
	
	
	unDetectiveInterpolEnEeuu interrogarPorPistaPaisA: testigoEnEeuuConPistaPaisMexico.
	
	Assert that: unDetectiveInterpolEnEeuu pistaDePais isEqualTo: unaPistaDePaisMexico .! !

!DetectiveTest methodsFor: 'detectiveInterpol-tests' stamp: 'FM 12/9/2021 22:26:09'!
test006_CuandoUnDetectiveInterpolInterrogaAUnTestigoSinPistaDePais

	unDetectiveInterpolEnEeuu interrogarPorPistaPaisA: testigoEnEeuuSinPistaDePais .
	
	Assert isTrue: (unDetectiveInterpolEnEeuu noTienePistaDePais)! !

!DetectiveTest methodsFor: 'detectiveInterpol-tests' stamp: 'FM 12/4/2021 11:08:45'!
test007_CuandoUnDetectiveInterpolIntentaViajarAlPaisDondeSeEncuentra_EntoncesSeProduceUnError

	Assert should: [unDetectiveInterpolEnEeuu viajarA: eeuuCon1HoraDeEspera ]
	             signal: Error
	             withDescription: Detective errorViajeMismoPais.! !

!DetectiveTest methodsFor: 'detectiveInterpol-tests' stamp: 'FM 12/6/2021 14:59:43'!
test008_CuandoUnDetectiveInterpolInterrogaAUnTestigoConPistasDeAspecto_EntoncesObtieneUnaPistaDeAspecto

	| unTestigoEnEeuuConPistaDeAspecto pistaDeAspectoOjosAzules aspectoColorDeOjosAzul|

	aspectoColorDeOjosAzul _ ColorDeOjos es: 'Azul'.
	pistaDeAspectoOjosAzules _ PistaDeAspectoValida descripcion: aspectoColorDeOjosAzul.
	unTestigoEnEeuuConPistaDeAspecto _ Testigo ubicadoEn: eeuuCon1HoraDeEspera conNivelDeDificultad: 1.
	
	unTestigoEnEeuuConPistaDeAspecto agregarPistaDeAspecto: pistaDeAspectoOjosAzules.
	
	unDetectiveInterpolEnEeuu interrogarPorPistaAspectoA: unTestigoEnEeuuConPistaDeAspecto.
	
	Assert isTrue: [unDetectiveInterpolEnEeuu tienePistaDeAspectoAnotadas ].! !

!DetectiveTest methodsFor: 'detectiveInterpol-tests' stamp: 'FM 12/9/2021 22:28:28'!
test009_CuandoUnDetectiveInterpolInterrogaALosTestigosDeUnPais_EntoncesObtieneLasPistasQueTenganEstosTestigos

	eeuuCon1HoraDeEspera agregarTestigo: testigoEnEeuuConPistaPaisMexico .
	eeuuCon1HoraDeEspera agregarTestigo: unTestigoEnEeuuConPistaDeAspectoColorDeOjosAzul .
	eeuuCon1HoraDeEspera agregarTestigo: unTestigoEnEeuuConPistaDeAspectoFormaDeCabelloLacio .
	
	unDetectiveInterpolEnEeuu interrogarTestigosDelPaisActual.
	
	Assert isTrue: ( unDetectiveInterpolEnEeuu pistasDeAspecto includes: pistaDeAspectoColorDeOjosAzul ).
	Assert isTrue: ( unDetectiveInterpolEnEeuu pistasDeAspecto includes: pistaDeAspectoFormaDeCabelloLacio ).
	Assert that: unDetectiveInterpolEnEeuu pistaDePais isEqualTo: unaPistaDePaisMexico .
	! !

!DetectiveTest methodsFor: 'detectiveInterpol-tests' stamp: 'FM 12/9/2021 22:28:41'!
test010_CuandoUnDetectiveInterpolIntentaInterrogarAUnTestigoQueEstaEnOtroPais_EntoncesSeProduceUnError
	
	| unTestigoEnMexico |
	
	unTestigoEnMexico _ Testigo ubicadoEn: mexicoCon3HorasDeEspera conNivelDeDificultad: 1.
	
	Assert should: [unDetectiveInterpolEnEeuu interrogarPorPistaAspectoA: unTestigoEnMexico ]
	             signal: Error
	             withDescription: Detective errorTestigoEnDistintoPaisQueDetective.
	
	Assert should: [unDetectiveInterpolEnEeuu interrogarPorPistaPaisA: unTestigoEnMexico ]
	             signal: Error
	             withDescription: Detective errorTestigoEnDistintoPaisQueDetective.! !

!DetectiveTest methodsFor: 'detectiveInterpol-tests' stamp: 'FM 12/4/2021 11:34:59'!
test011_CuandoUnDetectiveInterpolViajaAUnPaisLimitrofeEntoncesElTiempoDeViajeTotalDependeDeLaMitadDeLasHorasDeVueloYElTiempoDeEsperaEnMigraciones

    | tiempoDeViajeEsperado |

    eeuuCon1HoraDeEspera agregarPaisLimitrofe: { mexicoCon3HorasDeEspera }.
    tiempoDeViajeEsperado _ (unDetectiveInterpolEnEeuu tiempoDeVueloHacia: mexicoCon3HorasDeEspera ) + (mexicoCon3HorasDeEspera tiempoDeEsperaEnMigraciones ).

    Assert that: (unDetectiveInterpolEnEeuu tiempoDeViajeTotalPorIrHacia: mexicoCon3HorasDeEspera ) isEqualTo: tiempoDeViajeEsperado.! !

!DetectiveTest methodsFor: 'detectiveInterpol-tests' stamp: 'FM 12/4/2021 16:15:53'!
test012_CuandoUnDetectiveInterpolInterrogaAUnTestigo_EntoncesPierdeTiempo
	
	| unTestigoEnEeuuConNivelDeDificultad5 tiempoTotalPorInterrogarAlTestigo |
	
	unTestigoEnEeuuConNivelDeDificultad5 _ Testigo ubicadoEn: eeuuCon1HoraDeEspera conNivelDeDificultad: 5.
	tiempoTotalPorInterrogarAlTestigo _ (unDetectiveInterpolEnEeuu habilidadDeInterrogación) * (unTestigoEnEeuuConNivelDeDificultad5 nivelDeDificultad).
	
	Assert that: (unDetectiveInterpolEnEeuu tiempoPorInterrogarA: unTestigoEnEeuuConNivelDeDificultad5) isEqualTo: tiempoTotalPorInterrogarAlTestigo.! !

!DetectiveTest methodsFor: 'detectiveInterpol-tests' stamp: 'FM 12/9/2021 21:14:25'!
test013_CuandoUnDetectiveInterpolRealizaUnaOrdenDeArrestoCorrecta

	| ordenDeArrestoAcertada delincuente |
	
	delincuente _ sospechosoJuan.
	delincuente robarObjetoDeValorDe: canadaCon5HorasDeEspera.
	ordenDeArrestoAcertada _ unDetectiveInterpolEnEeuu realizarOrdenDeArrestoHacia: delincuente para: unaPartidaNuevaDeCarmenSandiego.
	
	Assert isTrue: ordenDeArrestoAcertada esOrdenDeArrestoAcertada. ! !

!DetectiveTest methodsFor: 'detectiveInterpol-tests' stamp: 'FM 12/9/2021 21:14:58'!
test014_CuandoUnDetectiveInterpolRealizaUnaOrdenDeArrestoErrada

	| ordenDeArrestoErrada |
	
	sospechosoCarlos robarObjetoDeValorDe: canadaCon5HorasDeEspera.
	ordenDeArrestoErrada _ unDetectiveInterpolEnEeuu realizarOrdenDeArrestoHacia: sospechosoJuan para: unaPartidaNuevaDeCarmenSandiego.
	
	Assert isFalse: ordenDeArrestoErrada esOrdenDeArrestoAcertada.! !


!DetectiveTest methodsFor: 'setUp/tearDown' stamp: 'FM 12/9/2021 22:28:09'!
setUp

	objetoDeValorGioconda _ ObjetoDeValorIntacto conNombre: 'Gioconda'.
	
	canadaCon5HorasDeEspera _ Pais conNombre: 'Canada' tiempoDeEspera: 5 * hour objetoDeValor: objetoDeValorGioconda.
	mexicoCon3HorasDeEspera _ Pais conNombre: 'Mexico' tiempoDeEspera: 3 * hour objetoDeValor: objetoDeValorGioconda.
	eeuuCon1HoraDeEspera _ Pais conNombre: 'Estados Unidos' tiempoDeEspera: 1 * hour objetoDeValor: objetoDeValorGioconda.
	
	unDetectiveClasicoEnMexico _ DetectiveClasico ubicadoEn: mexicoCon3HorasDeEspera .
	unDetectivePersuasivoEnCanada _ DetectivePersuasivo ubicadoEn: canadaCon5HorasDeEspera .
	unDetectiveInterpolEnEeuu _ DetectiveInterpol ubicadoEn: eeuuCon1HoraDeEspera .
	
	unaPistaDePaisMexico _ PistaDePaisValida delPais: mexicoCon3HorasDeEspera.
	pistaDePaisEEUU _ PistaDePaisValida delPais: eeuuCon1HoraDeEspera.
	pistaDeAspectoColorDeOjosAzul _ PistaDeAspectoValida descripcion: colorDeOjosAzul .
	pistaDeAspectoFormaDeCabelloLacio _ PistaDeAspectoValida descripcion: formaDelCabelloLacio .
	
	unTestigoEnMexicoConPistaDePaisEeuu _ Testigo ubicadoEn: mexicoCon3HorasDeEspera conNivelDeDificultad: 1.
	unTestigoEnMexicoConPistaDePaisEeuu agregarPistaDePais: pistaDePaisEEUU.
	unTestigoEnMexicoSinPistaDePais _ Testigo ubicadoEn: mexicoCon3HorasDeEspera conNivelDeDificultad: 1.
	
	testigoEnEeuuConPistaPaisMexico _ Testigo ubicadoEn: eeuuCon1HoraDeEspera conNivelDeDificultad: 1.
	testigoEnEeuuConPistaPaisMexico agregarPistaDePais: unaPistaDePaisMexico.
	testigoEnEeuuSinPistaDePais _ Testigo ubicadoEn: eeuuCon1HoraDeEspera conNivelDeDificultad: 1.
	
	testigoEnCanadaConPistaDePaisEeuu _ Testigo ubicadoEn: canadaCon5HorasDeEspera conNivelDeDificultad: 1.
	testigoEnCanadaConPistaDePaisEeuu agregarPistaDePais: pistaDePaisEEUU .
	testigoEnCanadaConPistaDePaisEeuu agregarPistaDeAspecto: pistaDeAspectoColorDeOjosAzul.
	
	unTestigoEnMexicoConPistaDeAspectoColorDeOjosAzul _ Testigo ubicadoEn: mexicoCon3HorasDeEspera conNivelDeDificultad: 1.
	unTestigoEnMexicoConPistaDeAspectoColorDeOjosAzul agregarPistaDeAspecto: pistaDeAspectoColorDeOjosAzul . 
	unTestigoEnMexicoConPistaDeAspectoFormaDeCabelloLacio _ Testigo ubicadoEn: mexicoCon3HorasDeEspera conNivelDeDificultad: 1.
	unTestigoEnMexicoConPistaDeAspectoFormaDeCabelloLacio agregarPistaDeAspecto: pistaDeAspectoFormaDeCabelloLacio .
	
	unTestigoEnCanadaConPistaDeAspectoColorDeOjosAzul _ Testigo ubicadoEn: canadaCon5HorasDeEspera conNivelDeDificultad: 1.
	unTestigoEnCanadaConPistaDeAspectoColorDeOjosAzul agregarPistaDeAspecto: pistaDeAspectoColorDeOjosAzul . 
	unTestigoEnCanadaConPistaDeAspectoColorDeOjosAzul agregarPistaDeAspecto: pistaDeAspectoFormaDeCabelloLacio.
	unTestigoEnCanadaConPistaDeAspectoFormaDeCabelloLacio _ Testigo ubicadoEn: canadaCon5HorasDeEspera conNivelDeDificultad: 1.
	unTestigoEnCanadaConPistaDeAspectoFormaDeCabelloLacio agregarPistaDeAspecto: pistaDeAspectoFormaDeCabelloLacio .
	unTestigoEnCanadaConPistaDeAspectoFormaDeCabelloLacio agregarPistaDeAspecto: pistaDeAspectoColorDeOjosAzul.
	
	unTestigoEnEeuuConPistaDeAspectoColorDeOjosAzul _ Testigo ubicadoEn: eeuuCon1HoraDeEspera conNivelDeDificultad: 1.
	unTestigoEnEeuuConPistaDeAspectoColorDeOjosAzul agregarPistaDeAspecto: pistaDeAspectoColorDeOjosAzul . 
	unTestigoEnEeuuConPistaDeAspectoFormaDeCabelloLacio _ Testigo ubicadoEn: eeuuCon1HoraDeEspera conNivelDeDificultad: 1.
	unTestigoEnEeuuConPistaDeAspectoFormaDeCabelloLacio agregarPistaDeAspecto: pistaDeAspectoFormaDeCabelloLacio .
	
	nombreCarlos _ Nombre es: 'Carlos'.
	nombreJuan _ Nombre es: 'Juan'.
	
	colorDeOjosAzul _ ColorDeOjos es: 'Azul'.
	
	formaDelCabelloLacio _ FormaDeCabello es: 'Lacio'.
	formaDelCabelloOndulado _ FormaDeCabello es: 'Ondulado'.
	
	colorDeCabelloCastaño _ ColorDeCabello es: 'Castaño'.
	colorDeCabelloRubio _ ColorDeCabello es: 'Rubio'.
	
	sospechosoCarlos _ Sospechoso ubicadoEn: eeuuCon1HoraDeEspera conNombre: nombreCarlos colorDeOjos: colorDeOjosAzul formaDelCabello: formaDelCabelloLacio  	colorDeCabello: 	colorDeCabelloCastaño.
	sospechosoJuan _ Sospechoso ubicadoEn: eeuuCon1HoraDeEspera conNombre: nombreJuan colorDeOjos: colorDeOjosAzul formaDelCabello: formaDelCabelloOndulado   	colorDeCabello: colorDeCabelloRubio.
	
	unaPartidaNuevaDeCarmenSandiego _ PartidaCarmenSandiego conSospechosos: {sospechosoCarlos . sospechosoJuan } paisesAViajar: { eeuuCon1HoraDeEspera .  	canadaCon5HorasDeEspera . mexicoCon3HorasDeEspera } detective: unDetectiveClasicoEnMexico tiempoLimiteDe: 50 * hour.! !


!classDefinition: #PaisTest category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
TestCase subclass: #PaisTest
	instanceVariableNames: 'canada eeuu objetoDeValorGioconda objetoDeValorGrial'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!PaisTest methodsFor: 'pais-tests' stamp: 'a 11/15/2021 21:38:42'!
test001_CuandoUnPaisSeLLamaCanada

	
	Assert that: canada nombre isEqualTo: 'Canada'.
	

	! !

!PaisTest methodsFor: 'pais-tests' stamp: 'FM 12/3/2021 20:53:53'!
test002_CuandoUnPaisTiene5HorasDeEsperaEnMigraciones
	
	Assert that: canada tiempoDeEsperaEnMigraciones isEqualTo: 5*hour.
	

	! !

!PaisTest methodsFor: 'pais-tests' stamp: 'a 11/15/2021 22:25:54'!
test003_CuandoUnPaisNoTienePaisesLimitrofes
	
	Assert isFalse: [canada tienePaisLimetrofe]
	! !

!PaisTest methodsFor: 'pais-tests' stamp: 'a 11/17/2021 14:58:57'!
test004_CuandoUnPaisTienePaisesLimitrofes

	canada agregarPaisLimitrofe: { eeuu }.
	
	Assert isTrue: [canada tienePaisLimetrofe]
	! !

!PaisTest methodsFor: 'pais-tests' stamp: 'a 11/17/2021 15:09:39'!
test005_CuandoUnPaisTieneDeLimitrofeAOtro_EntoncesElOtroPaisTambienLoTieneDeLimitrofe

	canada agregarPaisLimitrofe: { eeuu }.
	
	Assert isTrue: [canada esLimitrofeCon: eeuu].
	Assert isTrue: [eeuu esLimitrofeCon: canada].
	! !

!PaisTest methodsFor: 'pais-tests' stamp: 'FM 12/9/2021 13:44:40'!
test006_CuandoUnPaisTieneUnObjetoDeValor
	
	Assert isTrue: canada tieneObjetoDeValor.
	! !

!PaisTest methodsFor: 'pais-tests' stamp: 'FM 12/7/2021 12:02:25'!
test007_CuandoUnPaisEsRobado_EntoncesNoTieneObjetoDeValor 

	canada quitarObjetoDeValor.
	
	Assert isFalse: canada tieneObjetoDeValor.
	! !

!PaisTest methodsFor: 'pais-tests' stamp: 'FM 12/9/2021 10:54:31'!
test008_CuandoUnPaisTieneTestigos

	| testigo1 testigo2 testigo3 |
	
	testigo1 _ Testigo ubicadoEn: canada conNivelDeDificultad: 1.
	testigo2 _ Testigo ubicadoEn: canada conNivelDeDificultad: 2.
	testigo3 _ Testigo ubicadoEn: canada conNivelDeDificultad: 3.
	
	canada agregarTestigo: testigo1.
	canada agregarTestigo: testigo2.
	canada agregarTestigo: testigo3.
	
	Assert that: (canada testigos size) isEqualTo: 3.! !

!PaisTest methodsFor: 'pais-tests' stamp: 'FM 12/9/2021 10:54:36'!
test009_CuandoUnPaisTieneTestigos_EntoncesSePuedeConocerACadaUno
	
	| testigo1 testigo2 testigo3 |
	
	testigo1 _ Testigo ubicadoEn: canada conNivelDeDificultad: 1.
	testigo2 _ Testigo ubicadoEn: canada conNivelDeDificultad: 2.
	testigo3 _ Testigo ubicadoEn: canada conNivelDeDificultad: 3.
	
	canada agregarTestigo: testigo1.
	canada agregarTestigo: testigo2.
	canada agregarTestigo: testigo3.
	
	Assert that: canada primerTestigo isEqualTo: testigo1.
	Assert that: canada segundoTestigo isEqualTo: testigo2.
	Assert that: canada tercerTestigo isEqualTo: testigo3.! !

!PaisTest methodsFor: 'pais-tests' stamp: 'FM 12/9/2021 13:57:51'!
test010_CuandoUnPaisTieneObjetoDeValor_EntoncesPuedeConocerseElNombreDelObjeto

	| nombreEsperado |
	
	nombreEsperado _ (canada objetoDeValor) nombre.
	
	Assert that: canada nombreDelObjetoDeValor isEqualTo: nombreEsperado.! !


!PaisTest methodsFor: 'setUp/tearDown' stamp: 'FM 12/9/2021 13:53:43'!
setUp
	
	objetoDeValorGioconda _ ObjetoDeValorIntacto conNombre: 'Gioconda'.
	objetoDeValorGrial _ ObjetoDeValorIntacto conNombre: 'Grial'.
	
	canada _ Pais conNombre: 'Canada' tiempoDeEspera: 5 * hour objetoDeValor: objetoDeValorGioconda.
	eeuu _ Pais conNombre: 'Estados Unidos' tiempoDeEspera: 1 * hour objetoDeValor: objetoDeValorGrial .! !


!classDefinition: #PartidaCarmenSandiegoTest category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
TestCase subclass: #PartidaCarmenSandiegoTest
	instanceVariableNames: 'unaPartidaNuevaDeCarmenSandiego unDetectiveClasicoEnCanada canadaCon1HoraDeEspera mexicoCon2HorasDeEspera sospechosoCarlos nombreCarlos colorDeOjosAzul formaDelCabelloLacio colorDeCabelloCastaño sospechosoJuan nombreJuan formaDelCabelloOndulado colorDeCabelloRubio unArchivoVacio estadoFinalEsperadoPorOrdenDeArrestoAcertada objetoDeValorGioconda eeuu estadoFinalEsperadoPorOrdenDeArrestoErrada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!PartidaCarmenSandiegoTest methodsFor: 'setUp/tearDown' stamp: 'FM 12/9/2021 19:33:07'!
setUp
	
	objetoDeValorGioconda _ ObjetoDeValorIntacto conNombre: 'Gioconda'.
	
	canadaCon1HoraDeEspera _ Pais conNombre: 'Canada' tiempoDeEspera: 1 * hour objetoDeValor: objetoDeValorGioconda.
	mexicoCon2HorasDeEspera _ Pais conNombre: 'Mexico' tiempoDeEspera: 2 * hour objetoDeValor: objetoDeValorGioconda.
	eeuu _ Pais conNombre: 'Eeuu' tiempoDeEspera: 2 * hour objetoDeValor: objetoDeValorGioconda.
	
	unDetectiveClasicoEnCanada _ DetectiveClasico ubicadoEn: canadaCon1HoraDeEspera.
	
	nombreCarlos _ Nombre es: 'Carlos'.
	nombreJuan _ Nombre es: 'Juan'.
	
	colorDeOjosAzul _ ColorDeOjos es: 'Azul'.
	
	formaDelCabelloLacio _ FormaDeCabello es: 'Lacio'.
	formaDelCabelloOndulado _ FormaDeCabello es: 'Ondulado'.
	
	colorDeCabelloCastaño _ ColorDeCabello es: 'Castaño'.
	colorDeCabelloRubio _ ColorDeCabello es: 'Rubio'.
	
	sospechosoCarlos _ Sospechoso ubicadoEn: eeuu conNombre: nombreCarlos colorDeOjos: colorDeOjosAzul formaDelCabello: formaDelCabelloLacio colorDeCabello:  	colorDeCabelloCastaño.
	sospechosoJuan _ Sospechoso ubicadoEn: eeuu conNombre: nombreJuan colorDeOjos: colorDeOjosAzul formaDelCabello: formaDelCabelloOndulado   	colorDeCabello:     	colorDeCabelloRubio.
	
	unaPartidaNuevaDeCarmenSandiego _ PartidaCarmenSandiego conSospechosos: { sospechosoCarlos . sospechosoJuan } paisesAViajar: { canadaCon1HoraDeEspera .     	mexicoCon2HorasDeEspera } detective: unDetectiveClasicoEnCanada tiempoLimiteDe: 50 * hour.
	
	unArchivoVacio _ ArchivoDeMentira new. 
	
! !


!PartidaCarmenSandiegoTest methodsFor: 'partidaCarmenSandiego-tests' stamp: 'FM 12/2/2021 17:46:15'!
test001_CuandoUnaPartidaSeCrea_EntoncesTieneUnaListaDeSospechosos

	| sospechososEsperados |
	
	sospechososEsperados _ { sospechosoCarlos . sospechosoJuan }.
		
	Assert that: unaPartidaNuevaDeCarmenSandiego sospechosos isEqualTo: sospechososEsperados.! !

!PartidaCarmenSandiegoTest methodsFor: 'partidaCarmenSandiego-tests' stamp: 'FM 12/2/2021 17:49:10'!
test002_CuandoUnaPartidaSeCrea_EntoncesTieneUnaListaDePaises

	| paisesEsperados |
	
	paisesEsperados _ { canadaCon1HoraDeEspera . mexicoCon2HorasDeEspera }.
	
	Assert that: unaPartidaNuevaDeCarmenSandiego paises isEqualTo: paisesEsperados.! !

!PartidaCarmenSandiegoTest methodsFor: 'partidaCarmenSandiego-tests' stamp: 'FM 12/2/2021 17:50:12'!
test003_CuandoUnaPartidaSeCrea_EntoncesTieneUnDetectiveAsignado

	Assert that: unaPartidaNuevaDeCarmenSandiego detective isEqualTo: unDetectiveClasicoEnCanada.! !

!PartidaCarmenSandiegoTest methodsFor: 'partidaCarmenSandiego-tests' stamp: 'FM 12/2/2021 17:56:19'!
test004_CuandoUnaPartidaSeCrea_EntoncesTieneUnTiempoLimite

	Assert that: unaPartidaNuevaDeCarmenSandiego tiempoLimite isEqualTo: 50 * hour.! !

!PartidaCarmenSandiegoTest methodsFor: 'partidaCarmenSandiego-tests' stamp: 'FM 12/4/2021 11:35:56'!
test005_CuandoUnDetectiveViajaEnUnaPartidaDeCarmenSandiego_EntoncesElTiempoLimiteSeReduce

	| tiempoLimiteEsperado |
	
	tiempoLimiteEsperado _ (unaPartidaNuevaDeCarmenSandiego tiempoLimite) - (((unaPartidaNuevaDeCarmenSandiego detective) tiempoDeVueloHacia: mexicoCon2HorasDeEspera) + 	(mexicoCon2HorasDeEspera tiempoDeEsperaEnMigraciones )).
			
	unaPartidaNuevaDeCarmenSandiego hacerViajarDetectiveA: mexicoCon2HorasDeEspera.
	
	Assert that: unaPartidaNuevaDeCarmenSandiego tiempoLimite isEqualTo: tiempoLimiteEsperado.
	! !

!PartidaCarmenSandiegoTest methodsFor: 'partidaCarmenSandiego-tests' stamp: 'FM 12/6/2021 11:16:08'!
test006_CuandoUnDetectiveInterrogaAUnTestigoEnUnaPartidaDeCarmenSandiego_EntoncesElTiempoLimiteDeLaPartidaSeReduce
	
	| tiempoLimiteEsperado unTestigoEnCanadaConNivelDeDificultad5 pistaDePaisCanada pistaDeAspectoColorDeOjosAzul |
	
	pistaDeAspectoColorDeOjosAzul _ PistaDeAspectoValida descripcion: colorDeOjosAzul.
	pistaDePaisCanada _ PistaDePaisValida delPais: canadaCon1HoraDeEspera.
	unTestigoEnCanadaConNivelDeDificultad5 _ Testigo ubicadoEn: canadaCon1HoraDeEspera conNivelDeDificultad: 5.
	
	unTestigoEnCanadaConNivelDeDificultad5 agregarPistaDeAspecto: pistaDeAspectoColorDeOjosAzul.
	unTestigoEnCanadaConNivelDeDificultad5 agregarPistaDePais: pistaDePaisCanada.
	tiempoLimiteEsperado _ (unaPartidaNuevaDeCarmenSandiego tiempoLimite) - (((unaPartidaNuevaDeCarmenSandiego detective) tiempoPorInterrogarA: 	unTestigoEnCanadaConNivelDeDificultad5) * 2).
	
	unaPartidaNuevaDeCarmenSandiego hacerInterrogarADetectivePorPistaDeAspectoA: unTestigoEnCanadaConNivelDeDificultad5 .
	unaPartidaNuevaDeCarmenSandiego hacerInterrogarADetectivePorPistaDePaisA: unTestigoEnCanadaConNivelDeDificultad5.
	
	Assert that: unaPartidaNuevaDeCarmenSandiego tiempoLimite isEqualTo: tiempoLimiteEsperado.! !

!PartidaCarmenSandiegoTest methodsFor: 'partidaCarmenSandiego-tests' stamp: 'FM 12/8/2021 16:43:59'!
test007_CuandoEnUnaPartidaDeCarmenSandiegoSeAgotaElTiempo_EntoncesLaPartidaSeConsideraPerdida

	| unaPartidaDeCarmenSandiegoConTiempoAgotado |
	
	unaPartidaDeCarmenSandiegoConTiempoAgotado _ PartidaCarmenSandiego conSospechosos: {} paisesAViajar: {} detective: unDetectiveClasicoEnCanada tiempoLimiteDe: 0 * 	hour.
	
	Assert isTrue: (unaPartidaDeCarmenSandiegoConTiempoAgotado esGameOverPorLimiteDeTiempo).

	

	! !

!PartidaCarmenSandiegoTest methodsFor: 'partidaCarmenSandiego-tests' stamp: 'FM 12/7/2021 12:15:16'!
test008_CuandoUnaPartidaSeCrea_EntoncesSeConoceElPaisDondeOcurrioElRobo
	
	sospechosoCarlos robarObjetoDeValorDe: canadaCon1HoraDeEspera.
	
	Assert that: unaPartidaNuevaDeCarmenSandiego paisAsaltado isEqualTo: canadaCon1HoraDeEspera.
! !

!PartidaCarmenSandiegoTest methodsFor: 'partidaCarmenSandiego-tests' stamp: 'FM 12/7/2021 12:08:24'!
test009_CuandoUnSospechosoRobaUnObjetoDeValor_EntoncesSeConoceAlDelincuente

	| sospechosoEsperado |
	
	sospechosoCarlos robarObjetoDeValorDe: canadaCon1HoraDeEspera.
	sospechosoEsperado _ unaPartidaNuevaDeCarmenSandiego delincuente.

	Assert that: sospechosoEsperado isEqualTo: sospechosoCarlos ! !

!PartidaCarmenSandiegoTest methodsFor: 'partidaCarmenSandiego-tests' stamp: 'FM 12/9/2021 16:53:21'!
test010_CuandoElDetectiveRealizaUnaOrdenDeArrestoAcertada_EntoncesLaPartidaSeConsideraGanada

	| ordenDeArrestoAcertada |
	
	sospechosoCarlos robarObjetoDeValorDe: canadaCon1HoraDeEspera.
	ordenDeArrestoAcertada _ (unaPartidaNuevaDeCarmenSandiego hacerADetectiveRealizarUnaOrdenDeArrestoHacia: sospechosoCarlos).
	
	Assert isTrue: (unaPartidaNuevaDeCarmenSandiego estaGanadaPorOrdenDeArresto: ordenDeArrestoAcertada).! !

!PartidaCarmenSandiegoTest methodsFor: 'partidaCarmenSandiego-tests' stamp: 'FM 12/9/2021 21:01:43'!
test011_CuandoElDetectiveRealizaUnaOrdenDeArrestoErrada_EntoncesLaPartidaSeConsideraPerdida

	| ordenDeArrestoErrada |
	
	sospechosoJuan robarObjetoDeValorDe: canadaCon1HoraDeEspera.
	ordenDeArrestoErrada _ (unaPartidaNuevaDeCarmenSandiego hacerADetectiveRealizarUnaOrdenDeArrestoHacia: sospechosoCarlos).
	
	Assert isTrue: (unaPartidaNuevaDeCarmenSandiego esGameOverPorOrdenDeArresto: ordenDeArrestoErrada).! !

!PartidaCarmenSandiegoTest methodsFor: 'partidaCarmenSandiego-tests' stamp: 'FM 12/9/2021 20:09:56'!
test012_SeImprimeUnArchivoConElEstadoFinalDeUnPartidaCuandoElDetectiveDeUnaPartidaRealizaUnaOrdenDeArrestoAcertada
	
	| delincuente |
	
	estadoFinalEsperadoPorOrdenDeArrestoAcertada _
	'FELICIDADES HAS ATRAPADO AL LADRON.' , String newLineString ,
	'Caracteristicas del ladron:' , String newLineString ,
	'- Nombre -> Juan' , String newLineString ,
	'- Color de cabello -> Rubio' , String newLineString ,
	'- Color de ojos -> Azul', String newLineString ,
	'- Forma de cabello -> Ondulado', String newLineString ,
	'Objeto robado: Gioconda', String newLineString ,
	'Ruta de escape del ladron: < Canada Mexico >', String newLineString ,
	'Tiempo restante en la partida: 50 horas', String newLineString ,
	'El detective gano la partida'.
	
	delincuente _ sospechosoJuan.
	
	delincuente robarObjetoDeValorDe: canadaCon1HoraDeEspera.
	delincuente escaparPorRuta: { canadaCon1HoraDeEspera . mexicoCon2HorasDeEspera }.
	unaPartidaNuevaDeCarmenSandiego hacerADetectiveRealizarUnaOrdenDeArrestoHacia: delincuente.
	
	unaPartidaNuevaDeCarmenSandiego imprimirEstadoFinalEn: unArchivoVacio.
	
	Assert that: unArchivoVacio fileContents isEqualTo: estadoFinalEsperadoPorOrdenDeArrestoAcertada.
	
	! !

!PartidaCarmenSandiegoTest methodsFor: 'partidaCarmenSandiego-tests' stamp: 'FM 12/9/2021 21:07:26'!
test013_SeImprimeUnArchivoConElEstadoFinalDeUnaPartidaCuandoElDetectiveDeUnaPartidaRealizaUnaOrdenDeArrestoErrada

	estadoFinalEsperadoPorOrdenDeArrestoErrada _
	'NO HAS ATRAPADO AL LADRON.' , String newLineString ,
	'Caracteristicas del ladron:' , String newLineString ,
	'- Nombre -> Juan' , String newLineString ,
	'- Color de cabello -> Rubio' , String newLineString ,
	'- Color de ojos -> Azul', String newLineString ,
	'- Forma de cabello -> Ondulado', String newLineString ,
	'Objeto robado: Gioconda', String newLineString ,
	'Ruta de escape del ladron: < Canada Mexico >', String newLineString ,
	'Tiempo restante en la partida: 50 horas', String newLineString ,
	'El detective perdio la partida'.
	
	sospechosoJuan robarObjetoDeValorDe: canadaCon1HoraDeEspera.
	sospechosoJuan escaparPorRuta: { canadaCon1HoraDeEspera . mexicoCon2HorasDeEspera }.
	unaPartidaNuevaDeCarmenSandiego hacerADetectiveRealizarUnaOrdenDeArrestoHacia: sospechosoCarlos.
	
	unaPartidaNuevaDeCarmenSandiego imprimirEstadoFinalEn: unArchivoVacio.
	
	Assert that: unArchivoVacio fileContents isEqualTo: estadoFinalEsperadoPorOrdenDeArrestoErrada.! !

!PartidaCarmenSandiegoTest methodsFor: 'partidaCarmenSandiego-tests' stamp: 'FM 12/9/2021 21:03:15'!
test014_CuandoUnDelincuenteRobaUnObjetoDeUnPaisEscapa_EntoncesSePuedeConocerSuRutaDeEscape
	
	sospechosoJuan robarObjetoDeValorDe: canadaCon1HoraDeEspera.
	sospechosoJuan escaparPorRuta: { mexicoCon2HorasDeEspera }.
	
	Assert isTrue: ((unaPartidaNuevaDeCarmenSandiego delincuente rutaDeEscape) includes: mexicoCon2HorasDeEspera).! !


!classDefinition: #PersonalDigitalAssistantTest category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
TestCase subclass: #PersonalDigitalAssistantTest
	instanceVariableNames: 'sospechosoCarlitos sospechosoJorge pda colorDeOjosAzul formaDeCabelloPelado nombreCarlitos colorDeCabelloNegro pistaAspectoColorDeOjosAzul colorDeOjosVerde pistaAspectoColorDeOjosVerde pistaDeAspectoFormaDeCabelloPelado pistaDeAspectoNombreCarlitos pistaDeAspectoColorDePeloNada canada objetoDeValorGioconda'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!PersonalDigitalAssistantTest methodsFor: 'personalDigitalAssistant-tests' stamp: 'a 12/6/2021 20:30:49'!
test001_CuandoUnPersonalDigitalAssistantNoTienePistasDeAspecto

    Assert isTrue: (pda pistasDeAspecto isEmpty).! !

!PersonalDigitalAssistantTest methodsFor: 'personalDigitalAssistant-tests' stamp: 'a 12/6/2021 20:30:22'!
test002_CuandoUnPersonalDigitalAssistantTienePistasDeAspecto

	pda anotarPistaAspecto: pistaAspectoColorDeOjosAzul .

	Assert isTrue: (pda pistasDeAspecto includes: pistaAspectoColorDeOjosAzul ).! !

!PersonalDigitalAssistantTest methodsFor: 'personalDigitalAssistant-tests' stamp: 'FM 12/7/2021 10:52:02'!
test003_CuandoUnPDATienePistas_EntoncesSePuedenFiltrarLosSospechososSegunEstasPistas

	| sospechosoEsperado |
	
	pda anotarPistaAspecto: pistaDeAspectoNombreCarlitos .
	pda anotarPistaAspecto: pistaDeAspectoFormaDeCabelloPelado .
	pda anotarPistaAspecto: pistaAspectoColorDeOjosAzul.
	pda anotarPistaAspecto: pistaDeAspectoColorDePeloNada.
		
	sospechosoEsperado _ pda filtrarSospechosos: { sospechosoCarlitos . sospechosoJorge }.
	
	Assert that: sospechosoEsperado isEqualTo: sospechosoCarlitos .
	! !

!PersonalDigitalAssistantTest methodsFor: 'personalDigitalAssistant-tests' stamp: 'FM 12/7/2021 10:52:07'!
test004_CuandoSeIntentaAgregarUnaPistaRepetidaAlPersonalDigitalAssistant_EntoncesNoSeAgregaLaPista
	
	pda anotarPistaAspecto: pistaAspectoColorDeOjosAzul .
	pda anotarPistaAspecto: pistaAspectoColorDeOjosAzul .
	
	Assert that: pda cantidadDePistasDeAspecto isEqualTo: 1.! !


!PersonalDigitalAssistantTest methodsFor: 'setUp/tearDown' stamp: 'FM 12/9/2021 21:04:46'!
setUp
	
	objetoDeValorGioconda _ ObjetoDeValorIntacto conNombre: 'Gioconda'.
	
	canada _ Pais conNombre: 'Canada' tiempoDeEspera: 5 * hour objetoDeValor: objetoDeValorGioconda.
	
	sospechosoCarlitos _ Sospechoso ubicadoEn: canada conNombre: (Nombre es: 'Carlitos') colorDeOjos: (ColorDeOjos es: 'Azul') formaDelCabello: (FormaDeCabello es:  	'Pelado')  	colorDeCabello: 	(ColorDeCabello es: 'Nada').
	sospechosoJorge _ Sospechoso ubicadoEn: canada conNombre: (Nombre es: 'Jorge') colorDeOjos: (ColorDeOjos es: 'Verde') formaDelCabello: (FormaDeCabello es: 'Lacio')  	colorDeCabello: 	(ColorDeCabello es: 'Negro').
	
	
	pda _ PersonalDigitalAssistant new.
	
	colorDeOjosVerde _ ColorDeOjos es: 'Verde'.
	colorDeOjosAzul _ ColorDeOjos es: 'Azul'.
	formaDeCabelloPelado _ FormaDeCabello es: 'Pelado'.
	nombreCarlitos _ Nombre es: 'Carlitos'.
	colorDeCabelloNegro _ ColorDeCabello es: 'Negro'.
	
	pistaAspectoColorDeOjosVerde _ PistaDeAspectoValida descripcion: colorDeOjosVerde.
	pistaAspectoColorDeOjosAzul _ PistaDeAspectoValida descripcion: colorDeOjosAzul .
	pistaDeAspectoFormaDeCabelloPelado _ PistaDeAspectoValida descripcion: formaDeCabelloPelado.
	pistaDeAspectoNombreCarlitos _ PistaDeAspectoValida descripcion: nombreCarlitos.
	pistaDeAspectoColorDePeloNada _ PistaDeAspectoValida descripcion: (ColorDeCabello es: 'Nada').! !


!classDefinition: #SospechosoTest category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
TestCase subclass: #SospechosoTest
	instanceVariableNames: 'nombreCarlos colorDeOjosAzul formaDelCabelloLacio colorDeCabelloCastaño sospechoso1 eeuu mexico canada1 objetoDeValorGioconda'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!SospechosoTest methodsFor: 'sospechoso-tests' stamp: 'a 12/6/2021 19:44:37'!
test001_CuandoUnSospechosoSeCrea_SeConoceSuNombre

	Assert that: sospechoso1 nombre isEqualTo: nombreCarlos.! !

!SospechosoTest methodsFor: 'sospechoso-tests' stamp: 'a 12/6/2021 19:44:54'!
test002_CuandoUnSospechosoSeCrea_SeConoceSuColorDeOjos
	
	Assert that: sospechoso1 colorDeOjos isEqualTo: colorDeOjosAzul .! !

!SospechosoTest methodsFor: 'sospechoso-tests' stamp: 'a 12/6/2021 19:45:12'!
test003_CuandoUnSospechosoSeCrea_SeConoceSuFormaDelCabello
	
	Assert that: sospechoso1 forma isEqualTo: formaDelCabelloLacio .! !

!SospechosoTest methodsFor: 'sospechoso-tests' stamp: 'a 12/6/2021 19:45:26'!
test004_CuandoUnSospechosoSeCrea_SeConoceSuColorDeCabello
	
	Assert that: sospechoso1 color isEqualTo: colorDeCabelloCastaño .! !

!SospechosoTest methodsFor: 'sospechoso-tests' stamp: 'FM 12/8/2021 19:58:20'!
test005_CuandounSospechosoSeUbicaEnEeuu
	
	Assert that: sospechoso1 ubicacion isEqualTo: eeuu.
	
	! !

!SospechosoTest methodsFor: 'sospechoso-tests' stamp: 'FM 12/9/2021 14:22:32'!
test006_CuandoUnSospechosoRobaUnObjetoDeValor_EntoncesSeConsideraUnDelincuente
	
	| canada |
	
	canada _ Pais conNombre: 'Canada' tiempoDeEspera: 5 * hour objetoDeValor: objetoDeValorGioconda.
	
	sospechoso1 robarObjetoDeValorDe: canada.
	
	Assert isTrue: sospechoso1 esDelincuente.! !

!SospechosoTest methodsFor: 'sospechoso-tests' stamp: 'FM 12/9/2021 14:22:39'!
test007_CuandoUnSospechosoDelincuenteViajaAOtroPais_EntoncesSuUbicacionCambia

	| canada |
	
	canada _ Pais conNombre: 'Canada' tiempoDeEspera: 5 * hour objetoDeValor: objetoDeValorGioconda.
	
	sospechoso1 viajarA: canada.
	
	Assert that: sospechoso1 ubicacion isEqualTo: canada.! !

!SospechosoTest methodsFor: 'sospechoso-tests' stamp: 'FM 12/9/2021 10:47:58'!
test008_CuandoUnSospechosoDelincuenteIntentaViajarAlMismoPaisDondeSeEncuentra_EntoncesSeProduceUnError

	Assert should: [ sospechoso1 viajarA: eeuu ] 
		    signal: Error
		    withDescription: Sospechoso errorPorViajeAMismoPais.! !

!SospechosoTest methodsFor: 'sospechoso-tests' stamp: 'FM 12/9/2021 12:26:01'!
test009_CuandoUnSospechosoDelincuenteEscapaPorUnaRuta_EntoncesSePuedeConocerSuRutaDeEscape

	| paisEsperado |
	
	paisEsperado _ mexico.
	
	sospechoso1 escaparPorRuta: { mexico }.

	Assert isTrue: (sospechoso1 rutaDeEscape includes: paisEsperado).! !

!SospechosoTest methodsFor: 'sospechoso-tests' stamp: 'FM 12/9/2021 15:57:19'!
test010_CuandoUnSospechosoDelincuenteEscapaPorUnaRutaDePaises_EntoncesDejaPistasEnTodosLosPaisesDeLaRuta
	
	sospechoso1 escaparPorRuta: { mexico . canada1 . eeuu }.
	
	Assert that: ((canada1 primerTestigo) pistaDePais paisDeLaPista) isEqualTo: eeuu.
	Assert that: (canada1 segundoTestigo) pistasDeAspecto size isEqualTo: 2.
	Assert that: (canada1 tercerTestigo) pistasDeAspecto size isEqualTo: 2.! !


!SospechosoTest methodsFor: 'setUp/tearDown' stamp: 'FM 12/9/2021 14:22:09'!
setUp

	nombreCarlos _ Nombre es: 'Carlos'.
	colorDeOjosAzul _ ColorDeOjos es: 'Azul'.
	formaDelCabelloLacio _ FormaDeCabello es: 'Lacio'.
	colorDeCabelloCastaño _ ColorDeCabello es: 'Castaño'.
	
	objetoDeValorGioconda _ ObjetoDeValorIntacto conNombre: 'Gioconda'.
	
	eeuu _ Pais conNombre: 'Eeuu' tiempoDeEspera: 1 * hour objetoDeValor: objetoDeValorGioconda.
	mexico _ Pais conNombre: 'Mexico' tiempoDeEspera: 2 * hour objetoDeValor: objetoDeValorGioconda.
	canada1 _ Pais conNombre: 'Canada' tiempoDeEspera: 3 * hour objetoDeValor: objetoDeValorGioconda.
	
	sospechoso1 _ Sospechoso ubicadoEn: eeuu conNombre: nombreCarlos colorDeOjos: colorDeOjosAzul formaDelCabello: formaDelCabelloLacio colorDeCabello: 	colorDeCabelloCastaño.
	! !


!classDefinition: #TestigoTest category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
TestCase subclass: #TestigoTest
	instanceVariableNames: 'canada eeuu testigoEnCanadaConNivel5DeDificultad colorDeOjosVerde pistaAspectoColorDeOjosVerde formaDeCabelloLacio pistaAspectoFormaDeCabelloLacio nombreJuan pistaAspectoNombreJuan colorDeCabelloCastaño pistaAspectoColorDeCabelloCastaño pistaDePaisEEUU objetoDeValorGioconda'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!TestigoTest methodsFor: 'testigo-tests' stamp: 'a 12/6/2021 19:52:17'!
test001_CuandoUnTestigoEsCreado_SeEncuentraEnCanada

	Assert that: testigoEnCanadaConNivel5DeDificultad ubicacion isEqualTo: canada .! !

!TestigoTest methodsFor: 'testigo-tests' stamp: 'a 12/6/2021 19:40:39'!
test002_CuandoUnTestigoTieneUnaPistaPais
	
	testigoEnCanadaConNivel5DeDificultad agregarPistaDePais: pistaDePaisEEUU .

	Assert that: testigoEnCanadaConNivel5DeDificultad pistaDePais isEqualTo: pistaDePaisEEUU .! !

!TestigoTest methodsFor: 'testigo-tests' stamp: 'a 12/6/2021 19:39:24'!
test003_CuandoUnTestigoTienePistaDeColorDeCabello	
	
	testigoEnCanadaConNivel5DeDificultad agregarPistaDeAspecto: pistaAspectoColorDeCabelloCastaño .
	
	Assert isTrue: [testigoEnCanadaConNivel5DeDificultad pistasDeAspecto includes: pistaAspectoColorDeCabelloCastaño].
	
	
	
	! !

!TestigoTest methodsFor: 'testigo-tests' stamp: 'a 12/6/2021 19:37:12'!
test004_CuandoUnTestigoTienePistaDeNombre
	
	testigoEnCanadaConNivel5DeDificultad agregarPistaDeAspecto: pistaAspectoNombreJuan .
	
	Assert isTrue: [testigoEnCanadaConNivel5DeDificultad pistasDeAspecto includes: pistaAspectoNombreJuan].
	! !

!TestigoTest methodsFor: 'testigo-tests' stamp: 'a 12/6/2021 19:37:29'!
test005_CuandoUnTestigoTienePistaDeFormaDeCabello
	
	testigoEnCanadaConNivel5DeDificultad agregarPistaDeAspecto: pistaAspectoFormaDeCabelloLacio .
	
	Assert isTrue: [testigoEnCanadaConNivel5DeDificultad pistasDeAspecto includes: pistaAspectoFormaDeCabelloLacio].! !

!TestigoTest methodsFor: 'testigo-tests' stamp: 'a 12/6/2021 19:37:38'!
test006_CuandoUnTestigoTienePistaDeColorDeOjos
	
	testigoEnCanadaConNivel5DeDificultad agregarPistaDeAspecto: pistaAspectoColorDeOjosVerde .
	
	Assert isTrue: [testigoEnCanadaConNivel5DeDificultad pistasDeAspecto includes: pistaAspectoColorDeOjosVerde].! !

!TestigoTest methodsFor: 'testigo-tests' stamp: 'a 12/6/2021 19:24:19'!
test007_CuandoUnTestigoNoTienePistaDePais

	Assert isFalse: (testigoEnCanadaConNivel5DeDificultad tienePistaDePais).! !

!TestigoTest methodsFor: 'testigo-tests' stamp: 'a 12/6/2021 19:24:19'!
test008_CuandoUnTestigoNoTienePistasDeAspecto

	Assert isFalse: (testigoEnCanadaConNivel5DeDificultad tienePistaDeAspecto).! !

!TestigoTest methodsFor: 'testigo-tests' stamp: 'a 12/6/2021 19:25:25'!
test009_CuandoUnTestigoSeCrea_SeConoceSuNivelDeDificultadAlSerInterrogado

	Assert that: testigoEnCanadaConNivel5DeDificultad nivelDeDificultad isEqualTo: 5.! !


!TestigoTest methodsFor: 'setUp/tearDown' stamp: 'FM 12/9/2021 14:21:25'!
setUp

	objetoDeValorGioconda _ ObjetoDeValorIntacto conNombre: 'Gioconda'.
	
	canada _ Pais conNombre: 'Canada' tiempoDeEspera: 5 * hour objetoDeValor: objetoDeValorGioconda .
	eeuu _ Pais conNombre: 'Estados Unidos' tiempoDeEspera: 1 * hour objetoDeValor: objetoDeValorGioconda . 
	
	testigoEnCanadaConNivel5DeDificultad _ Testigo ubicadoEn: canada conNivelDeDificultad: 5.
	
	
	colorDeOjosVerde _ ColorDeOjos es: 'Verde'.
	formaDeCabelloLacio _ FormaDeCabello es: 'Lacio'.
	nombreJuan _ Nombre es: 'Juan'.
	colorDeCabelloCastaño _ ColorDeCabello es: 'Castaño'.
	
	
	pistaAspectoColorDeOjosVerde _ PistaDeAspectoValida descripcion: colorDeOjosVerde.
	pistaAspectoFormaDeCabelloLacio _ PistaDeAspectoValida descripcion: formaDeCabelloLacio.
	pistaAspectoNombreJuan _ PistaDeAspectoValida descripcion: nombreJuan.
	pistaAspectoColorDeCabelloCastaño _ PistaDeAspectoValida descripcion: colorDeCabelloCastaño.
	pistaDePaisEEUU _ PistaDePaisValida delPais: eeuu.! !


!classDefinition: #ArchivoDeMentira category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Object subclass: #ArchivoDeMentira
	instanceVariableNames: 'contenido'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!ArchivoDeMentira methodsFor: 'initialization' stamp: 'FM 12/8/2021 18:42:15'!
initialize
	
	contenido _ ReadWriteStream on: ''.! !


!ArchivoDeMentira methodsFor: 'actions' stamp: 'FM 12/8/2021 18:23:23'!
forceWriteStreamDo: aBlockClosure 
    
    aBlockClosure value: contenido .! !


!ArchivoDeMentira methodsFor: 'accessing' stamp: 'FM 12/8/2021 18:43:07'!
fileContents
    ^ contenido contents .! !


!classDefinition: #Aspecto category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Object subclass: #Aspecto
	instanceVariableNames: 'descripcion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!Aspecto methodsFor: 'instance creation' stamp: 'FM 12/6/2021 12:53:39'!
es: unAspecto

	descripcion _ unAspecto.! !


!Aspecto methodsFor: 'accessing' stamp: 'FM 12/6/2021 12:54:52'!
descripcion
	
	^ descripcion! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Aspecto class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Aspecto class
	instanceVariableNames: ''!

!Aspecto class methodsFor: 'instance creation' stamp: 'FM 11/30/2021 18:40:12'!
es: unAspecto

	 ^ self new es: unAspecto.! !


!classDefinition: #ColorDeCabello category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Aspecto subclass: #ColorDeCabello
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!


!classDefinition: #ColorDeOjos category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Aspecto subclass: #ColorDeOjos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!


!classDefinition: #FormaDeCabello category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Aspecto subclass: #FormaDeCabello
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!


!classDefinition: #Nombre category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Aspecto subclass: #Nombre
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!


!classDefinition: #Detective category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Object subclass: #Detective
	instanceVariableNames: 'ubicacion pistaDePais pda'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!Detective methodsFor: 'accessing' stamp: 'FM 12/4/2021 16:14:47'!
habilidadDeInterrogación
	
	self subclassResponsibility.! !

!Detective methodsFor: 'accessing' stamp: 'FM 12/6/2021 10:44:56'!
pistaDePais
	
	^ pistaDePais. ! !

!Detective methodsFor: 'accessing' stamp: 'FM 12/9/2021 14:40:24'!
pistasDeAspecto
	
	^ pda pistasDeAspecto.! !

!Detective methodsFor: 'accessing' stamp: 'FM 12/4/2021 11:32:56'!
tiempoDeViajeTotalPorIrHacia: unPais 

	^ (self tiempoDeVueloHacia: unPais) + (unPais tiempoDeEsperaEnMigraciones).! !

!Detective methodsFor: 'accessing' stamp: 'FM 12/4/2021 16:14:24'!
tiempoPorInterrogarA: unTestigo 
	
	^ (self habilidadDeInterrogación) * (unTestigo nivelDeDificultad).! !

!Detective methodsFor: 'accessing' stamp: 'a 11/18/2021 12:38:22'!
tiempoPorVolarAOtroPais

	^ self subclassResponsibility ! !

!Detective methodsFor: 'accessing' stamp: 'a 11/18/2021 10:55:30'!
ubicacion
	
	^ubicacion.! !


!Detective methodsFor: 'testing' stamp: 'FM 12/3/2021 17:31:08'!
estaUbicadoEn: unPais 
	
	^ (self ubicacion == unPais)! !

!Detective methodsFor: 'testing' stamp: 'FM 12/6/2021 10:52:20'!
noTienePistaDePais
	
	^ pistaDePais esPistaNula.! !

!Detective methodsFor: 'testing' stamp: 'FM 12/3/2021 20:33:30'!
seEncuentraEnPaisDistintoQue: unTestigo 
	
	^ (unTestigo ubicacion == self ubicacion) not.! !

!Detective methodsFor: 'testing' stamp: 'FM 12/3/2021 17:34:07'!
tienePistaDeAspectoAnotadas
	
	^ pda tienePistas .! !


!Detective methodsFor: 'double-dispatch' stamp: 'FM 12/9/2021 14:44:00'!
interrogarPorPistaAspectoA: unTestigo 
	
	self validarQueElDetectiveNoSeEncuentraEnDistintoPaisQue: unTestigo.
	pda anotarPistaAspecto: (unTestigo unaPistaDeAspecto) ! !

!Detective methodsFor: 'double-dispatch' stamp: 'FM 12/9/2021 10:18:47'!
interrogarPorPistaPaisA: unTestigo 
	
	self validarQueElDetectiveNoSeEncuentraEnDistintoPaisQue: unTestigo.
	(self tipoDePistaDePais: unTestigo) pistaPaisDe: unTestigo para: self.
	
	                          ! !

!Detective methodsFor: 'double-dispatch' stamp: 'FM 12/3/2021 17:33:06'!
tiempoDeVueloHacia: unPais 
	
	^ (self tipoDeVueloHacia: unPais) tiempoDeVueloPara: self.! !

!Detective methodsFor: 'double-dispatch' stamp: 'FM 12/7/2021 12:50:34'!
tipoDeOrdenDeArrestoPara: unSospechoso 
	
	^ OrdenDeArresto puedeHacerseCargoDe: unSospechoso.! !

!Detective methodsFor: 'double-dispatch' stamp: 'FM 12/3/2021 18:37:57'!
tipoDePistaDePais: unTestigo 
	
	^ PistaDePais laPistaPaisDe: unTestigo para: self.! !

!Detective methodsFor: 'double-dispatch' stamp: 'FM 12/3/2021 17:33:06'!
tipoDeVueloHacia: unPais

	^ Vuelo tipoDe: unPais para: self.
	! !


!Detective methodsFor: 'validaciones' stamp: 'FM 12/9/2021 10:19:01'!
validarQueElDetectiveNoSeEncuentraEn: unPais

	^ (self estaUbicadoEn: unPais) ifTrue: [self error: self class errorViajeMismoPais]! !

!Detective methodsFor: 'validaciones' stamp: 'FM 12/9/2021 10:18:47'!
validarQueElDetectiveNoSeEncuentraEnDistintoPaisQue: unTestigo

	^ (self seEncuentraEnPaisDistintoQue: unTestigo) ifTrue: [self error: self class errorTestigoEnDistintoPaisQueDetective]! !


!Detective methodsFor: 'actions' stamp: 'FM 12/6/2021 10:44:49'!
agregarPistaPais: unaPistaDePais 
	
	pistaDePais _ unaPistaDePais.! !

!Detective methodsFor: 'actions' stamp: 'FM 12/9/2021 14:42:18'!
interrogarTestigosDelPaisActual
	
	self subclassResponsibility.
	
	
	
	 ! !

!Detective methodsFor: 'actions' stamp: 'FM 12/9/2021 18:51:48'!
realizarOrdenDeArrestoHacia: unSospechoso para: unaPartidaCarmenSandiego 
	
	^ (self tipoDeOrdenDeArrestoPara: unSospechoso) emitirEstadoFinalDePartidaPara: unaPartidaCarmenSandiego.! !

!Detective methodsFor: 'actions' stamp: 'FM 12/9/2021 10:19:01'!
viajarA: unPais

	self validarQueElDetectiveNoSeEncuentraEn: unPais. 
	ubicacion _ unPais. 
	"Modificar el tiempo de la partida desde acá"
	! !


!Detective methodsFor: 'initialization' stamp: 'FM 12/6/2021 10:52:34'!
initialize

	pda _ PersonalDigitalAssistant new.
	pistaDePais _ PistaDePaisNula new. 
	 ! !

!Detective methodsFor: 'initialization' stamp: 'a 11/18/2021 10:55:51'!
ubicadoEn: unPais 
	
	ubicacion _ unPais.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Detective class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Detective class
	instanceVariableNames: ''!

!Detective class methodsFor: 'error handling' stamp: 'FM 12/3/2021 20:18:21'!
errorTestigoEnDistintoPaisQueDetective
	
	^ 'El testigo a interrogar se encuentra en un pais distinto al detective.'! !

!Detective class methodsFor: 'error handling' stamp: 'a 11/25/2021 09:23:54'!
errorViajeMismoPais
	
	^ 'No se puede viajar al mismo pais donde se encuentra el detective'! !


!Detective class methodsFor: 'instance creation' stamp: 'a 11/18/2021 10:54:08'!
ubicadoEn: unPais 
	
	^ self new ubicadoEn: unPais.! !


!classDefinition: #DetectiveClasico category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Detective subclass: #DetectiveClasico
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!DetectiveClasico methodsFor: 'accessing' stamp: 'FM 12/4/2021 16:12:20'!
habilidadDeInterrogación
	
	^ 2 * hour.! !

!DetectiveClasico methodsFor: 'accessing' stamp: 'FM 11/17/2021 17:31:26'!
tiempoPorVolarAOtroPais
	
	^ 10 * hour.! !


!DetectiveClasico methodsFor: 'actions' stamp: 'FM 12/9/2021 14:42:39'!
interrogarTestigosDelPaisActual

	| testigoConPistaDePais |
	
	testigoConPistaDePais _ ((self ubicacion) testigos) detect: [ :unTestigo | unTestigo tienePistaDePais ].
	
	self interrogarPorPistaPaisA: testigoConPistaDePais.
	(self ubicacion) eliminarTestigo: testigoConPistaDePais.
	
	self interrogarPorPistaAspectoA: ((self ubicacion) primerTestigo).
	self interrogarPorPistaAspectoA: ((self ubicacion) segundoTestigo).! !


!classDefinition: #DetectiveInterpol category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Detective subclass: #DetectiveInterpol
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!DetectiveInterpol methodsFor: 'accessing' stamp: 'FM 12/4/2021 16:16:04'!
habilidadDeInterrogación
	
	^ 2 * hour.! !

!DetectiveInterpol methodsFor: 'accessing' stamp: 'FM 12/3/2021 16:43:22'!
tiempoPorVolarAOtroPais
	
	^ 8 * hour.! !


!DetectiveInterpol methodsFor: 'actions' stamp: 'FM 12/9/2021 14:42:52'!
interrogarTestigosDelPaisActual

	| testigoConPistaDePais |
	
	testigoConPistaDePais _ ((self ubicacion) testigos) detect: [ :unTestigo | unTestigo tienePistaDePais ].
	
	self interrogarPorPistaPaisA: testigoConPistaDePais.
	(self ubicacion) eliminarTestigo: testigoConPistaDePais.
	
	self interrogarPorPistaAspectoA: ((self ubicacion) primerTestigo).
	self interrogarPorPistaAspectoA: ((self ubicacion) segundoTestigo).! !


!classDefinition: #DetectivePersuasivo category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Detective subclass: #DetectivePersuasivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!DetectivePersuasivo methodsFor: 'accessing' stamp: 'FM 12/4/2021 16:15:04'!
habilidadDeInterrogación
	
	^ 1 * hour.! !

!DetectivePersuasivo methodsFor: 'accessing' stamp: 'FM 12/3/2021 16:43:26'!
tiempoPorVolarAOtroPais
	
	^ 10 * hour.! !


!DetectivePersuasivo methodsFor: 'actions' stamp: 'FM 12/9/2021 14:43:19'!
interrogarTestigosDelPaisActual

	| testigoConPistaDePais |
	
	testigoConPistaDePais _ ((self ubicacion) testigos) detect: [ :unTestigo | unTestigo tienePistaDePais ].
	
	self interrogarPorPistaPaisA: testigoConPistaDePais.
	self interrogarPorPistaAspectoA: testigoConPistaDePais.
	(self ubicacion) eliminarTestigo: testigoConPistaDePais.
	
	self interrogarPorPistaAspectoA: ((self ubicacion) primerTestigo).
	self interrogarPorPistaAspectoA: ((self ubicacion) primerTestigo).
	
	self interrogarPorPistaAspectoA: ((self ubicacion) segundoTestigo).
	self interrogarPorPistaAspectoA: ((self ubicacion) segundoTestigo).! !


!classDefinition: #ObjetoDeValor category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Object subclass: #ObjetoDeValor
	instanceVariableNames: 'nombre'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!ObjetoDeValor methodsFor: 'instance creation' stamp: 'FM 12/9/2021 13:47:48'!
conNombre: nombreDelObjetoDeValor

	nombre _ nombreDelObjetoDeValor.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ObjetoDeValor class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
ObjetoDeValor class
	instanceVariableNames: ''!

!ObjetoDeValor class methodsFor: 'double-dispatch' stamp: 'FM 12/9/2021 14:14:19'!
puedeHacerseCargoDe: unObjetoDeValor

	^ (self allSubclasses detect: [ :unTipoDeObjetoDeValor | unTipoDeObjetoDeValor puedeHacerseCargoDe: unObjetoDeValor ]) new.
	! !


!ObjetoDeValor class methodsFor: 'instance creation' stamp: 'FM 12/9/2021 14:19:04'!
conNombre: nombreDelObjetoDeValor

	^ self new conNombre: nombreDelObjetoDeValor.
	! !


!classDefinition: #ObjetoDeValorIntacto category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
ObjetoDeValor subclass: #ObjetoDeValorIntacto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!ObjetoDeValorIntacto methodsFor: 'testing' stamp: 'FM 12/9/2021 14:17:39'!
esObjetoDeValorIntacto
	
	^ true.! !


!ObjetoDeValorIntacto methodsFor: 'accessing' stamp: 'FM 12/9/2021 14:19:17'!
nombre
	
	^ nombre.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ObjetoDeValorIntacto class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
ObjetoDeValorIntacto class
	instanceVariableNames: ''!

!ObjetoDeValorIntacto class methodsFor: 'testing' stamp: 'FM 12/9/2021 14:14:56'!
puedeHacerseCargoDe: unObjetoDeValor

	^ unObjetoDeValor esObjetoDeValorIntacto.! !


!classDefinition: #ObjetoDeValorRobado category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
ObjetoDeValor subclass: #ObjetoDeValorRobado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!ObjetoDeValorRobado methodsFor: 'testing' stamp: 'FM 12/9/2021 14:18:16'!
esObjetoDeValorIntacto
	
	^ false! !

!ObjetoDeValorRobado methodsFor: 'testing' stamp: 'FM 12/9/2021 14:18:28'!
esObjetoDeValorRobado
	
	^ true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ObjetoDeValorRobado class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
ObjetoDeValorRobado class
	instanceVariableNames: ''!

!ObjetoDeValorRobado class methodsFor: 'testing' stamp: 'FM 12/9/2021 14:15:22'!
puedeHacerseCargoDe: unObjetoDeValor

	^ unObjetoDeValor esObjetoDeValorRobado.! !


!classDefinition: #OrdenDeArresto category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Object subclass: #OrdenDeArresto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!OrdenDeArresto methodsFor: 'testing' stamp: 'FM 12/7/2021 12:49:16'!
esOrdenDeArrestoAcertada
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrdenDeArresto class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
OrdenDeArresto class
	instanceVariableNames: ''!

!OrdenDeArresto class methodsFor: 'double-dispatch' stamp: 'FM 12/7/2021 12:48:39'!
puedeHacerseCargoDe: unSospechoso

	^ (self allSubclasses detect: [ :unTipoDeOrdenDeArresto | unTipoDeOrdenDeArresto puedeHacerseCargoDe: unSospechoso ]) new.! !


!classDefinition: #OrdenDeArrestoAcertada category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
OrdenDeArresto subclass: #OrdenDeArrestoAcertada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!OrdenDeArrestoAcertada methodsFor: 'testing' stamp: 'FM 12/7/2021 12:44:30'!
esOrdenDeArrestoAcertada
	
	^ true.! !


!OrdenDeArrestoAcertada methodsFor: 'actions' stamp: 'FM 12/9/2021 20:57:39'!
emitirEstadoFinalDePartidaPara: unaPartidaCarmenSandiego 
	
	unaPartidaCarmenSandiego cambiarEstadoFinalAVictoria.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrdenDeArrestoAcertada class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
OrdenDeArrestoAcertada class
	instanceVariableNames: ''!

!OrdenDeArrestoAcertada class methodsFor: 'testing' stamp: 'FM 12/7/2021 12:44:19'!
puedeHacerseCargoDe: unSospechoso 
	
	^ unSospechoso esDelincuente.! !


!classDefinition: #OrdenDeArrestoErrada category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
OrdenDeArresto subclass: #OrdenDeArrestoErrada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!OrdenDeArrestoErrada methodsFor: 'testing' stamp: 'FM 12/7/2021 12:47:14'!
esOrdenDeArrestoAcertada
	
	^ false.! !

!OrdenDeArrestoErrada methodsFor: 'testing' stamp: 'FM 12/7/2021 12:58:33'!
esOrdenDeArrestoErrada
	
	^ true.! !


!OrdenDeArrestoErrada methodsFor: 'actions' stamp: 'FM 12/9/2021 20:59:00'!
emitirEstadoFinalDePartidaPara: unaPartidaCarmenSandiego 
	
	unaPartidaCarmenSandiego cambiarEstadoFinalADerrota.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrdenDeArrestoErrada class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
OrdenDeArrestoErrada class
	instanceVariableNames: ''!

!OrdenDeArrestoErrada class methodsFor: 'testing' stamp: 'FM 12/7/2021 12:46:14'!
puedeHacerseCargoDe: unSospechoso 
	
	^ unSospechoso noEsDelincuente.! !


!classDefinition: #Pais category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Object subclass: #Pais
	instanceVariableNames: 'nombre tiempoDeEsperaEnMigraciones paisesLimitrofes testigos objetoDeValor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!Pais methodsFor: 'accessing' stamp: 'a 11/15/2021 21:39:01'!
nombre
	
	^ nombre! !

!Pais methodsFor: 'accessing' stamp: 'FM 12/9/2021 14:19:28'!
nombreDelObjetoDeValor
	
	^ objetoDeValor nombre.! !

!Pais methodsFor: 'accessing' stamp: 'FM 12/9/2021 13:57:58'!
objetoDeValor
	
	^objetoDeValor! !

!Pais methodsFor: 'accessing' stamp: 'a 11/17/2021 15:03:06'!
paisesLimitrofes
	
	^paisesLimitrofes! !

!Pais methodsFor: 'accessing' stamp: 'FM 12/9/2021 10:40:32'!
testigos
	
	^testigos.! !

!Pais methodsFor: 'accessing' stamp: 'FM 12/3/2021 20:53:31'!
tiempoDeEsperaEnMigraciones
	
	^ tiempoDeEsperaEnMigraciones .! !


!Pais methodsFor: 'testing' stamp: 'a 11/17/2021 15:10:26'!
esLimitrofeCon: unPais 
	
	^ paisesLimitrofes includes: unPais .! !

!Pais methodsFor: 'testing' stamp: 'FM 12/9/2021 14:26:03'!
fueAsaltado
	
	^ objetoDeValor esObjetoDeValorRobado .! !

!Pais methodsFor: 'testing' stamp: 'FM 12/9/2021 10:38:26'!
primerTestigo
	
	^ testigos first.! !

!Pais methodsFor: 'testing' stamp: 'FM 12/9/2021 10:38:52'!
segundoTestigo
	
	^ testigos second.! !

!Pais methodsFor: 'testing' stamp: 'FM 12/9/2021 10:39:03'!
tercerTestigo
	
	^ testigos third.! !

!Pais methodsFor: 'testing' stamp: 'FM 12/9/2021 14:11:33'!
tieneObjetoDeValor
	
	^ (self tipoDeObjetoDeValor: objetoDeValor) esObjetoDeValorIntacto.! !

!Pais methodsFor: 'testing' stamp: 'a 11/15/2021 22:23:10'!
tienePaisLimetrofe
	
	^ paisesLimitrofes notEmpty ! !


!Pais methodsFor: 'initialization' stamp: 'FM 12/9/2021 13:51:18'!
initialize

	paisesLimitrofes _ Set new.
	testigos _ OrderedCollection new.
! !


!Pais methodsFor: 'actions' stamp: 'FM 12/4/2021 12:10:15'!
agregarPaisLimitrofe: paises 
	
	paisesLimitrofes addAll: paises .
	
	paises do: [: pais | pais paisesLimitrofes add: self] .! !

!Pais methodsFor: 'actions' stamp: 'FM 11/30/2021 18:57:51'!
agregarTestigo: unTestigo

	testigos add: unTestigo. 
	! !

!Pais methodsFor: 'actions' stamp: 'FM 12/9/2021 15:45:44'!
dejarPistasATestigosDelDelincuente: unDelincuente 
	
	testigos add: (Testigo ubicadoEn: self conNivelDeDificultad: 2).
	testigos add: (Testigo ubicadoEn: self conNivelDeDificultad: 3).
	testigos add: (Testigo ubicadoEn: self conNivelDeDificultad: 4).
	
	self primerTestigo agregarPistaDePais: (unDelincuente proximaPistaPaisDeLaRuta).
	self segundoTestigo agregarPistaDeAspecto: (PistaDeAspectoValida descripcion: (unDelincuente nombre)).
	self segundoTestigo agregarPistaDeAspecto: (PistaDeAspectoValida descripcion: (unDelincuente colorDeOjos)).
	self tercerTestigo agregarPistaDeAspecto: (PistaDeAspectoValida descripcion: (unDelincuente forma)).
	self tercerTestigo agregarPistaDeAspecto: (PistaDeAspectoValida descripcion: (unDelincuente color)).! !

!Pais methodsFor: 'actions' stamp: 'FM 12/9/2021 14:38:14'!
eliminarTestigo: unTestigo 
	
	testigos remove: unTestigo.! !

!Pais methodsFor: 'actions' stamp: 'FM 12/9/2021 19:48:00'!
escribirEn: unStream 
	
	unStream nextPutAll: nombre.
	unStream space.! !

!Pais methodsFor: 'actions' stamp: 'FM 12/9/2021 14:18:05'!
quitarObjetoDeValor
	
	objetoDeValor _ ObjetoDeValorRobado new.! !


!Pais methodsFor: 'double-dispatch' stamp: 'FM 12/9/2021 14:01:55'!
tipoDeObjetoDeValor: unObjetoDeValor

	^ ObjetoDeValor puedeHacerseCargoDe: unObjetoDeValor.
	! !


!Pais methodsFor: 'instance creation' stamp: 'FM 12/9/2021 13:49:28'!
conNombre: nombreDelPais tiempoDeEspera: unTiempoDeEspera objetoDeValor: unObjetoDeValor

	nombre _ nombreDelPais.
	tiempoDeEsperaEnMigraciones _ unTiempoDeEspera.
	objetoDeValor _ unObjetoDeValor.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pais class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Pais class
	instanceVariableNames: ''!

!Pais class methodsFor: 'instance creation' stamp: 'FM 12/9/2021 13:48:46'!
conNombre: nombreDelPais tiempoDeEspera: unTiempoDeEspera objetoDeValor: unObjetoDeValor

	^ self new conNombre: nombreDelPais tiempoDeEspera: unTiempoDeEspera objetoDeValor: unObjetoDeValor.
	! !


!classDefinition: #PartidaCarmenSandiego category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Object subclass: #PartidaCarmenSandiego
	instanceVariableNames: 'sospechosos paises detective tiempoLimite estadoFinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!PartidaCarmenSandiego methodsFor: 'accessing' stamp: 'FM 12/7/2021 12:08:50'!
delincuente
	
	^ sospechosos detect: [ :unSospechoso | unSospechoso esDelincuente ].! !

!PartidaCarmenSandiego methodsFor: 'accessing' stamp: 'FM 12/2/2021 17:50:21'!
detective
	
	^detective.! !

!PartidaCarmenSandiego methodsFor: 'accessing' stamp: 'FM 12/9/2021 19:07:09'!
objetoRobado
	
	^ (self delincuente) objetoRobado.! !

!PartidaCarmenSandiego methodsFor: 'accessing' stamp: 'FM 12/7/2021 12:13:18'!
paisAsaltado
	
	^ paises detect: [ :unPais | unPais fueAsaltado ].! !

!PartidaCarmenSandiego methodsFor: 'accessing' stamp: 'FM 12/2/2021 17:49:18'!
paises
	
	^paises.! !

!PartidaCarmenSandiego methodsFor: 'accessing' stamp: 'FM 12/2/2021 17:41:35'!
sospechosos
	
	^ sospechosos! !

!PartidaCarmenSandiego methodsFor: 'accessing' stamp: 'FM 12/7/2021 10:57:11'!
tiempoLimite
	
	^ tiempoLimite max: (0 * hour).! !


!PartidaCarmenSandiego methodsFor: 'initialization' stamp: 'FM 12/2/2021 17:45:30'!
initialize

	sospechosos _ Set new.
	paises _ Set new.! !


!PartidaCarmenSandiego methodsFor: 'instance creation' stamp: 'FM 12/7/2021 12:13:40'!
conSospechosos: unaListaDeSospechosos paisesAViajar: unaListaDePaises detective: unDetective tiempoLimiteDe: unTiempoLimite
	
	sospechosos _ unaListaDeSospechosos.
	paises _ unaListaDePaises.
	detective _ unDetective.
	tiempoLimite _ unTiempoLimite.! !


!PartidaCarmenSandiego methodsFor: 'streams' stamp: 'FM 12/9/2021 21:00:54'!
estadoFinalDerrota
	
	
	^ String streamContents: [:unStream | 
	unStream nextPutAll: 'NO HAS ATRAPADO AL LADRON.'.
	unStream newLine.
	unStream nextPutAll: 'Caracteristicas del ladron:'.
	unStream newLine.
	unStream nextPutAll: '- Nombre -> ' , ((self delincuente nombre) descripcion).
	unStream newLine.
	unStream nextPutAll: '- Color de cabello -> ' , ((self delincuente color) descripcion).
	unStream newLine.
	unStream nextPutAll: '- Color de ojos -> ' , ((self delincuente colorDeOjos) descripcion).
	unStream newLine.
	unStream nextPutAll: '- Forma de cabello -> ' , ((self delincuente forma) descripcion).
	unStream newLine.
	unStream nextPutAll: 'Objeto robado: ' , (self objetoRobado nombre).
	unStream newLine.
	unStream nextPutAll: 'Ruta de escape del ladron: < '.
	(self delincuente rutaDeEscape) do: [:cadaPais | cadaPais escribirEn: unStream].
	unStream nextPutAll: '>'.
	unStream newLine.
	unStream nextPutAll: 'Tiempo restante en la partida: '.
	((self tiempoLimite) / hour) printOn: unStream.
	unStream nextPutAll: ' horas'.
	unStream newLine.
	unStream nextPutAll: 'El detective perdio la partida'. 
	]! !

!PartidaCarmenSandiego methodsFor: 'streams' stamp: 'FM 12/9/2021 20:59:43'!
estadoFinalVictoria
	
	
	^ String streamContents: [:unStream | 
	unStream nextPutAll: 'FELICIDADES HAS ATRAPADO AL LADRON.'.
	unStream newLine.
	unStream nextPutAll: 'Caracteristicas del ladron:'.
	unStream newLine.
	unStream nextPutAll: '- Nombre -> ' , ((self delincuente nombre) descripcion).
	unStream newLine.
	unStream nextPutAll: '- Color de cabello -> ' , ((self delincuente color) descripcion).
	unStream newLine.
	unStream nextPutAll: '- Color de ojos -> ' , ((self delincuente colorDeOjos) descripcion).
	unStream newLine.
	unStream nextPutAll: '- Forma de cabello -> ' , ((self delincuente forma) descripcion).
	unStream newLine.
	unStream nextPutAll: 'Objeto robado: ' , (self objetoRobado nombre).
	unStream newLine.
	unStream nextPutAll: 'Ruta de escape del ladron: < '.
	(self delincuente rutaDeEscape) do: [:cadaPais | cadaPais escribirEn: unStream].
	unStream nextPutAll: '>'.
	unStream newLine.
	unStream nextPutAll: 'Tiempo restante en la partida: '.
	((self tiempoLimite) / hour) printOn: unStream.
	unStream nextPutAll: ' horas'.
	unStream newLine.
	unStream nextPutAll: 'El detective gano la partida'. 
	]! !


!PartidaCarmenSandiego methodsFor: 'actions' stamp: 'FM 12/9/2021 20:59:23'!
cambiarEstadoFinalADerrota
	
	estadoFinal _ self estadoFinalDerrota.! !

!PartidaCarmenSandiego methodsFor: 'actions' stamp: 'FM 12/9/2021 20:59:43'!
cambiarEstadoFinalAVictoria
	
	estadoFinal _ (self estadoFinalVictoria).! !

!PartidaCarmenSandiego methodsFor: 'actions' stamp: 'FM 12/9/2021 20:32:16'!
hacerADetectiveRealizarUnaOrdenDeArrestoHacia: unSospechoso 
	
	^ (self detective) realizarOrdenDeArrestoHacia: unSospechoso para: self.
	! !

!PartidaCarmenSandiego methodsFor: 'actions' stamp: 'FM 12/4/2021 16:20:50'!
hacerInterrogarADetectivePorPistaDeAspectoA: unTestigo 
	
	(self detective) interrogarPorPistaAspectoA: unTestigo.
	tiempoLimite _ tiempoLimite - ((self detective) tiempoPorInterrogarA: unTestigo).! !

!PartidaCarmenSandiego methodsFor: 'actions' stamp: 'FM 12/4/2021 16:25:01'!
hacerInterrogarADetectivePorPistaDePaisA: unTestigo 
	
	(self detective) interrogarPorPistaPaisA: unTestigo.
	tiempoLimite _ tiempoLimite - ((self detective) tiempoPorInterrogarA: unTestigo).! !

!PartidaCarmenSandiego methodsFor: 'actions' stamp: 'FM 12/4/2021 11:35:23'!
hacerViajarDetectiveA: unPais

	(self detective) viajarA: unPais.
	tiempoLimite _ tiempoLimite - (self detective tiempoDeViajeTotalPorIrHacia: unPais).
	! !

!PartidaCarmenSandiego methodsFor: 'actions' stamp: 'FM 12/9/2021 21:06:23'!
imprimirEstadoFinalEn: unArchivo

	unArchivo forceWriteStreamDo: [ :unStream | unStream nextPutAll: estadoFinal ]
	! !


!PartidaCarmenSandiego methodsFor: 'testing' stamp: 'FM 12/8/2021 16:43:19'!
esGameOverPorLimiteDeTiempo
	
	^ (self tiempoLimite = (0 * hour)).! !

!PartidaCarmenSandiego methodsFor: 'testing' stamp: 'FM 12/8/2021 16:43:31'!
esGameOverPorOrdenDeArresto: unaOrdenDeArresto

	^ unaOrdenDeArresto esOrdenDeArrestoErrada.
	! !

!PartidaCarmenSandiego methodsFor: 'testing' stamp: 'FM 12/7/2021 12:56:37'!
estaGanadaPorOrdenDeArresto: unaOrdenDeArresto

	^ unaOrdenDeArresto esOrdenDeArrestoAcertada.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PartidaCarmenSandiego class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
PartidaCarmenSandiego class
	instanceVariableNames: ''!

!PartidaCarmenSandiego class methodsFor: 'instance creation' stamp: 'FM 12/7/2021 12:13:29'!
conSospechosos: unaListaDeSospechosos paisesAViajar: unaListaDePaises detective: unDetective tiempoLimiteDe: unTiempoLimite

	^ self new conSospechosos: unaListaDeSospechosos paisesAViajar: unaListaDePaises detective: unDetective tiempoLimiteDe: unTiempoLimite
	! !


!classDefinition: #PersonalDigitalAssistant category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Object subclass: #PersonalDigitalAssistant
	instanceVariableNames: 'pistasDeAspecto'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!PersonalDigitalAssistant methodsFor: 'accessing' stamp: 'FM 12/3/2021 17:45:07'!
pistasDeAspecto
	
	^ pistasDeAspecto .! !


!PersonalDigitalAssistant methodsFor: 'actions' stamp: 'a 12/2/2021 10:04:54'!
anotarPistaAspecto: unAspecto 
	
	(self tipoDePistaDeAspecto: unAspecto) anotarPista: unAspecto en: self. ! !

!PersonalDigitalAssistant methodsFor: 'actions' stamp: 'FM 12/3/2021 17:44:55'!
filtrarSospechosos: unaListaDeSospechosos 

	^ unaListaDeSospechosos detect: [:unSospechoso | unSospechoso cumpleConLosAspectos: pistasDeAspecto ].! !


!PersonalDigitalAssistant methodsFor: 'testing' stamp: 'FM 12/3/2021 17:45:14'!
tienePistas
	
	^ pistasDeAspecto notEmpty.! !


!PersonalDigitalAssistant methodsFor: 'double-dispatch' stamp: 'a 12/1/2021 22:50:03'!
tipoDePistaDeAspecto: unaPistaDeAspecto

	^ PistaDeAspecto tipoDeAspectoDe: unaPistaDeAspecto para: self. 
	! !


!PersonalDigitalAssistant methodsFor: 'private' stamp: 'FM 12/3/2021 17:44:50'!
cantidadDePistasDeAspecto
	
	^ pistasDeAspecto size.! !


!PersonalDigitalAssistant methodsFor: 'initialization' stamp: 'FM 12/3/2021 17:45:02'!
initialize
	
	pistasDeAspecto _ OrderedCollection new.! !


!classDefinition: #PistaDeAspecto category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Object subclass: #PistaDeAspecto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!PistaDeAspecto methodsFor: 'actions' stamp: 'a 12/1/2021 22:21:53'!
anotarPista: unaPistaDeAspecto en: unPersonalDigitalAssistant 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PistaDeAspecto class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
PistaDeAspecto class
	instanceVariableNames: ''!

!PistaDeAspecto class methodsFor: 'double-dispatch' stamp: 'a 12/1/2021 22:54:25'!
tipoDeAspectoDe: unaPistaAspecto para: unPersonalDigitalAssistant 
	
	^ (self allSubclasses detect: [: tipoDePista | tipoDePista puedeHacerseCargoDe: unaPistaAspecto para: unPersonalDigitalAssistant ]) new.! !


!PistaDeAspecto class methodsFor: 'testing' stamp: 'a 12/1/2021 22:58:39'!
puedeHacerseCargoDe: unaPistaDeAspecto para: unPersonalDigitalAssistant 

	self subclassResponsibility ! !


!classDefinition: #PistaDeAspectoNula category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
PistaDeAspecto subclass: #PistaDeAspectoNula
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!PistaDeAspectoNula methodsFor: 'actions' stamp: 'FM 12/1/2021 17:54:26'!
anotarPista: unaPistaDeAspecto en: unPersonalDigitalAssistant 
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PistaDeAspectoNula class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
PistaDeAspectoNula class
	instanceVariableNames: ''!

!PistaDeAspectoNula class methodsFor: 'testing' stamp: 'FM 12/6/2021 11:14:08'!
puedeHacerseCargoDe: unaPistaDeAspecto para: unPersonalDigitalAssistant 
	
	^ (((unPersonalDigitalAssistant pistasDeAspecto) includes: unaPistaDeAspecto) | unaPistaDeAspecto esPistaNula).! !


!classDefinition: #PistaDeAspectoValida category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
PistaDeAspecto subclass: #PistaDeAspectoValida
	instanceVariableNames: 'descripcion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!PistaDeAspectoValida methodsFor: 'actions' stamp: 'FM 12/1/2021 17:49:10'!
anotarPista: unaPistaDeAspecto en: unPersonalDigitalAssistant 
	
	unPersonalDigitalAssistant pistasDeAspecto add: unaPistaDeAspecto.! !


!PistaDeAspectoValida methodsFor: 'testing' stamp: 'FM 12/7/2021 11:03:07'!
coincideConApectoDe: unSospechoso 

	^ ( (((unSospechoso forma) descripcion) = ((self descripcion) descripcion)) 
	|    (((unSospechoso nombre) descripcion) = ((self descripcion) descripcion)) 
	|    (((unSospechoso color) descripcion) = ((self descripcion)  		descripcion)) 
	|    (((unSospechoso colorDeOjos) descripcion) = ((self descripcion) descripcion))
	  ).! !

!PistaDeAspectoValida methodsFor: 'testing' stamp: 'FM 12/6/2021 11:15:15'!
esPistaNula
	
	^ false.! !

!PistaDeAspectoValida methodsFor: 'testing' stamp: 'FM 12/6/2021 11:15:29'!
esPistaValida
	
	^ true.! !


!PistaDeAspectoValida methodsFor: 'accessing' stamp: 'FM 12/6/2021 11:54:56'!
descripcion
	
	^descripcion! !


!PistaDeAspectoValida methodsFor: 'instance creation' stamp: 'FM 12/6/2021 10:57:32'!
descripcion: unaPistaDeAspecto

	descripcion _ unaPistaDeAspecto.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PistaDeAspectoValida class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
PistaDeAspectoValida class
	instanceVariableNames: ''!

!PistaDeAspectoValida class methodsFor: 'testing' stamp: 'FM 12/6/2021 11:14:46'!
puedeHacerseCargoDe: unaPistaDeAspecto para: unPersonalDigitalAssistant

	^ ((((unPersonalDigitalAssistant pistasDeAspecto) includes: unaPistaDeAspecto) not) | unaPistaDeAspecto esPistaValida).
	! !


!PistaDeAspectoValida class methodsFor: 'instance creation' stamp: 'FM 12/7/2021 10:41:01'!
descripcion: unAspecto

	^ self new descripcion: unAspecto.
	! !


!classDefinition: #PistaDePais category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Object subclass: #PistaDePais
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!PistaDePais methodsFor: 'actions' stamp: 'FM 12/3/2021 18:05:10'!
pistaPaisDe: unTestigo para: unDetective

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PistaDePais class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
PistaDePais class
	instanceVariableNames: ''!

!PistaDePais class methodsFor: 'testing' stamp: 'FM 12/3/2021 18:06:30'!
puedeHacerseCargoDePistaPaisDe: unTestigo para: unDetective

	self subclassResponsibility ! !


!PistaDePais class methodsFor: 'double dispatch' stamp: 'FM 12/3/2021 18:28:41'!
laPistaPaisDe: unTestigo para: unDetective 
	
	^ ( self allSubclasses detect: [:tipoDePistaPais | tipoDePistaPais puedeHacerseCargoDePistaPaisDe: unTestigo para: unDetective]) new.! !


!classDefinition: #PistaDePaisNula category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
PistaDePais subclass: #PistaDePaisNula
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!PistaDePaisNula methodsFor: 'testing' stamp: 'FM 12/6/2021 10:46:03'!
esPistaNula
	
	^ true.! !

!PistaDePaisNula methodsFor: 'testing' stamp: 'FM 12/6/2021 11:03:32'!
esPistaValida
	
	^ false.! !


!PistaDePaisNula methodsFor: 'actions' stamp: 'FM 12/4/2021 10:41:10'!
pistaPaisDe: unTestigo para: unDetective 
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PistaDePaisNula class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
PistaDePaisNula class
	instanceVariableNames: ''!

!PistaDePaisNula class methodsFor: 'testing' stamp: 'FM 12/6/2021 10:43:45'!
puedeHacerseCargoDePistaPaisDe: unTestigo para: unDetective
	
	^ (unTestigo pistaDePais) esPistaNula.! !


!classDefinition: #PistaDePaisValida category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
PistaDePais subclass: #PistaDePaisValida
	instanceVariableNames: 'pais'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!PistaDePaisValida methodsFor: 'double-dispatch' stamp: 'FM 12/3/2021 18:41:37'!
pistaPaisDe: unTestigo para: unDetective 
	
	unDetective agregarPistaPais: unTestigo pistaDePais.! !


!PistaDePaisValida methodsFor: 'testing' stamp: 'FM 12/9/2021 12:20:17'!
esPistaNula
	
	^ false.! !

!PistaDePaisValida methodsFor: 'testing' stamp: 'FM 12/9/2021 12:20:28'!
esPistaValida
	
	^ true.! !


!PistaDePaisValida methodsFor: 'accesing' stamp: 'FM 12/9/2021 12:19:26'!
paisDeLaPista
	
	^ pais! !


!PistaDePaisValida methodsFor: 'instance creation' stamp: 'FM 12/9/2021 12:19:15'!
delPais: unPais 
	
	pais _ unPais.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PistaDePaisValida class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
PistaDePaisValida class
	instanceVariableNames: ''!

!PistaDePaisValida class methodsFor: 'testing' stamp: 'FM 12/6/2021 10:43:04'!
puedeHacerseCargoDePistaPaisDe: unTestigo para: unDetective 
	
	^ (unTestigo pistaDePais) esPistaValida.! !


!PistaDePaisValida class methodsFor: 'instance creation' stamp: 'FM 12/9/2021 12:18:57'!
delPais: unPais 
	
	^ self new delPais: unPais. ! !


!classDefinition: #ProximaPistaDeTramoDeRuta category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Object subclass: #ProximaPistaDeTramoDeRuta
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ProximaPistaDeTramoDeRuta class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
ProximaPistaDeTramoDeRuta class
	instanceVariableNames: ''!

!ProximaPistaDeTramoDeRuta class methodsFor: 'double-dispatch' stamp: 'FM 12/9/2021 15:37:08'!
puedeHacerseCargoDe: unaRutaDeEscape 
	
	^ (self allSubclasses detect: [:unProximoTramoDeRuta | unProximoTramoDeRuta puedeHacerseCargoDe:
		 unaRutaDeEscape ]) new.
 	! !


!classDefinition: #ProximaPistaDeTramoDeRutaInvalida category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
ProximaPistaDeTramoDeRuta subclass: #ProximaPistaDeTramoDeRutaInvalida
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!ProximaPistaDeTramoDeRutaInvalida methodsFor: 'accessing' stamp: 'FM 12/9/2021 15:44:02'!
pistaDePaisProximaPara: unaRutaDeEscape 

	^ PistaDePaisNula new.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ProximaPistaDeTramoDeRutaInvalida class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
ProximaPistaDeTramoDeRutaInvalida class
	instanceVariableNames: ''!

!ProximaPistaDeTramoDeRutaInvalida class methodsFor: 'testing' stamp: 'FM 12/9/2021 15:39:38'!
puedeHacerseCargoDe: unaRutaDeEscape

	^ (unaRutaDeEscape size) <= 1.
	! !


!classDefinition: #ProximaPistaDeTramoDeRutaValida category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
ProximaPistaDeTramoDeRuta subclass: #ProximaPistaDeTramoDeRutaValida
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!ProximaPistaDeTramoDeRutaValida methodsFor: 'accessing' stamp: 'FM 12/9/2021 15:44:14'!
pistaDePaisProximaPara: unaRutaDeEscape

	^ PistaDePaisValida delPais: (unaRutaDeEscape second).
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ProximaPistaDeTramoDeRutaValida class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
ProximaPistaDeTramoDeRutaValida class
	instanceVariableNames: ''!

!ProximaPistaDeTramoDeRutaValida class methodsFor: 'testing' stamp: 'FM 12/9/2021 15:35:15'!
puedeHacerseCargoDe: unaRutaDeEscape

	^ (unaRutaDeEscape size) > 1.
	! !


!classDefinition: #Sospechoso category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Object subclass: #Sospechoso
	instanceVariableNames: 'nombre colorDeOjos formaDelCabello colorDeCabello esDelincuente rutaDeEscape ubicacion proximaPistaPaisEnLaRutaDeEscape rutaDeEscapeTotal objetoRobado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!Sospechoso methodsFor: 'accessing' stamp: 'a 12/4/2021 09:59:15'!
color
	
	^colorDeCabello.! !

!Sospechoso methodsFor: 'accessing' stamp: 'FM 11/11/2021 16:39:43'!
colorDeOjos
	
	^colorDeOjos.! !

!Sospechoso methodsFor: 'accessing' stamp: 'a 12/4/2021 10:00:20'!
forma
	
	^formaDelCabello.! !

!Sospechoso methodsFor: 'accessing' stamp: 'FM 11/11/2021 16:30:34'!
nombre
	
	^ nombre.! !

!Sospechoso methodsFor: 'accessing' stamp: 'FM 12/9/2021 19:08:17'!
objetoRobado
	
	^objetoRobado! !

!Sospechoso methodsFor: 'accessing' stamp: 'FM 12/9/2021 15:45:33'!
proximaPistaPaisDeLaRuta
	
	^ proximaPistaPaisEnLaRutaDeEscape.
  ! !

!Sospechoso methodsFor: 'accessing' stamp: 'FM 12/9/2021 15:59:45'!
rutaDeEscape
	
	^ rutaDeEscapeTotal.! !

!Sospechoso methodsFor: 'accessing' stamp: 'FM 12/8/2021 19:28:58'!
ubicacion
	
	^ ubicacion.! !

!Sospechoso methodsFor: 'accessing' stamp: 'FM 12/9/2021 16:00:53'!
unTipoDeTramoDeRutaDeEscape: unaRutaDeEscape 
	
	^ ProximaPistaDeTramoDeRuta puedeHacerseCargoDe: unaRutaDeEscape.! !


!Sospechoso methodsFor: 'initialization' stamp: 'FM 12/9/2021 21:40:18'!
initialize 

	esDelincuente _ false.
	rutaDeEscape _ OrderedCollection new.
	rutaDeEscapeTotal _ OrderedCollection new.
	proximaPistaPaisEnLaRutaDeEscape _ PistaDePaisNula new.! !


!Sospechoso methodsFor: 'instance-creation' stamp: 'FM 12/8/2021 19:32:27'!
ubicadoEn: unPais conNombre: unNombre colorDeOjos: unColorDeOjos formaDelCabello: unaFormaDelCabello colorDeCabello: unColorDeCabello

	ubicacion _ unPais.
	nombre _ unNombre.
	colorDeOjos _ unColorDeOjos.
	formaDelCabello _ unaFormaDelCabello.
	colorDeCabello _ unColorDeCabello.! !


!Sospechoso methodsFor: 'testing' stamp: 'a 12/6/2021 19:22:36'!
cumpleConLosAspectos: pistasDeAspectos

	^ pistasDeAspectos allSatisfy: [:cadaPistaDeAspecto | cadaPistaDeAspecto coincideConApectoDe: self].
	! !

!Sospechoso methodsFor: 'testing' stamp: 'FM 12/7/2021 12:01:32'!
esDelincuente

	^ esDelincuente.! !

!Sospechoso methodsFor: 'testing' stamp: 'FM 12/9/2021 10:17:31'!
estaUbicadoEn: unPais 
	
	^ self ubicacion = unPais.! !

!Sospechoso methodsFor: 'testing' stamp: 'FM 12/7/2021 12:46:35'!
noEsDelincuente
	
	^ esDelincuente = false.! !


!Sospechoso methodsFor: 'actions' stamp: 'FM 12/9/2021 15:59:24'!
actualizarProximoPais
	
	proximaPistaPaisEnLaRutaDeEscape _ (self unTipoDeTramoDeRutaDeEscape: rutaDeEscape) pistaDePaisProximaPara: rutaDeEscape.
	rutaDeEscape remove: (rutaDeEscape first).
	! !

!Sospechoso methodsFor: 'actions' stamp: 'FM 12/9/2021 11:58:45'!
dejarPistasATestigosDe: unPais 
	
	unPais dejarPistasATestigosDelDelincuente: self. ! !

!Sospechoso methodsFor: 'actions' stamp: 'FM 12/9/2021 15:59:08'!
escaparPorRuta: unaListaDePaises
	
	rutaDeEscapeTotal addAll: unaListaDePaises.
	rutaDeEscape addAll: unaListaDePaises.
	unaListaDePaises do: [ 
		:cadaPais | self viajarA: cadaPais.
		self actualizarProximoPais.
		self dejarPistasATestigosDe: cadaPais.
		].
	! !

!Sospechoso methodsFor: 'actions' stamp: 'FM 12/9/2021 19:08:44'!
robarObjetoDeValorDe: unPais 
	
	esDelincuente _ true.
	objetoRobado _ unPais objetoDeValor.
	unPais quitarObjetoDeValor.
	! !

!Sospechoso methodsFor: 'actions' stamp: 'FM 12/9/2021 15:52:07'!
viajarA: unPais 
	
	self validarQueElSospechosoNoSeEncuentreEn: unPais.
	ubicacion _ unPais.
	! !


!Sospechoso methodsFor: 'validaciones' stamp: 'FM 12/9/2021 10:18:14'!
validarQueElSospechosoNoSeEncuentreEn: unPais

	^ (self estaUbicadoEn: unPais) ifTrue: [self error: self class errorPorViajeAMismoPais]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sospechoso class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Sospechoso class
	instanceVariableNames: ''!

!Sospechoso class methodsFor: 'instance creation' stamp: 'FM 12/8/2021 19:31:39'!
ubicadoEn: unPais conNombre: unNombre colorDeOjos: unColorDeOjos formaDelCabello: unaFormaDeCabello colorDeCabello: unColorDeCabello 
	
	^ self new ubicadoEn: unPais conNombre: unNombre colorDeOjos: unColorDeOjos formaDelCabello: unaFormaDeCabello colorDeCabello: unColorDeCabello.! !


!Sospechoso class methodsFor: 'error handling' stamp: 'FM 12/9/2021 10:16:34'!
errorPorViajeAMismoPais
	
	^ 'El sospechoso no puede viajar al mismo pais donde se encuentra.' ! !


!classDefinition: #Testigo category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Object subclass: #Testigo
	instanceVariableNames: 'ubicacion pistaDePais pistasDeAspecto nivelDeDificultad'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!Testigo methodsFor: 'actions' stamp: 'FM 12/6/2021 11:05:06'!
agregarPistaDeAspecto: unaPistaDeAspecto 
	
	pistasDeAspecto add: unaPistaDeAspecto ! !

!Testigo methodsFor: 'actions' stamp: 'FM 12/6/2021 10:45:45'!
agregarPistaDePais: unaPistaDePais 
	
	pistaDePais _ unaPistaDePais .! !


!Testigo methodsFor: 'initialization' stamp: 'FM 12/6/2021 10:45:25'!
initialize

	pistasDeAspecto _ OrderedCollection new.
	pistaDePais _ PistaDePaisNula new.! !

!Testigo methodsFor: 'initialization' stamp: 'a 11/18/2021 14:49:41'!
ubicadoEn: unPais 
	
	ubicacion _ unPais ! !


!Testigo methodsFor: 'private' stamp: 'FM 12/4/2021 12:19:48'!
unaPistaDeAspecto
	
	^ (self pistasDeAspecto) first.! !


!Testigo methodsFor: 'accessing' stamp: 'FM 12/4/2021 16:05:09'!
nivelDeDificultad
	
	^ nivelDeDificultad.! !

!Testigo methodsFor: 'accessing' stamp: 'FM 12/6/2021 10:45:52'!
pistaDePais
	
	^ pistaDePais.! !

!Testigo methodsFor: 'accessing' stamp: 'a 11/27/2021 22:54:53'!
pistasDeAspecto
	
	^pistasDeAspecto! !

!Testigo methodsFor: 'accessing' stamp: 'a 11/18/2021 14:49:57'!
ubicacion
	
	^ubicacion! !


!Testigo methodsFor: 'testing' stamp: 'FM 12/6/2021 11:04:45'!
tienePistaDeAspecto
	
	^ pistasDeAspecto notEmpty.! !

!Testigo methodsFor: 'testing' stamp: 'FM 12/6/2021 11:03:13'!
tienePistaDePais
	
	^ pistaDePais esPistaValida.! !


!Testigo methodsFor: 'instance creation' stamp: 'FM 12/4/2021 16:06:27'!
ubicadoEn: unPais conNivelDeDificultad: unNivelDeDificultad

	ubicacion _ unPais.
	nivelDeDificultad _ (unNivelDeDificultad min: 5).
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Testigo class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Testigo class
	instanceVariableNames: ''!

!Testigo class methodsFor: 'error handling' stamp: 'FM 11/25/2021 12:30:13'!
errorSinPistaPais
	
	^ 'El testigo no vio a ningun sospechoso.'.! !


!Testigo class methodsFor: 'instance creation' stamp: 'FM 12/4/2021 16:04:32'!
ubicadoEn: unPais conNivelDeDificultad: unNivelDeDificultad

	^ self new ubicadoEn: unPais conNivelDeDificultad: unNivelDeDificultad.
	! !


!classDefinition: #Vuelo category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Object subclass: #Vuelo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!Vuelo methodsFor: 'accessing' stamp: 'a 11/17/2021 21:55:41'!
tiempoDeVueloPara: unDetective

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vuelo class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Vuelo class
	instanceVariableNames: ''!

!Vuelo class methodsFor: 'double-dispatch' stamp: 'a 12/1/2021 23:55:06'!
tipoDe: unPais para: unDetective 
	
	^ (self allSubclasses detect: [ :tipoDeVuelo | tipoDeVuelo puedeHacerseCargoDe: unDetective hacia: unPais ]) new.! !


!Vuelo class methodsFor: 'accessing' stamp: 'a 11/17/2021 22:36:46'!
puedeHacerseCargoDe: unDetective hacia: unPais 
	
	self subclassResponsibility ! !


!classDefinition: #VueloAPaisLimitrofe category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Vuelo subclass: #VueloAPaisLimitrofe
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!VueloAPaisLimitrofe methodsFor: 'accessing' stamp: 'FM 11/17/2021 17:52:06'!
tiempoDeVueloPara: unDetective

	^ (unDetective tiempoPorVolarAOtroPais) / 2.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VueloAPaisLimitrofe class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
VueloAPaisLimitrofe class
	instanceVariableNames: ''!

!VueloAPaisLimitrofe class methodsFor: 'accessing' stamp: 'a 11/18/2021 10:52:17'!
puedeHacerseCargoDe: unDetective hacia: unPais

	^ (unDetective ubicacion) esLimitrofeCon: unPais.! !


!classDefinition: #VueloAPaisNoLimitrofe category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
Vuelo subclass: #VueloAPaisNoLimitrofe
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TrabajoFinal-CarmenSandiego-Grupo5'!

!VueloAPaisNoLimitrofe methodsFor: 'accessing' stamp: 'FM 11/17/2021 17:31:13'!
tiempoDeVueloPara: unDetective

	^ unDetective tiempoPorVolarAOtroPais.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VueloAPaisNoLimitrofe class' category: 'TrabajoFinal-CarmenSandiego-Grupo5'!
VueloAPaisNoLimitrofe class
	instanceVariableNames: ''!

!VueloAPaisNoLimitrofe class methodsFor: 'accessing' stamp: 'a 11/18/2021 10:52:17'!
puedeHacerseCargoDe: unDetective hacia: unPais 
	
	^ ((unDetective ubicacion) esLimitrofeCon: unPais) not.! !
