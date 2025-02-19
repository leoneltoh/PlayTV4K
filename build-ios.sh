#!/bin/bash

# Configuration des variables d'environnement
export EXPO_TOKEN=y8MgUBG771013PAllzVGpq9_LmvzcubHVRSiNYQA
export EAS_NO_VCS=1

# Installation des dépendances nécessaires
npm install

# Configuration du build EAS
cat > eas.json << 'EOL'
{
  "cli": {
    "version": ">= 5.9.1"
  },
  "build": {
    "development": {
      "developmentClient": true,
      "distribution": "internal",
      "ios": {
        "resourceClass": "m-medium"
      }
    },
    "preview": {
      "distribution": "internal",
      "ios": {
        "resourceClass": "m-medium"
      }
    },
    "production": {
      "distribution": "store",
      "ios": {
        "resourceClass": "m-medium"
      }
    }
  }
}
EOL

# Lancement du build
echo "Lancement du build iOS..."
npx eas build --platform ios --profile preview --non-interactive

echo "
Une fois le build terminé :
1. Le fichier IPA sera disponible dans votre tableau de bord Expo
2. Vous pourrez le télécharger et le tester sur un appareil iOS
3. Pour le publier sur l'App Store, vous aurez besoin d'un compte Apple Developer
"
