#!/bin/bash

# Configuration des variables d'environnement
export EXPO_TOKEN=y8MgUBG771013PAllzVGpq9_LmvzcubHVRSiNYQA
export EAS_NO_VCS=1

# Mise à jour de la configuration
cat > eas.json << 'EOL'
{
  "cli": {
    "version": ">= 5.9.1",
    "requireCommit": false
  },
  "build": {
    "development-simulator": {
      "developmentClient": true,
      "distribution": "internal",
      "ios": {
        "simulator": true
      }
    },
    "development": {
      "distribution": "internal",
      "android": {
        "gradleCommand": ":app:assembleDebug"
      },
      "ios": {
        "buildConfiguration": "Debug"
      }
    }
  }
}
EOL

# Installation des dépendances nécessaires
echo "Installation des dépendances..."
npm install --quiet

# Lancement du build avec QR code
echo "Lancement du build avec QR code..."
npx eas build --platform ios --profile development --local
