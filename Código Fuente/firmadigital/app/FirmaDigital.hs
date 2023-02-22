module FirmaDigital where

import Data.Digest.SHA256 as SHA256
import Codec.Utils
import Data.Hex --it's a hidden package
import Numeric
import Codec.Encryption.RSA as RSA
import Codec.Encryption.RSA.NumberTheory as NT

--to load into ghci use :set -package hex

hashear :: String -> [Octet]
--hashear texto = showHex (fromOctets 256 (SHA512.hash (toOctets 256 (fst (readHex (hex texto) !! 0))))) ""
hashear texto = SHA256.hash (toOctets 256 (fst (readHex (hex texto) !! 0)))

--Constantes de ejemplo
p=12843959066341343096100573083179851349792014070763827228614740401364070981827010322841801362566989820958077937299143452280554691896046466170604974628597773 --Primo 1
q=11143398512071705081456156818614217071498925561060063466417830690709700855304951177025144902578002646482045611096164394081070515442014117753952804591693373 --Primo 2
n=p*q --valor_publico
phi_n=(p-1)*(q-1) --número de coprimos de n
e=65537 --clave pública
d=inverse e phi_n --clave privada

firmar :: String -> Integer -> Integer -> Integer
firmar mensaje valor_publico clave_privada = fromOctets 256 (RSA.encrypt ((toOctets 256 valor_publico),(toOctets 256 clave_privada)) (hashear mensaje))

verificar :: String -> Integer -> Integer -> Integer ->Bool
verificar mensaje firma valor_publico clave_publica = (fromOctets 256 (hashear mensaje)) == (fromOctets 256 (RSA.decrypt ((toOctets 256 valor_publico),(toOctets 256 clave_publica)) (toOctets 256 firma)))