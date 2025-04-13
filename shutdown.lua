-- Efface l'écran et place le curseur en haut à gauche
term.clear()
term.setCursorPos(1, 1)

-- Liste des étapes de shutdown
local steps = {
    "Arrêt des services réseau...",
    "Fermeture des applications ouvertes...",
    "Sauvegarde des données utilisateur...",
    "Fermeture des modules système...",
    "Démontage du disque de démarrage...",
    "Arrêt des services de sécurité...",
    "Fermeture des processus en cours...",
    "Vérification des journaux système...",
    "Arrêt du gestionnaire de processus...",
    "Vérification des fichiers système...",
    "Démontage des systèmes de fichiers...",
    "Vérification de la mémoire RAM...",
    "Fermeture du gestionnaire de tâches...",
    "Arrêt des services de base de données...",
    "Démontage des services de mise à jour...",
    "Fermeture du service SSH...",
    "Arrêt des serveurs de jeux...",
    "Fermeture de l'interface graphique...",
    "Vérification des périphériques externes...",
    "Fermeture des applications de fond...",
    "Démontage des modules de performance...",
    "Arrêt du service de gestion des logs...",
    "Fermeture du shell principal...",
    "Arrêt du système de notifications...",
    "Fermeture du gestionnaire de fichiers...",
    "Démontage du réseau local...",
    "Arrêt de l'interface de commande..."
    -- Tu peux ajouter d'autres étapes si nécessaire.
}

-- Fonction pour simuler une étape de shutdown réussie
local function stepShutdown(step)
  print(step .. " [ OK ]")
  sleep(0.1 + math.random() * 0.4) -- Simule un délai aléatoire entre 0.1 et 0.5 secondes
end

-- Simule les étapes de shutdown
for _, step in ipairs(steps) do
  stepShutdown(step)
end

-- Message final après le shutdown
print("\nLe système a été arrêté avec succès.")

-- Ajout de la commande pour arrêter le système
os.shutdown()
