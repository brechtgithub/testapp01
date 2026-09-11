# Requires a locally running MariaDB service. Run from the project root in VS Code.
$ErrorActionPreference = 'Stop'

$mariadb = 'C:\Program Files\MariaDB 12.3\bin\mariadb.exe'
if (-not (Test-Path $mariadb)) { throw 'MariaDB wurde nicht gefunden. Bitte den Installationspfad in diesem Skript anpassen.' }

$rootPassword = [System.Net.NetworkCredential]::new('', (Read-Host 'Lokales MariaDB-Root-Passwort' -AsSecureString)).Password
$appPassword = -join ((1..32 | ForEach-Object { '{0:x}' -f (Get-Random -Maximum 16) }))
$env:MYSQL_PWD = $rootPassword

$adminSql = @"
CREATE DATABASE IF NOT EXISTS youngimages CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'youngimages'@'localhost' IDENTIFIED BY '$appPassword';
ALTER USER 'youngimages'@'localhost' IDENTIFIED BY '$appPassword';
GRANT ALL PRIVILEGES ON youngimages.* TO 'youngimages'@'localhost';
FLUSH PRIVILEGES;
"@
$adminSql | & $mariadb -u root -h 127.0.0.1

$env:MYSQL_PWD = $appPassword
Get-Content -Raw 'database\youngimages_schema.sql' | & $mariadb -u youngimages -h 127.0.0.1 youngimages
& $mariadb -u youngimages -h 127.0.0.1 youngimages -e 'SELECT 1 AS verbindungstest;'

@"
DB_HOST=127.0.0.1
DB_PORT=3306
DB_NAME=youngimages
DB_USER=youngimages
DB_PASSWORD=$appPassword
DB_CHARSET=utf8mb4
"@ | Set-Content -NoNewline -Encoding utf8 '.env.local'

Remove-Item Env:MYSQL_PWD -ErrorAction SilentlyContinue
$rootPassword = $null
Write-Host 'Lokale Datenbank eingerichtet. .env.local wurde erstellt und die SQL-Tabellen wurden importiert.' -ForegroundColor Green
