#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Uso: $0 <login> <nombre_apellido> <departamento>"
  exit 1
fi

LOGIN=$1
NOMBRE_COMPLETO=$2
DEPARTAMENTO=$3

if [[ "$DEPARTAMENTO" != "contabilidad" && "$DEPARTAMENTO" != "finanzas" && "$DEPARTAMENTO" != "tecnologia" ]]; then
  echo "Error: Departamento no válido. Debe ser contabilidad, finanzas o tecnologia."
  exit 2
fi

PASSWORD=$(openssl rand -base64 12)

if ! getent group "$DEPARTAMENTO" > /dev/null; then
  groupadd "$DEPARTAMENTO"
fi

useradd -m -c "$NOMBRE_COMPLETO" -g "$DEPARTAMENTO" "$LOGIN"

echo "$LOGIN:$PASSWORD" | chpasswd

chage -d 0 "$LOGIN"

echo "Usuario creado exitosamente:"
echo "Login: $LOGIN"
echo "Nombre completo: $NOMBRE_COMPLETO"
echo "Departamento: $DEPARTAMENTO"
echo "Contraseña temporal: $PASSWORD"

