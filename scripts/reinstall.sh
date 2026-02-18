#!/usr/bin/env bash
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Veuillez exécuter en root (sudo)."
  exit 1
fi

echo "=========================================="
echo "DÉSINSTALLATION DE NGINX ET POSTGRESQL"
echo "=========================================="
echo ""

echo "[1/4] Arrêt des services..."
systemctl stop nginx || true
systemctl stop postgresql || true

echo "[2/4] Désinstallation de Nginx..."
apt-get remove -y nginx nginx-common || true
apt-get purge -y nginx nginx-common || true

echo "[3/4] Désinstallation de PostgreSQL..."
apt-get remove -y postgresql postgresql-contrib || true
apt-get purge -y postgresql postgresql-contrib postgresql-client || true
rm -rf /var/lib/postgresql || true

echo "[4/4] Nettoyage des fichiers de configuration..."
rm -rf /etc/nginx || true
rm -rf /etc/postgresql || true
apt-get autoremove -y || true

echo ""
echo "=========================================="
echo "DÉSINSTALLATION TERMINÉE"
echo "=========================================="
echo "Nginx et PostgreSQL ont été complètement supprimés."
echo "Les fichiers de Peninsula ont été conservés."
