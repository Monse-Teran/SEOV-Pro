
# Imagen oficial de SWI-Prolog
FROM swipl:stable

# Directorio de trabajo
WORKDIR /app

# Copiar los archivos de Prolog
COPY servidor_web.pl .
COPY main.pl .

# Puerto de referencia del servidor
EXPOSE 8080

# Iniciar SEOV-Pro
CMD ["swipl", "-q", "-s", "main.pl"]

