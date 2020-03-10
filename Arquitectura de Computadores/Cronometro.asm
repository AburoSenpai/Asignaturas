.MODEL SMALL
.CODE
	org 100h
	
Programa_Int:
	JMP Reside ;salto incondicional
	SEGUN DB 0
	CRONO DB '00:00'
	
Rutina_Servicio PROC
	CLI ;atiende la interrupcion para que no se puedan activar otras
	;Salvar el contenido de los registros implicados en la rutina
	         
	     
	INC SEGUN ;Incrementar Contador para el temporizador

		CMP SEGUN, 18
		JB SALIR ;es un temporizador para volver a subir un segundo/ salto condicional cuando es menor
		MOV SEGUN, 0 ;Si es mayor se reinica temporizador
		
		MOV AX, 0B800h
		MOV ES, AX
		MOV AH, 00001111b ;Salta a graficos y pone letras blancas fondo negro
		MOV SI, 0 ;registro extra de datos para mostrar cadena
		MOV DI, 148 ;registro extra de datos para la posicion de la cadena
		MCADENA:
			MOV AL, CRONO[SI] ;Muestra la cadena de crono por pantalla
			MOV ES:[DI], AX
			ADD DI, 2
			INC SI
		CMP SI, 4
		JBE MCADENA ;salto por debajo o igual a 0 
		
		;Aqui se controla el reloj 
		
		CMP CRONO[4], '9' ;Cuando CRONO en la posicion 4 sea 9 
		JNE SEGUNDOMAS		;Se pone a 0 y se incrementa la posicion 3 en 1
		MOV CRONO[4], '0'	;asi con todas las posiciones del reloj
		INC CRONO[3]
		
		CMP CRONO[3], '6'
		JNE SALIR  ;salto cuando no es cero
		MOV CRONO[3], '0'
		INC CRONO[1]
		
		CMP CRONO[1], '9'
		JNE SALIR
		MOV CRONO[1], '0'
		INC CRONO[0]
		
		CMP CRONO[0], '6'
		JNE SALIR
		MOV CRONO[0], '0'
		JMP SALIR ;otro salto incondicional
		
		
		SEGUNDOMAS:
		INC CRONO[4] ;Aumenta 1 a los segundos en la cadena crono
		SALIR:


	STI ;activa para que se puedan atender otras interrupciones
		 ;Recupera el valor de los registros implicados en la rutina
	IRET ;Termina la interrupcion
ENDP
Reside:  ;etiqueta para determinar la dirección siguiente a la Ultima 
			;de la rutina que debe quedar residente

	MOV DX, offset Rutina_Servicio ;Desplazamiento, donde comienza la rutina de servicio
	MOV AX, 0 ;Escribimos en el registro del segmento extra 0, porque queremos escribir justo 
				;en el principio de la memoria, que es donde esta el vector de interrupcion.
	MOV ES, AX ;No podemos escribir con direccionamiento inmediato en ES, por eso usamos AX como intermediario
	MOV SI, 1Ch*4 ;En el registro indice ponemos la posicion del vector de interrupciones donde queremos escribir la entrada.
				;1Ch porque es el codigo de la interrupcion de reloj. El *4 es debido a que cada entrada de esta tabla ocupa 4 bytes.
	CLI
	MOV ES:[SI], DX ;Copiamos el desplazamiento de la rutina de servicio
	MOV ES:[SI+2], CS ;Dos bytes mas abajo copiamos el segmento de nuestro codigo
	STI
	MOV DX, offset Reside;Ponemos en DX el desplazamiento del final de la rutina de atencion a la interrupcion, 
	                     ;que acaba justo donde empieza esta seccion de codigo.
	INT 27h  ;interrupcion que hace "termina y sigue residente"
END Programa_Int