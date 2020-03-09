.model small ;1 segmento para datos y un segmento para codigo

.data
	colora db 13h ;color fondo gris 13h amarillo 2Ch
	colorb db 37h ;color logo azul 09h 37h 36h negro 00h
	
	condiciones1 dw 13790d, 14110d, 14430d, 14750d, 15070d, 15390d, 15710d, 16030d, 16350d, 16670d, 17002d, 17322d, 17642d, 17962d, 18282d, 18602d, 18922d, 19242d, 19562d, 19882d ;cada uno pesa 16 bits por eso DI se tiene que mover de dos en dos
		     dw 20212d, 20532d, 20852d, 21172d, 21492d, 21812d, 22132d, 22452d, 22772d, 23092d, 23412d, 23742d, 24062d, 24382d, 24702d, 25022d, 25342d, 25662d, 25982d, 26302d   
		     dw 26622d, 26952d, 27272d, 27592d, 27912d, 28232d, 28552d, 28872d, 29192d, 29512d, 29832d, 30152d, 30472d, 30792d, 31112d, 31432d, 31752d, 32072d, 32392d, 32712d
		     dw 33032d, 33352d, 33672d, 33992d, 34312d, 34632d, 34952d, 35272d, 35592d, 35912d, 36232d, 36552d, 36872d, 37224d, 37544d, 37864d, 38184d, 38504d, 38824d, 39144d
		     dw 39464d, 39784d, 40104d, 40444d, 40764d, 41084d, 41404d, 41724d, 42044d, 42364d, 42684d, 43004d, 43324d, 43644d, 43984d, 44304d, 44624d, 44944d, 45264d, 45584d
		     dw 45904d, 46224d, 46544d, 46864d, 47184d, 47514d, 47834d, 48154d, 48474d, 48794d, 49114d, 49434d, 49754d, 50074d, 50394d, 17104d, 17424d, 17744d, 18064d, 18384d
		     dw 18704d, 19024d, 19344d, 19664d, 19984d, 20304d, 17124d, 17444d, 17764d, 18084d, 18404d, 18724d, 19044d, 19364d, 19684d, 20004d, 20324d, 13956d, 14276d, 14596d
		     dw 14916d, 15236d, 15556d, 15876d, 16196d, 16516d, 16836d, 20624d, 20944d, 21264d, 21584d, 21904d, 22224d, 22544d, 22864d, 23184d, 23504d, 17156d, 17476d, 17796d
		     dw 18116d, 18436d, 18756d, 19076d, 19396d, 19716d, 20036d, 20356d, 20666d, 20986d, 21306d, 21626d, 21946d, 22266d, 22586d, 22906d, 23226d, 23546d
	condiciones2 dw 13882d, 14202d, 14522d, 14842d, 15162d, 15482d, 15802d, 16122d, 16442d, 16762d, 17082d, 17402d, 17722d, 18042d, 18362d, 18682d, 19002d, 19322d, 19642d, 19962d
		     dw 20282d, 20612d, 20932d, 21252d, 21572d, 21892d, 22212d, 22532d, 22852d, 23172d, 23492d, 23936d, 24256d, 24576d, 24896d, 25216d, 25536d, 25856d, 26176d, 26496d 
		     dw 26816d, 27126d, 27446d, 27766d, 28086d, 28406d, 28726d, 29046d, 29366d, 29686d, 30006d, 30326d, 30646d, 30966d, 31286d, 31606d, 31926d, 32246d, 32566d, 32886d
		     dw 33206d, 33526d, 33846d, 34166d, 34486d, 34806d, 35126d, 35446d, 35766d, 36086d, 36406d, 36726d, 37046d, 37334d, 37654d, 37974d, 38294d, 38614d, 38934d, 39254d
		     dw 39574d, 39894d, 40214d, 40514d, 40834d, 41154d, 41474d, 41794d, 42114d, 42434d, 42754d, 43074d, 43394d, 43714d, 44014d, 44334d, 44654d, 44974d, 45294d, 45614d
		     dw 45934d, 46254d, 46574d, 46894d, 47214d, 47524d, 47844d, 48164d, 48484d, 48804d, 49124d, 49444d, 49764d, 50084d, 50404d, 17114d, 17434d, 17754d, 18074d, 18394d
		     dw 18714d, 19034d, 19354d, 19674d, 19994d, 20314d, 17134d, 17454d, 17774d, 18094d, 18414d, 18734d, 19054d, 19374d, 19694d, 20014d, 20334d, 14048d, 14368d, 14688d
		     dw 15008d, 15328d, 15648d, 15968d, 16288d, 16608d, 16928d, 20654d, 20974d, 21294d, 21614d, 21934d, 22254d, 22574d, 22894d, 23214d, 23534d, 17236d, 17556d, 17876d
		     dw 18196d, 18516d, 18836d, 19156d, 19476d, 19796d, 20116d, 20426d, 20746d, 21066d, 21386d, 21706d, 22026d, 22346d, 22666d, 22986d, 23306d, 23626d
.code

	mov ax,seg colora
	mov ds,ax ;inicializamos ds = direcc. comienzo del seg . datos


;Establecemos modo grafico en pantalla
mov al,13h
mov ah,0
int 10h

;;0A000:0000 <- "pixel azul"

mov ax,0A000h
mov es,ax 	;ES=0A000h

cero:
mov si,0



bucle:
mov al,colora
mov es:[SI],al

add si,2d

;He simplificado todos estos saltos condicionales con un código que ocupa menos espacio y ahora permite saltar
MOV DI, 0
BCLEcond1:
	CMP SI, condiciones1[DI]
	JE bucle2
	ADD DI, 2
CMP DI, 356 ;aqui tengo que poner el doble de los enteros que ponga en el array
JB BCLEcond1
;Fin del codigo optimizado, puedes hacer esto mismo con la tira de saltos de abajo

cmp si,63999d
je cero

jmp bucle

bucle2:
mov al,colorb
mov es:[SI],al

add si,2d

;He simplificado todos estos saltos condicionales con un código que ocupa menos espacio y ahora permite saltar
MOV DI, 0
BCLEcond2:
	CMP SI, condiciones2[DI]
	JE bucle
	ADD DI, 2
CMP DI, 356 ;aqui tengo que poner el doble de los enteros que ponga en el array
JB BCLEcond2
;Fin del codigo optimizado, puedes hacer esto mismo con la tira de saltos de abajo

cmp si,63999d
je cero

jmp bucle2




mov ah, 0
int 16h

mov ah,4ch ;para terminar el programa
int 21h
end