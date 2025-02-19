#!/bin/bash

# Configuration des variables d'environnement
export EXPO_TOKEN=y8MgUBG771013PAllzVGpq9_LmvzcubHVRSiNYQA
export EAS_NO_VCS=1

# Mise à jour de la configuration EAS
cat > eas.json << 'EOL'
{
  "cli": {
    "version": ">= 5.9.1",
    "requireCommit": false
  },
  "build": {
    "internal": {
      "distribution": "internal",
      "ios": {
        "resourceClass": "m-medium",
        "buildConfiguration": "Release"
      }
    }
  }
}
EOL

# Installation des dépendances
echo "Installation des dépendances..."
npm install --quiet

# Lancement du build interne
echo "Lancement du build pour installation directe..."
npx eas build --platform ios --profile internal --non-interactive
