#!/bin/bash

# Configuration des variables d'environnement
export EXPO_TOKEN=y8MgUBG771013PAllzVGpq9_LmvzcubHVRSiNYQA
export EAS_NO_VCS=1

# Mise à jour de la configuration
cat > eas.json << 'EOL'
{
  "cli": {
    "version": ">= 5.9.1"
  },
  "build": {
    "preview": {
      "distribution": "internal",
      "ios": {
        "simulator": false,
        "buildConfiguration": "Debug"
      }
    }
  }
}
EOL

# Installation des dépendances
echo "Installation des dépendances..."
npm install

# Lancement du build preview
echo "Lancement du build preview avec QR code..."
npx eas build --platform ios --profile preview --non-interactive
