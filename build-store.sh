#!/bin/bash

# Configuration des variables d'environnement
export EXPO_TOKEN=y8MgUBG771013PAllzVGpq9_LmvzcubHVRSiNYQA
export EAS_NO_VCS=1

# Mise à jour de la configuration pour l'App Store
cat > app.json << 'EOL'
{
  "expo": {
    "name": "Play TV 4K",
    "slug": "playtv4k",
    "version": "1.0.0",
    "orientation": "portrait",
    "icon": "./assets/icon.png",
    "userInterfaceStyle": "light",
    "splash": {
      "image": "./assets/splash.png",
      "resizeMode": "contain",
      "backgroundColor": "#000000"
    },
    "assetBundlePatterns": [
      "**/*"
    ],
    "ios": {
      "supportsTablet": true,
      "bundleIdentifier": "com.playtv4k.app",
      "buildNumber": "1",
      "infoPlist": {
        "UIBackgroundModes": ["audio"],
        "ITSAppUsesNonExemptEncryption": false,
        "CFBundleDisplayName": "Play TV 4K",
        "LSApplicationQueriesSchemes": ["https"],
        "NSAppTransportSecurity": {
          "NSAllowsArbitraryLoads": true
        }
      }
    },
    "android": {
      "adaptiveIcon": {
        "foregroundImage": "./assets/adaptive-icon.png",
        "backgroundColor": "#000000"
      },
      "package": "com.playtv4k.app"
    },
    "web": {
      "favicon": "./assets/favicon.png"
    },
    "extra": {
      "eas": {
        "projectId": "895f6f25-9c59-478f-9c74-bdbb556ea615"
      }
    },
    "owner": "osiasdossou"
  }
}
EOL

# Configuration du build EAS pour la production
cat > eas.json << 'EOL'
{
  "cli": {
    "version": ">= 5.9.1"
  },
  "build": {
    "production": {
      "distribution": "store",
      "ios": {
        "resourceClass": "m-medium",
        "image": "latest"
      }
    }
  },
  "submit": {
    "production": {
      "ios": {
        "appleId": "graceafrica2@gmail.com",
        "ascAppId": "com.playtv4k.app",
        "appleTeamId": "YOUR_TEAM_ID"
      }
    }
  }
}
EOL

# Installation des dépendances
echo "Installation des dépendances..."
npm install

# Lancement du build de production
echo "Lancement du build pour l'App Store..."
npx eas build --platform ios --profile production --non-interactive

echo "
Une fois le build terminé :
1. Le fichier IPA sera disponible dans votre tableau de bord Expo
2. Téléchargez le fichier IPA
3. Connectez-vous à votre compte Apple Developer
4. Utilisez App Store Connect pour soumettre l'application
"
