<?php
declare(strict_types=1);
const DB_PATH = __DIR__ . '/data/youngimages.sqlite';
const UPLOAD_DIR = __DIR__ . '/uploads/';
const MAX_UPLOAD = 12 * 1024 * 1024;
const SITE_NAME = 'Young Images e.V.';
if (session_status() !== PHP_SESSION_ACTIVE) session_start();
