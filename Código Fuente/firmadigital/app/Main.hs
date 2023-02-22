module Main where


import System.IO  
import FirmaDigital as FD
import System.Environment -- Módulo para leer argumentos desde la consola

main :: IO ()

main = do 
         args <- getArgs
         case args of
           ("--firmar":ruta_archivo:ruta_n:ruta_d:_) -> do
               mensaje <- readFile ruta_archivo
               aux_n <- readFile ruta_n
               let n = read aux_n :: Integer
               aux_d <- readFile ruta_d
               let d = read aux_d :: Integer
               let firma = firmar mensaje n d
               writeFile "firma.txt"  (show firma)
               putStrLn "El archivo fue firmado exitosamente. La firma se encuentra en el archivo firma.txt"
           ("--verificar":ruta_archivo:ruta_firma:ruta_n:ruta_e:_) -> do
               mensaje <- readFile ruta_archivo
               aux <- readFile ruta_firma
               let firma = read aux :: Integer
               aux_n <- readFile ruta_n
               let n = read aux_n :: Integer
               aux_e <- readFile ruta_e
               let e = read aux_e :: Integer
               let es_valido = verificar mensaje firma n e
               putStrLn (accion es_valido)
               where
                   accion validez 
                     | validez = "El archivo corresponde con la firma y clave dada."
                     | otherwise = "El archivo NO corresponde con la firma o clave dada."
           _ -> putStrLn "Error en los argumentos de entrada."
         
       
         
         
 
    
