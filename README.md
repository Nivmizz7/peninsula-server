# Peninsula Server (v0)

## Structure

- api: API REST Peninsula (Node.js + PostgreSQL)
- panel: Panel web minimaliste (HTML/JS)
- scripts: install.sh / update.sh
- config: systemd + nginx

## Démarrage rapide (dev)

1. Configurer la base PostgreSQL et le fichier `.env` dans `api`.
2. Installer les dépendances : `npm install`.
3. Lancer l'API : `npm run dev`.
4. Servir le panel avec un serveur statique ou NGINX.

## Installation serveur (Ubuntu)

Exécuter :

- `sudo bash scripts/install.sh`

Admin par défaut :

- utilisateur: `admin`
- mot de passe: `admin123`

## HTTPS

Le script d'installation génère un certificat auto-signé pour V0 (dans `/etc/ssl/peninsula`).
Pour la production, remplacer par un certificat valide (Let's Encrypt).

## Endpoints principaux

- POST /v1/auth/login
- POST /v1/auth/refresh
- GET /v1/admin/users/list
- POST /v1/admin/users/create
- POST /v1/admin/users/update
- POST /v1/admin/users/delete

## License

This project is released under the Nivmizz7 personal license based on GPLv3 — Copyright (c) 2026 Niv Nivmizz7.
Any reuse is allowed, provided the author is credited and the license text is kept.

See [LICENSE](LICENSE).
