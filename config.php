<?php
declare(strict_types=1);

/** Load local environment variables without requiring an external package. */
function load_env_file(string $path): void {
 if (!is_readable($path)) return;
 foreach (file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES) as $line) {
  $line = trim($line);
  if ($line === '' || str_starts_with($line, '#') || !str_contains($line, '=')) continue;
  [$key, $value] = explode('=', $line, 2);
  $key = trim($key);
  $value = trim($value);
  if (($value[0] ?? '') === '"' && str_ends_with($value, '"')) $value = substr($value, 1, -1);
  if ($key !== '' && getenv($key) === false) putenv($key . '=' . $value);
 }
}
function env_value(string $key, ?string $default = null): ?string {
 $value = getenv($key);
 return $value === false || $value === '' ? $default : $value;
}
load_env_file(__DIR__ . '/.env');

function db_config(): array {
 return [
  'host' => env_value('DB_HOST', 'localhost'),
  'port' => env_value('DB_PORT', '3306'),
  'name' => env_value('DB_NAME'),
  'user' => env_value('DB_USER'),
  'password' => env_value('DB_PASSWORD', ''),
  'charset' => env_value('DB_CHARSET', 'utf8mb4'),
 ];
}
const UPLOAD_DIR = __DIR__ . '/uploads/';
const MAX_UPLOAD = 12 * 1024 * 1024;
const SITE_NAME = 'Young Images e.V.';
if (session_status() !== PHP_SESSION_ACTIVE) session_start();
