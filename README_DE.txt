YOUNG IMAGES CMS V3 – DESIGN + REDAKTION
========================================

Diese Version verbindet das zuletzt abgestimmte Young-Images-Design mit einem kleinen eigenen CMS.

TECHNIK
- PHP 8.1+ (empfohlen: PHP 8.3/8.4)
- MySQL oder MariaDB (z. B. Netcup-Datenbank) mit PDO MySQL
- keine WordPress-Installation erforderlich

INSTALLATION
1. ZIP entpacken und den gesamten Inhalt auf den Webserver kopieren.
2. `.env.example` in `.env` kopieren und die Netcup-Datenbankwerte eintragen: Host, Datenbankname, Benutzername und Passwort.
3. Optional: `database/youngimages_schema.sql` über phpMyAdmin in die Netcup-Datenbank importieren. Die Tabellen können alternativ beim ersten Aufruf automatisch erstellt werden.
4. Im Browser /admin/setup.php aufrufen. Beispieldaten werden automatisch erstellt.
5. Admin-Benutzer und Passwort anlegen.
6. Danach setup.php vom Server löschen.
7. Login über /admin/login.php.

PFLEGE
- Seiten, Arbeitsfelder, Angebote, Projekte, Team, Förderer, Partner und Auszeichnungen können bearbeitet werden.
- Medien / Upload ist eine zentrale Upload-Stelle.
- Nach dem Upload wird der Bildpfad angezeigt. Diesen Pfad im entsprechenden Eintrag in das Feld „Bildpfad“ kopieren.
- Das Logo und das Hero-Bild können zusätzlich unter Einstellungen direkt ersetzt werden.

WICHTIG
- Die mitgelieferten Beispielbilder stammen aus dem vorhandenen Designmaterial bzw. sind lokale Varianten davon. Vor dem Livegang bitte die Bildrechte / Quellen prüfen.
- Die Beispieltexte und Beispiel-Auszeichnungen sind Platzhalter bzw. redaktionelle Starttexte und sollten vor Veröffentlichung geprüft werden.
- Impressum und Datenschutz bitte vor dem Livegang rechtlich/redaktionell final prüfen.
- `.env` enthält Zugangsdaten und wird nicht in Git gespeichert. Diese Datei niemals öffentlich bereitstellen oder committen.
