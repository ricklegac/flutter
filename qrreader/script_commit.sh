#!/bin/bash

# Obtener la cantidad de commits en la rama actual
commit_count=$(git rev-list --count HEAD)

# Verificar si se proporcionó un mensaje de commit
if [ -z "$1" ]; then
  echo "Por favor, proporciona un mensaje de commit."
  exit 1
fi

# Agregar todos los cambios
git add .

# Hacer un commit con el mensaje proporcionado y la cantidad de commits
git commit -m "$commit_count - $1 "

# Hacer un push a la rama actual
git push

