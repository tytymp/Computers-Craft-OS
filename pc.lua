-- Mini OS avec mot de passe pour quitter le programme et accéder au shell

-- Mot de passe pour entrer dans le shell de base
local correctPassword = "80426"

-- Fonction pour demander le mot de passe
function askPassword()
    print("Veuillez entrer le mot de passe pour accéder au shell:")
    local password = read()  -- Demande du mot de passe
    if password == correctPassword then
        print("Mot de passe correct ! Accès au shell.")
        return true
    else
        print("Mot de passe incorrect. Retour au menu.")
        return false
    end
end

-- Fonction pour afficher le menu principal
function showMenu()
    print("Bienvenue dans le Mini OS !")
    print("1. Créer un répertoire")
    print("2. Lister les fichiers")
    print("3. Changer de répertoire")
    print("4. Créer un fichier")
    print("5. Lire un fichier")
    print("6. Quitter")
    write("Sélectionnez une option (1-6): ")
end

-- Fonction pour créer un répertoire
function mkdir()
    print("Nom du répertoire: ")
    local dirName = read()
    if not fs.exists(dirName) then
        fs.makeDir(dirName)
        print("Répertoire '" .. dirName .. "' créé.")
    else
        print("Le répertoire '" .. dirName .. "' existe déjà.")
    end
end

-- Fonction pour lister les fichiers
function ls()
    local files = fs.list("/")
    if #files == 0 then
        print("Aucun fichier trouvé.")
    else
        for _, file in ipairs(files) do
            print(file)
        end
    end
end

-- Fonction pour changer de répertoire
function cd()
    print("Nom du répertoire: ")
    local dirName = read()
    if fs.exists(dirName) then
        shell.setDir(dirName)
        print("Répertoire courant changé pour '" .. dirName .. "'.")
    else
        print("Le répertoire '" .. dirName .. "' n'existe pas.")
    end
end

-- Fonction pour créer un fichier
function createFile()
    print("Nom du fichier: ")
    local fileName = read()
    print("Contenu du fichier: ")
    local content = read()
    local file = fs.open(fileName, "w")
    file.write(content)
    file.close()
    print("Fichier '" .. fileName .. "' créé avec succès.")
end

-- Fonction pour lire un fichier
function readFile()
    print("Nom du fichier: ")
    local fileName = read()
    if fs.exists(fileName) then
        local file = fs.open(fileName, "r")
        print(file.readAll())
        file.close()
    else
        print("Le fichier '" .. fileName .. "' n'existe pas.")
    end
end

-- Fonction pour quitter et entrer dans le shell
function quit()
    print("Vous souhaitez quitter le programme et accéder au shell. Entrez le mot de passe pour continuer.")
    if askPassword() then
        print("Accès au shell.")
        shell.run("shell")  -- Lancer le shell de base de ComputerCraft
    else
        print("Retour au menu principal.")
    end
end

-- Boucle principale pour gérer les choix
while true do
    showMenu()
    local choice = tonumber(read())  -- Lire la réponse de l'utilisateur et la convertir en nombre
    if choice == 1 then
        mkdir()
    elseif choice == 2 then
        ls()
    elseif choice == 3 then
        cd()
    elseif choice == 4 then
        createFile()
    elseif choice == 5 then
        readFile()
    elseif choice == 6 then
        quit()
        break  -- Sortir de la boucle si le programme est fermé après le mot de passe
    else
        print("Option invalide, veuillez sélectionner une option entre 1 et 6.")
    end
    print()  -- Ajouter un espace pour la lisibilité
end
