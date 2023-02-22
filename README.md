# FIRMA DIGITAL
Este módulo en Haskell implementa una firma digital utilizando el algoritmo de encriptación RSA y la función de hash SHA-256. La firma digital se puede utilizar para verificar la integridad de un mensaje y la identidad del remitente. Solo permite la firma para archivos de texto. No se incluye la generación de las claves.

# ARCHIVOS ADICIONALES
Dentro de la carpeta Ejecutable se encuentran los archivos "archivo.txt", "valor_publico.txt", "clave_publica.txt" y "clave privada.txt" que pueden ser usados para probar el funcionamiento del programa.

* "archivo.txt" puede ser cualquier tipo de documento de texto.
* "valor_publico.txt" contiene el producto de los dos número primos escogidos para generar las claves. Dicho valor está expresado en base decimal.
* "clave_publica.txt" contiene el valor en base decimal de la clave pública.
* "clave_privada.txt" contiene el valor en base decimal de la clave privada.

# USO
Para utilizar el módulo, primero es necesario importarlo en un archivo de Haskell y luego llamar a las funciones firmar o verificar. La función firmar toma un mensaje de texto y dos enteros como argumentos, el valor público y la clave privada, y devuelve la firma del mensaje como un entero. La función verificar toma un mensaje de texto, una firma y dos enteros como argumentos, el valor público y la clave pública, y devuelve un valor booleano que indica si la firma es válida o no.
También se proporciona una interfaz de línea de comandos para facilitar el uso del módulo. Desde la línea de comandos, se puede firmar un archivo utilizando la opción --firmar y verificar una firma utilizando la opción --verificar. Por ejemplo:

    $ ./firmadigital.exe Main.hs --firmar archivo.txt valor_publico.txt clave_privada.txt

Esto generará una firma del archivo archivo.txt utilizando el valor público y la clave privada especificados en los archivos valor_publico.txt y clave_privada.txt, respectivamente. La firma se guardará en un archivo llamado firma.txt.

    $ ./firmadigital.exe Main.hs --verificar archivo.txt firma.txt valor_publico.txt clave_publica.txt

Esto verificará si la firma en el archivo firma.txt corresponde al archivo archivo.txt, utilizando el valor público y la clave pública especificados en los archivos valor_publico.txt y clave_publica.txt, respectivamente.

# DEPENDENCIAS
El módulo depende de las siguientes bibliotecas de Haskell:

Data.Digest.SHA256
Codec.Utils
Data.Hex
Numeric
Codec.Encryption.RSA
Codec.Encryption.RSA.NumberTheory

La biblioteca Data.Hex es una biblioteca oculta, por lo que es necesario incluir el flag <<-package hex>> al compilar el proyecto o al usarlo desde GHCI.

# COMPILACIÓN
Se uso la herramienta CABAL para gestionar el proyecto. Para compilarlo basta simplemente con ir a la carpeta "Código Fuente/firmadigital" y ejecutar en una terminal lo siguiente:

    $ cabal build

# LICENCIA
Este trabajo está bajo una Licencia Creative Commons Atribución 4.0 Internacional.
Usted es libre de:
- Compartir — copiar y redistribuir el material en cualquier medio o formato
- Adaptar — remezclar, transformar y construir a partir del material
para cualquier propósito, incluso comercialmente.

Bajo los siguientes términos:
- Atribución — Debe otorgar el crédito correspondiente, proporcionar un enlace a la licencia e indicar si se han realizado cambios. Puede hacerlo de cualquier manera razonable, pero no de manera que sugiera que tiene el apoyo del licenciante o lo recibe por el uso que hace.
- No hay restricciones adicionales — No puede aplicar términos legales ni medidas tecnológicas que restrinjan legalmente a otros a hacer cualquier cosa que la licencia permita.

