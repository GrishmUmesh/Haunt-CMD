@echo off
setlocal enabledelayedexpansion

rem Define Morse code mappings for letters A-Z
set A=.-
set B=-...
set C=-.-.
set D=-..
set E=.
set F=..-.
set G=--.
set H=....
set I=..
set J=.---
set K=-.-
set L=.-..
set M=--
set N=-.
set O=---
set P=.--.
set Q=--.-
set R=.-.
set S=...
set T=-
set U=..-
set V=...-
set W=.-- 
set X=-..-
set Y=-.--
set Z=--..

rem Define Morse code mappings for numbers 0-9
set 0=-----
set 1=.----
set 2=..---
set 3=...--
set 4=....-
set 5=.....
set 6=-....
set 7=--...
set 8=---..
set 9=----.

rem Get input from command line or prompt
if "%1"=="" (
    set /p "input=Enter text to convert: "
) else (
    set "input=%*"
)

rem Convert input to uppercase
set "input=%input:a=A%"
set "input=%input:b=B%"
set "input=%input:c=C%"
set "input=%input:d=D%"
set "input=%input:e=E%"
set "input=%input:f=F%"
set "input=%input:g=G%"
set "input=%input:h=H%"
set "input=%input:i=I%"
set "input=%input:j=J%"
set "input=%input:k=K%"
set "input=%input:l=L%"
set "input=%input:m=M%"
set "input=%input:n=N%"
set "input=%input:o=O%"
set "input=%input:p=P%"
set "input=%input:q=Q%"
set "input=%input:r=R%"
set "input=%input:s=S%"
set "input=%input:t=T%"
set "input=%input:u=U%"
set "input=%input:v=V%"
set "input=%input:w=W%"
set "input=%input:x=X%"
set "input=%input:y=Y%"
set "input=%input:z=Z%"

rem Initialize output
set "output="

rem Process each character in input
for /l %%i in (0,1,100) do (
    set "char=!input:~%%i,1!"
    if "!char!"=="" goto :break
    if "!char!"==" " (
        set "output=!output!/ "
    ) else (
        for /f "delims=" %%c in ("!char!") do (
            set "code=!%%c!"
            if defined code (
                set "output=!output!!code! "
            )
        )
    )
)
:break

rem Display result
echo Morse Code: %output%
endlocal
