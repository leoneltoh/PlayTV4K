#!/bin/bash

# Configuration des variables d'environnement
export EXPO_TOKEN=y8MgUBG771013PAllzVGpq9_LmvzcubHVRSiNYQA
export EAS_NO_VCS=1

# Installation des dépendances
echo "Installation des dépendances..."
npm install

# Installation d'expo-dev-client
npm install expo-dev-client

# Lancement du build pour le simulateur
echo "Lancement du build pour le simulateur iOS..."
npx eas build --platform ios --profile development-simulator --non-interactive

echo "
Une fois le build terminé :
1. Le fichier .app sera disponible dans votre tableau de bord Expo
2. Vous pourrez le télécharger et le tester sur le simulateur iOS
3. Pour tester sur un vrai appareil ou publier sur l'App Store, vous aurez besoin d'un compte Apple Developer
"
