#!/bin/bash

# Créer le dossier assets s'il n'existe pas
mkdir -p assets

# Télécharger l'image source depuis le site web
curl -o assets/source-icon.png https://playtv4kdesign.netlify.app/favicon.ico

# Installer les dépendances nécessaires
npm install -g sharp-cli

# Générer les différentes tailles d'icônes
npx sharp -i assets/source-icon.png -o assets/icon.png resize 1024 1024
npx sharp -i assets/source-icon.png -o assets/adaptive-icon.png resize 1024 1024
npx sharp -i assets/source-icon.png -o assets/splash.png resize 2048 2048
npx sharp -i assets/source-icon.png -o assets/favicon.png resize 48 48

echo "Assets générés avec succès !"
