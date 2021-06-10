-- -------------------------------------------------------------
-- TablePlus 3.12.8(368)
--
-- https://tableplus.com/
--
-- Database: ecommerceapidirectus
-- Generation Time: 2021-06-10 23:24:56.7770
-- -------------------------------------------------------------


-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS books_id_seq;

-- Table Definition
CREATE TABLE "public"."books" (
    "id" int4 NOT NULL DEFAULT nextval('books_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "author" varchar(255) NOT NULL,
    "price" float4 NOT NULL,
    "quantity" int4 NOT NULL,
    "shops_id" int4 NOT NULL,
    "created_at" timestamptz NOT NULL,
    "updated_at" timestamptz NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS directus_activity_id_seq;

-- Table Definition
CREATE TABLE "public"."directus_activity" (
    "id" int4 NOT NULL DEFAULT nextval('directus_activity_id_seq'::regclass),
    "action" varchar(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ip" varchar(50) NOT NULL,
    "user_agent" varchar(255),
    "collection" varchar(64) NOT NULL,
    "item" varchar(255) NOT NULL,
    "comment" text,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."directus_collections" (
    "collection" varchar(64) NOT NULL,
    "icon" varchar(30),
    "note" text,
    "display_template" varchar(255),
    "hidden" bool NOT NULL DEFAULT false,
    "singleton" bool NOT NULL DEFAULT false,
    "translations" json,
    "archive_field" varchar(64),
    "archive_app_filter" bool NOT NULL DEFAULT true,
    "archive_value" varchar(255),
    "unarchive_value" varchar(255),
    "sort_field" varchar(64),
    "accountability" varchar(255) DEFAULT 'all'::character varying,
    "color" varchar(255),
    PRIMARY KEY ("collection")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS directus_fields_id_seq;

-- Table Definition
CREATE TABLE "public"."directus_fields" (
    "id" int4 NOT NULL DEFAULT nextval('directus_fields_id_seq'::regclass),
    "collection" varchar(64) NOT NULL,
    "field" varchar(64) NOT NULL,
    "special" varchar(64),
    "interface" varchar(64),
    "options" json,
    "display" varchar(64),
    "display_options" json,
    "readonly" bool NOT NULL DEFAULT false,
    "hidden" bool NOT NULL DEFAULT false,
    "sort" int4,
    "width" varchar(30) DEFAULT 'full'::character varying,
    "group" int4,
    "translations" json,
    "note" text,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."directus_files" (
    "id" uuid NOT NULL,
    "storage" varchar(255) NOT NULL,
    "filename_disk" varchar(255),
    "filename_download" varchar(255) NOT NULL,
    "title" varchar(255),
    "type" varchar(255),
    "folder" uuid,
    "uploaded_by" uuid,
    "uploaded_on" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modified_by" uuid,
    "modified_on" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "charset" varchar(50),
    "filesize" int4,
    "width" int4,
    "height" int4,
    "duration" int4,
    "embed" varchar(200),
    "description" text,
    "location" text,
    "tags" text,
    "metadata" json,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."directus_folders" (
    "id" uuid NOT NULL,
    "name" varchar(255) NOT NULL,
    "parent" uuid,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."directus_migrations" (
    "version" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "timestamp" timestamptz DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("version")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS directus_permissions_id_seq;

-- Table Definition
CREATE TABLE "public"."directus_permissions" (
    "id" int4 NOT NULL DEFAULT nextval('directus_permissions_id_seq'::regclass),
    "role" uuid,
    "collection" varchar(64) NOT NULL,
    "action" varchar(10) NOT NULL,
    "permissions" json,
    "validation" json,
    "presets" json,
    "fields" text,
    "limit" int4,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS directus_presets_id_seq;

-- Table Definition
CREATE TABLE "public"."directus_presets" (
    "id" int4 NOT NULL DEFAULT nextval('directus_presets_id_seq'::regclass),
    "bookmark" varchar(255),
    "user" uuid,
    "role" uuid,
    "collection" varchar(64),
    "search" varchar(100),
    "filters" json,
    "layout" varchar(100) DEFAULT 'tabular'::character varying,
    "layout_query" json,
    "layout_options" json,
    "refresh_interval" int4,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS directus_relations_id_seq;

-- Table Definition
CREATE TABLE "public"."directus_relations" (
    "id" int4 NOT NULL DEFAULT nextval('directus_relations_id_seq'::regclass),
    "many_collection" varchar(64) NOT NULL,
    "many_field" varchar(64) NOT NULL,
    "one_collection" varchar(64),
    "one_field" varchar(64),
    "one_collection_field" varchar(64),
    "one_allowed_collections" text,
    "junction_field" varchar(64),
    "sort_field" varchar(64),
    "one_deselect_action" varchar(255) NOT NULL DEFAULT 'nullify'::character varying,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS directus_revisions_id_seq;

-- Table Definition
CREATE TABLE "public"."directus_revisions" (
    "id" int4 NOT NULL DEFAULT nextval('directus_revisions_id_seq'::regclass),
    "activity" int4 NOT NULL,
    "collection" varchar(64) NOT NULL,
    "item" varchar(255) NOT NULL,
    "data" json,
    "delta" json,
    "parent" int4,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."directus_roles" (
    "id" uuid NOT NULL,
    "name" varchar(100) NOT NULL,
    "icon" varchar(30) NOT NULL DEFAULT 'supervised_user_circle'::character varying,
    "description" text,
    "ip_access" text,
    "enforce_tfa" bool NOT NULL DEFAULT false,
    "module_list" json,
    "collection_list" json,
    "admin_access" bool NOT NULL DEFAULT false,
    "app_access" bool NOT NULL DEFAULT true,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."directus_sessions" (
    "token" varchar(64) NOT NULL,
    "user" uuid NOT NULL,
    "expires" timestamptz NOT NULL,
    "ip" varchar(255),
    "user_agent" varchar(255),
    PRIMARY KEY ("token")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS directus_settings_id_seq;

-- Table Definition
CREATE TABLE "public"."directus_settings" (
    "id" int4 NOT NULL DEFAULT nextval('directus_settings_id_seq'::regclass),
    "project_name" varchar(100) NOT NULL DEFAULT 'Directus'::character varying,
    "project_url" varchar(255),
    "project_color" varchar(10) DEFAULT '#00C897'::character varying,
    "project_logo" uuid,
    "public_foreground" uuid,
    "public_background" uuid,
    "public_note" text,
    "auth_login_attempts" int4 DEFAULT 25,
    "auth_password_policy" varchar(100),
    "storage_asset_transform" varchar(7) DEFAULT 'all'::character varying,
    "storage_asset_presets" json,
    "custom_css" text,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."directus_users" (
    "id" uuid NOT NULL,
    "first_name" varchar(50),
    "last_name" varchar(50),
    "email" varchar(128) NOT NULL,
    "password" varchar(255),
    "location" varchar(255),
    "title" varchar(50),
    "description" text,
    "tags" json,
    "avatar" uuid,
    "language" varchar(8) DEFAULT 'en-US'::character varying,
    "theme" varchar(20) DEFAULT 'auto'::character varying,
    "tfa_secret" varchar(255),
    "status" varchar(16) NOT NULL DEFAULT 'active'::character varying,
    "role" uuid,
    "token" varchar(255),
    "last_access" timestamptz,
    "last_page" varchar(255),
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS directus_webhooks_id_seq;

-- Table Definition
CREATE TABLE "public"."directus_webhooks" (
    "id" int4 NOT NULL DEFAULT nextval('directus_webhooks_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "method" varchar(10) NOT NULL DEFAULT 'POST'::character varying,
    "url" text,
    "status" varchar(10) NOT NULL DEFAULT 'active'::character varying,
    "data" bool NOT NULL DEFAULT true,
    "actions" varchar(100) NOT NULL,
    "collections" text,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS orders_id_seq;

-- Table Definition
CREATE TABLE "public"."orders" (
    "id" int4 NOT NULL DEFAULT nextval('orders_id_seq'::regclass),
    "order_detail" varchar(255) NOT NULL,
    "users_id" int4 NOT NULL,
    "shops_id" int4 NOT NULL,
    "created_at" timestamptz NOT NULL,
    "updated_at" timestamptz NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS shops_id_seq;

-- Table Definition
CREATE TABLE "public"."shops" (
    "id" int4 NOT NULL DEFAULT nextval('shops_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "address" varchar(255) NOT NULL,
    "created_at" timestamptz NOT NULL,
    "updated_at" timestamptz NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "id" int4 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    "email" varchar(255) NOT NULL,
    "password" varchar(255) NOT NULL,
    "created_at" timestamptz NOT NULL,
    "updated_at" timestamptz NOT NULL,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."books" ("id", "name", "author", "price", "quantity", "shops_id", "created_at", "updated_at") VALUES
(1, 'book1', 'author1', 100.11, 200, 1, '2021-06-10 23:05:15.689+08', '2021-06-10 23:05:15.689+08'),
(2, 'book2', 'author2', 2222.11, 500, 2, '2021-06-10 23:12:19.614+08', '2021-06-10 23:12:19.614+08');

INSERT INTO "public"."directus_activity" ("id", "action", "user", "timestamp", "ip", "user_agent", "collection", "item", "comment") VALUES
(1, 'authenticate', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:14:09.773569+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_users', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', NULL),
(2, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:14:54.986231+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_settings', '1', NULL),
(3, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:17:33.575338+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_collections', 'users', NULL),
(4, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:17:33.575338+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '1', NULL),
(5, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:17:33.575338+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '2', NULL),
(6, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:17:33.575338+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '3', NULL),
(7, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:17:33.575338+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '4', NULL),
(8, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:17:33.575338+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '5', NULL),
(9, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:18:23.586442+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '6', NULL),
(10, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:18:26.439797+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '1', NULL),
(11, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:18:26.44393+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '6', NULL),
(12, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:18:26.447509+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '2', NULL),
(13, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:18:26.450611+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '3', NULL),
(14, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:18:26.455973+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '4', NULL),
(15, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:18:26.461214+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '5', NULL),
(16, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:18:39.12947+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '7', NULL),
(17, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:19:00.69836+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '1', NULL),
(18, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:19:00.701883+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '6', NULL),
(19, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:19:00.706104+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '2', NULL),
(20, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:19:00.711275+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '3', NULL),
(21, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:19:00.715645+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '7', NULL),
(22, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:19:00.719546+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '4', NULL),
(23, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:19:00.722858+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '5', NULL),
(24, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:19:03.510644+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '1', NULL),
(25, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:19:03.516297+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '6', NULL),
(26, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:19:03.52094+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '7', NULL),
(27, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:19:03.525422+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '2', NULL),
(28, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:19:03.529199+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '3', NULL),
(29, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:19:03.534279+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '4', NULL),
(30, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:19:03.539045+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '5', NULL),
(31, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:21:19.360025+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '8', NULL),
(32, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:21:37.927554+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '9', NULL),
(33, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:21:59.758998+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'users', '1', NULL),
(34, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:22:56.45188+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_permissions', '1', NULL),
(35, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:22:56.45415+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_permissions', '2', NULL),
(36, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:22:56.455391+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_permissions', '3', NULL),
(37, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:22:56.459528+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_permissions', '4', NULL),
(38, 'create', NULL, '2021-06-10 21:23:26.619981+08', '::1', 'PostmanRuntime/7.28.0', 'users', '2', NULL),
(39, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:25:09.326881+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_settings', '1', NULL),
(40, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:25:13.835916+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_settings', '1', NULL),
(41, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:25:45.149327+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_collections', 'shops', NULL),
(42, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:25:45.149327+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '10', NULL),
(43, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:26:04.280004+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '11', NULL),
(44, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:26:26.031973+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '12', NULL),
(45, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:26:54.760557+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '13', NULL),
(46, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:27:08.815478+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '14', NULL),
(47, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:27:37.273885+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_collections', 'orders', NULL),
(48, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:27:37.273885+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '15', NULL),
(49, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:27:48.593104+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '16', NULL),
(50, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:28:01.990738+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '17', NULL),
(51, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:28:13.842212+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '18', NULL),
(52, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:28:36.520628+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '19', NULL),
(53, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:28:50.164417+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '20', NULL),
(54, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:29:16.411224+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_collections', 'books', NULL),
(55, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:29:16.411224+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '21', NULL),
(56, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:29:25.672229+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '22', NULL),
(57, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:29:31.959657+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '23', NULL),
(58, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:29:41.1884+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '24', NULL),
(59, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:29:50.953198+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '25', NULL),
(60, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:30:02.813395+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '26', NULL),
(61, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:30:19.403623+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '27', NULL),
(62, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:30:33.759841+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '28', NULL),
(63, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:32:06.534001+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_permissions', '5', NULL),
(64, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:32:06.535497+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_permissions', '6', NULL),
(65, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:32:06.53691+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_permissions', '7', NULL),
(66, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:32:06.536604+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_permissions', '8', NULL),
(67, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:32:07.109163+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_permissions', '10', NULL),
(68, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:32:07.108841+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_permissions', '9', NULL),
(69, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:32:07.11114+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_permissions', '11', NULL),
(70, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:32:07.110639+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_permissions', '12', NULL),
(71, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:32:07.855931+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_permissions', '13', NULL),
(72, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:32:07.856232+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_permissions', '14', NULL),
(73, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:32:07.858463+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_permissions', '15', NULL),
(74, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 21:32:07.858751+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_permissions', '16', NULL),
(75, 'update', NULL, '2021-06-10 21:47:22.48685+08', '::1', 'PostmanRuntime/7.28.0', 'users', '2', NULL),
(76, 'delete', NULL, '2021-06-10 21:47:36.826033+08', '::1', 'PostmanRuntime/7.28.0', 'users', '2', NULL),
(77, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 22:09:14.791422+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '8', NULL),
(78, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 22:09:18.395566+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '9', NULL),
(79, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 22:10:25.838762+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '8', NULL),
(80, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 22:10:49.552891+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'users', '5', NULL),
(81, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 22:10:49.660359+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '8', NULL),
(82, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 22:10:54.72969+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '9', NULL),
(83, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 22:12:00.567028+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '8', NULL),
(84, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 22:12:03.21714+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '9', NULL),
(85, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 22:12:51.206483+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '8', NULL),
(86, 'update', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 22:12:54.822395+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'directus_fields', '9', NULL),
(87, 'create', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-10 22:15:19.448919+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36', 'users', '2', NULL),
(88, 'update', NULL, '2021-06-10 22:52:57.95704+08', '::1', 'PostmanRuntime/7.28.0', 'users', '2', NULL),
(89, 'delete', NULL, '2021-06-10 22:53:03.100877+08', '::1', 'PostmanRuntime/7.28.0', 'users', '1', NULL),
(90, 'update', NULL, '2021-06-10 22:53:04.989312+08', '::1', 'PostmanRuntime/7.28.0', 'users', '2', NULL),
(91, 'create', NULL, '2021-06-10 22:57:14.773695+08', '::1', 'PostmanRuntime/7.28.0', 'users', '1', NULL),
(92, 'update', NULL, '2021-06-10 22:57:24.058853+08', '::1', 'PostmanRuntime/7.28.0', 'users', '1', NULL),
(93, 'delete', NULL, '2021-06-10 22:57:27.393037+08', '::1', 'PostmanRuntime/7.28.0', 'users', '1', NULL),
(94, 'create', NULL, '2021-06-10 23:05:10.586566+08', '::1', 'PostmanRuntime/7.28.0', 'shops', '1', NULL),
(95, 'create', NULL, '2021-06-10 23:05:15.68903+08', '::1', 'PostmanRuntime/7.28.0', 'books', '1', NULL),
(96, 'create', NULL, '2021-06-10 23:05:59.119576+08', '::1', 'PostmanRuntime/7.28.0', 'orders', '1', NULL),
(97, 'create', NULL, '2021-06-10 23:06:03.278011+08', '::1', 'PostmanRuntime/7.28.0', 'orders', '2', NULL),
(98, 'create', NULL, '2021-06-10 23:06:07.849962+08', '::1', 'PostmanRuntime/7.28.0', 'orders', '3', NULL),
(99, 'create', NULL, '2021-06-10 23:06:10.268858+08', '::1', 'PostmanRuntime/7.28.0', 'orders', '4', NULL),
(100, 'create', NULL, '2021-06-10 23:12:19.613195+08', '::1', 'PostmanRuntime/7.28.0', 'books', '2', NULL),
(101, 'create', NULL, '2021-06-10 23:12:27.414172+08', '::1', 'PostmanRuntime/7.28.0', 'shops', '2', NULL);

INSERT INTO "public"."directus_collections" ("collection", "icon", "note", "display_template", "hidden", "singleton", "translations", "archive_field", "archive_app_filter", "archive_value", "unarchive_value", "sort_field", "accountability", "color") VALUES
('books', NULL, NULL, NULL, 'f', 'f', NULL, NULL, 't', NULL, NULL, NULL, 'all', NULL),
('orders', NULL, NULL, NULL, 'f', 'f', NULL, NULL, 't', NULL, NULL, NULL, 'all', NULL),
('shops', NULL, NULL, NULL, 'f', 'f', NULL, NULL, 't', NULL, NULL, NULL, 'all', NULL),
('users', NULL, NULL, NULL, 'f', 'f', NULL, NULL, 't', NULL, NULL, NULL, 'all', NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "group", "translations", "note") VALUES
(1, 'users', 'id', NULL, 'input', NULL, NULL, NULL, 't', 't', 1, 'full', NULL, NULL, NULL),
(6, 'users', 'email', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 2, 'full', NULL, NULL, NULL),
(7, 'users', 'password', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 3, 'full', NULL, NULL, NULL),
(8, 'users', 'created_at', 'date-created,date-updated', 'datetime', NULL, NULL, NULL, 'f', 'f', NULL, 'full', NULL, NULL, NULL),
(9, 'users', 'updated_at', 'date-created,date-updated', NULL, NULL, NULL, NULL, 'f', 'f', NULL, 'full', NULL, NULL, NULL),
(10, 'shops', 'id', NULL, 'input', NULL, NULL, NULL, 't', 't', NULL, 'full', NULL, NULL, NULL),
(11, 'shops', 'name', NULL, NULL, NULL, NULL, NULL, 'f', 'f', NULL, 'full', NULL, NULL, NULL),
(12, 'shops', 'address', NULL, NULL, NULL, NULL, NULL, 'f', 'f', NULL, 'full', NULL, NULL, NULL),
(13, 'shops', 'created_at', 'date-created,date-updated', NULL, NULL, NULL, NULL, 'f', 'f', NULL, 'full', NULL, NULL, NULL),
(14, 'shops', 'updated_at', 'date-created,date-updated', NULL, NULL, NULL, NULL, 'f', 'f', NULL, 'full', NULL, NULL, NULL),
(15, 'orders', 'id', NULL, 'input', NULL, NULL, NULL, 't', 't', NULL, 'full', NULL, NULL, NULL),
(16, 'orders', 'order_detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', NULL, 'full', NULL, NULL, NULL),
(17, 'orders', 'users_id', NULL, NULL, NULL, NULL, NULL, 'f', 'f', NULL, 'full', NULL, NULL, NULL),
(18, 'orders', 'shops_id', NULL, NULL, NULL, NULL, NULL, 'f', 'f', NULL, 'full', NULL, NULL, NULL),
(19, 'orders', 'created_at', 'date-created,date-updated', NULL, NULL, NULL, NULL, 'f', 'f', NULL, 'full', NULL, NULL, NULL),
(20, 'orders', 'updated_at', 'date-created,date-updated', NULL, NULL, NULL, NULL, 'f', 'f', NULL, 'full', NULL, NULL, NULL),
(21, 'books', 'id', NULL, 'input', NULL, NULL, NULL, 't', 't', NULL, 'full', NULL, NULL, NULL),
(22, 'books', 'name', NULL, NULL, NULL, NULL, NULL, 'f', 'f', NULL, 'full', NULL, NULL, NULL),
(23, 'books', 'author', NULL, NULL, NULL, NULL, NULL, 'f', 'f', NULL, 'full', NULL, NULL, NULL),
(24, 'books', 'price', NULL, NULL, NULL, NULL, NULL, 'f', 'f', NULL, 'full', NULL, NULL, NULL),
(25, 'books', 'quantity', NULL, NULL, NULL, NULL, NULL, 'f', 'f', NULL, 'full', NULL, NULL, NULL),
(26, 'books', 'shops_id', NULL, NULL, NULL, NULL, NULL, 'f', 'f', NULL, 'full', NULL, NULL, NULL),
(27, 'books', 'created_at', 'date-created,date-updated', NULL, NULL, NULL, NULL, 'f', 'f', NULL, 'full', NULL, NULL, NULL),
(28, 'books', 'updated_at', 'date-created,date-updated', NULL, NULL, NULL, NULL, 'f', 'f', NULL, 'full', NULL, NULL, NULL);

INSERT INTO "public"."directus_migrations" ("version", "name", "timestamp") VALUES
('20201028A', 'Remove Collection Foreign Keys', '2021-06-10 21:11:42.535258+08'),
('20201029A', 'Remove System Relations', '2021-06-10 21:11:42.541196+08'),
('20201029B', 'Remove System Collections', '2021-06-10 21:11:42.544974+08'),
('20201029C', 'Remove System Fields', '2021-06-10 21:11:42.551499+08'),
('20201105A', 'Add Cascade System Relations', '2021-06-10 21:11:42.593659+08'),
('20201105B', 'Change Webhook URL Type', '2021-06-10 21:11:42.596842+08'),
('20210225A', 'Add Relations Sort Field', '2021-06-10 21:11:42.599679+08'),
('20210304A', 'Remove Locked Fields', '2021-06-10 21:11:42.602083+08'),
('20210312A', 'Webhooks Collections Text', '2021-06-10 21:11:42.604776+08'),
('20210331A', 'Add Refresh Interval', '2021-06-10 21:11:42.606728+08'),
('20210415A', 'Make Filesize Nullable', '2021-06-10 21:11:42.611039+08'),
('20210416A', 'Add Collections Accountability', '2021-06-10 21:11:42.615915+08'),
('20210422A', 'Remove Files Interface', '2021-06-10 21:11:42.61872+08'),
('20210506A', 'Rename Interfaces', '2021-06-10 21:11:42.641708+08'),
('20210510A', 'Restructure Relations', '2021-06-10 21:11:42.65416+08'),
('20210518A', 'Add Foreign Key Constraints', '2021-06-10 21:11:42.669723+08'),
('20210519A', 'Add System Fk Triggers', '2021-06-10 21:11:42.690317+08'),
('20210521A', 'Add Collections Icon Color', '2021-06-10 21:11:42.692543+08');

INSERT INTO "public"."directus_permissions" ("id", "role", "collection", "action", "permissions", "validation", "presets", "fields", "limit") VALUES
(1, NULL, 'users', 'create', NULL, NULL, NULL, '*', NULL),
(2, NULL, 'users', 'update', NULL, NULL, NULL, '*', NULL),
(3, NULL, 'users', 'read', NULL, NULL, NULL, '*', NULL),
(4, NULL, 'users', 'delete', NULL, NULL, NULL, '*', NULL),
(5, NULL, 'books', 'create', NULL, NULL, NULL, '*', NULL),
(6, NULL, 'books', 'delete', NULL, NULL, NULL, '*', NULL),
(7, NULL, 'books', 'update', NULL, NULL, NULL, '*', NULL),
(8, NULL, 'books', 'read', NULL, NULL, NULL, '*', NULL),
(9, NULL, 'orders', 'read', NULL, NULL, NULL, '*', NULL),
(10, NULL, 'orders', 'delete', NULL, NULL, NULL, '*', NULL),
(11, NULL, 'orders', 'update', NULL, NULL, NULL, '*', NULL),
(12, NULL, 'orders', 'create', NULL, NULL, NULL, '*', NULL),
(13, NULL, 'shops', 'read', NULL, NULL, NULL, '*', NULL),
(14, NULL, 'shops', 'delete', NULL, NULL, NULL, '*', NULL),
(15, NULL, 'shops', 'create', NULL, NULL, NULL, '*', NULL),
(16, NULL, 'shops', 'update', NULL, NULL, NULL, '*', NULL);

INSERT INTO "public"."directus_presets" ("id", "bookmark", "user", "role", "collection", "search", "filters", "layout", "layout_query", "layout_options", "refresh_interval") VALUES
(1, NULL, 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', NULL, 'directus_users', NULL, NULL, 'cards', '{"cards":{"sort":"email","page":1}}', '{"cards":{"icon":"account_circle","title":"{{ first_name }} {{ last_name }}","subtitle":"{{ email }}","size":4}}', NULL),
(2, NULL, 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', NULL, 'directus_files', NULL, NULL, 'cards', '{"cards":{"sort":"-uploaded_on","page":1}}', '{"cards":{"icon":"insert_drive_file","title":"{{ title }}","subtitle":"{{ type }} • {{ filesize }}","size":4,"imageFit":"crop"}}', NULL);

INSERT INTO "public"."directus_revisions" ("id", "activity", "collection", "item", "data", "delta", "parent") VALUES
(1, 33, 'users', '1', '{"email":"test@test.com","password":"test","created_at":"2021-06-10T21:21:54+08:00","updated_at":"2021-06-10T21:21:58+08:00","id":1}', '{"email":"test@test.com","password":"test","created_at":"2021-06-10T21:21:54+08:00","updated_at":"2021-06-10T21:21:58+08:00","id":1}', NULL),
(2, 38, 'users', '2', '{"email":"test2@test2.com","password":"test","id":2}', '{"email":"test2@test2.com","password":"test","id":2}', NULL),
(3, 75, 'users', '2', '{"id":2,"email":"test3@test3.com","password":"test3","created_at":"2021-06-10T21:47:22+08:00","updated_at":"2021-06-10T21:47:22+08:00"}', '{"email":"test3@test3.com","password":"test3","created_at":"2021-06-10T13:47:22.487Z","updated_at":"2021-06-10T13:47:22.487Z"}', NULL),
(4, 80, 'users', '5', '{"id":5,"email":"test2@test.com","password":"$2a$10$g.vk.Rz5iiPSzX1TAtbZi.WwWh8mNwkUTV9Y0IWNzlx9HacCYDOcW","created_at":"2021-06-10T22:10:49+08:00","updated_at":"2021-06-10T22:10:49+08:00"}', '{"created_at":"2021-06-10T14:10:49.553Z","updated_at":"2021-06-10T14:10:49.553Z"}', NULL),
(5, 87, 'users', '2', '{"email":"test2@test2.com","password":"test2","created_at":"2021-06-10T22:15:14+08:00","updated_at":"2021-06-10T22:15:17+08:00","id":2}', '{"email":"test2@test2.com","password":"test2","created_at":"2021-06-10T22:15:14+08:00","updated_at":"2021-06-10T22:15:17+08:00","id":2}', NULL),
(6, 88, 'users', '2', '{"id":2,"email":"test123@test.com","password":"test123","created_at":"2021-06-10T22:52:57+08:00","updated_at":"2021-06-10T22:52:57+08:00"}', '{"email":"test123@test.com","password":"test123","created_at":"2021-06-10T14:52:57.957Z","updated_at":"2021-06-10T14:52:57.957Z"}', NULL),
(7, 90, 'users', '2', '{"id":2,"email":"test123@test.com","password":"test123","created_at":"2021-06-10T22:53:04+08:00","updated_at":"2021-06-10T22:53:04+08:00"}', '{"email":"test123@test.com","password":"test123","created_at":"2021-06-10T14:53:04.989Z","updated_at":"2021-06-10T14:53:04.989Z"}', NULL),
(8, 91, 'users', '1', '{"email":"test@test.com","password":"test","id":1}', '{"email":"test@test.com","password":"test","id":1}', NULL),
(9, 92, 'users', '1', '{"id":1,"email":"test123@test.com","password":"test123","created_at":"2021-06-10T22:57:24+08:00","updated_at":"2021-06-10T22:57:24+08:00"}', '{"email":"test123@test.com","password":"test123","created_at":"2021-06-10T14:57:24.059Z","updated_at":"2021-06-10T14:57:24.059Z"}', NULL),
(10, 94, 'shops', '1', '{"name":"shop","address":"hongkong","id":1}', '{"name":"shop","address":"hongkong","id":1}', NULL),
(11, 95, 'books', '1', '{"name":"book1","author":"author1","price":100.11,"quantity":200,"shops_id":1,"id":1}', '{"name":"book1","author":"author1","price":100.11,"quantity":200,"shops_id":1,"id":1}', NULL),
(12, 96, 'orders', '1', '{"order_detail":"test","users_id":3,"shops_id":3,"id":1}', '{"order_detail":"test","users_id":3,"shops_id":3,"id":1}', NULL),
(13, 97, 'orders', '2', '{"order_detail":"test","users_id":2,"shops_id":1,"id":2}', '{"order_detail":"test","users_id":2,"shops_id":1,"id":2}', NULL),
(14, 98, 'orders', '3', '{"order_detail":"test","users_id":1,"shops_id":3,"id":3}', '{"order_detail":"test","users_id":1,"shops_id":3,"id":3}', NULL),
(15, 99, 'orders', '4', '{"order_detail":"test","users_id":1,"shops_id":2,"id":4}', '{"order_detail":"test","users_id":1,"shops_id":2,"id":4}', NULL),
(16, 100, 'books', '2', '{"name":"book2","author":"author2","price":2222.11,"quantity":500,"shops_id":2,"id":2}', '{"name":"book2","author":"author2","price":2222.11,"quantity":500,"shops_id":2,"id":2}', NULL),
(17, 101, 'shops', '2', '{"name":"shop2","address":"kowloon","id":2}', '{"name":"shop2","address":"kowloon","id":2}', NULL);

INSERT INTO "public"."directus_roles" ("id", "name", "icon", "description", "ip_access", "enforce_tfa", "module_list", "collection_list", "admin_access", "app_access") VALUES
('5c745a88-d518-480d-9a6e-b74e5aa39ae2', 'Administrator', 'verified', 'Initial administrative role with unrestricted App/API access', NULL, 'f', NULL, NULL, 't', 't');

INSERT INTO "public"."directus_sessions" ("token", "user", "expires", "ip", "user_agent") VALUES
('jdRjxpax2oz-xR2e1pvKIwQP8gM0pzFgXXsboXEhf-BhKkJvaYEzwxWAzhn9b5aL', 'c6a9192d-82df-4ceb-8394-6b3e09d4fd37', '2021-06-17 23:12:51.426+08', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36');

INSERT INTO "public"."directus_settings" ("id", "project_name", "project_url", "project_color", "project_logo", "public_foreground", "public_background", "public_note", "auth_login_attempts", "auth_password_policy", "storage_asset_transform", "storage_asset_presets", "custom_css") VALUES
(1, 'ecommerce-api-directus', NULL, '#E35169', NULL, NULL, NULL, NULL, 25, NULL, 'all', NULL, NULL);

INSERT INTO "public"."directus_users" ("id", "first_name", "last_name", "email", "password", "location", "title", "description", "tags", "avatar", "language", "theme", "tfa_secret", "status", "role", "token", "last_access", "last_page") VALUES
('c6a9192d-82df-4ceb-8394-6b3e09d4fd37', 'Admin', 'User', 'admin@admin.com', '$argon2i$v=19$m=4096,t=3,p=1$f4aerTY9dSlGexq+N2fgZQ$GGSTHs09xK4dtnM9o4/58VdcJ4gWwYXVW2KhFChfzFk', NULL, NULL, NULL, NULL, NULL, 'en-US', 'auto', NULL, 'active', '5c745a88-d518-480d-9a6e-b74e5aa39ae2', NULL, '2021-06-10 23:12:51.387+08', '/collections/books');

INSERT INTO "public"."orders" ("id", "order_detail", "users_id", "shops_id", "created_at", "updated_at") VALUES
(1, 'test', 3, 3, '2021-06-10 23:05:59.12+08', '2021-06-10 23:05:59.12+08'),
(2, 'test', 2, 1, '2021-06-10 23:06:03.278+08', '2021-06-10 23:06:03.278+08'),
(3, 'test', 1, 3, '2021-06-10 23:06:07.851+08', '2021-06-10 23:06:07.851+08'),
(4, 'test', 1, 2, '2021-06-10 23:06:10.269+08', '2021-06-10 23:06:10.269+08');

INSERT INTO "public"."shops" ("id", "name", "address", "created_at", "updated_at") VALUES
(1, 'shop', 'hongkong', '2021-06-10 23:05:10.587+08', '2021-06-10 23:05:10.587+08'),
(2, 'shop2', 'kowloon', '2021-06-10 23:12:27.414+08', '2021-06-10 23:12:27.414+08');

INSERT INTO "public"."users" ("id", "email", "password", "created_at", "updated_at") VALUES
(1, 'test@test.com', '$2a$10$Z/yEnnY5o8c5T85l6HMXduPOdWDC6Wj3CDwYonOszdzQHA9.1J7OC', '2021-06-10 23:24:26.178+08', '2021-06-10 23:24:26.178+08'),
(2, 'test2@test.com', '$2a$10$MYVWjtSUJwDTbgkd5ow9vua/BPv7znD82eayCEQULAKNMmQabU6xC', '2021-06-10 23:24:28.819+08', '2021-06-10 23:24:28.819+08'),
(3, 'test3@test.com', '$2a$10$Y27MhnY5myO45SU28wHV2egoVcwjUYxapAuWg36Hk61EJH1rNcmCq', '2021-06-10 23:24:32.407+08', '2021-06-10 23:24:32.407+08');

ALTER TABLE "public"."directus_fields" ADD FOREIGN KEY ("group") REFERENCES "public"."directus_fields"("id");
ALTER TABLE "public"."directus_files" ADD FOREIGN KEY ("uploaded_by") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."directus_files" ADD FOREIGN KEY ("modified_by") REFERENCES "public"."directus_users"("id");
ALTER TABLE "public"."directus_files" ADD FOREIGN KEY ("folder") REFERENCES "public"."directus_folders"("id") ON DELETE SET NULL;
ALTER TABLE "public"."directus_folders" ADD FOREIGN KEY ("parent") REFERENCES "public"."directus_folders"("id");
ALTER TABLE "public"."directus_permissions" ADD FOREIGN KEY ("role") REFERENCES "public"."directus_roles"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_presets" ADD FOREIGN KEY ("user") REFERENCES "public"."directus_users"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_presets" ADD FOREIGN KEY ("role") REFERENCES "public"."directus_roles"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_revisions" ADD FOREIGN KEY ("activity") REFERENCES "public"."directus_activity"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_revisions" ADD FOREIGN KEY ("parent") REFERENCES "public"."directus_revisions"("id");
ALTER TABLE "public"."directus_sessions" ADD FOREIGN KEY ("user") REFERENCES "public"."directus_users"("id") ON DELETE CASCADE;
ALTER TABLE "public"."directus_settings" ADD FOREIGN KEY ("public_background") REFERENCES "public"."directus_files"("id");
ALTER TABLE "public"."directus_settings" ADD FOREIGN KEY ("project_logo") REFERENCES "public"."directus_files"("id");
ALTER TABLE "public"."directus_settings" ADD FOREIGN KEY ("public_foreground") REFERENCES "public"."directus_files"("id");
ALTER TABLE "public"."directus_users" ADD FOREIGN KEY ("role") REFERENCES "public"."directus_roles"("id") ON DELETE SET NULL;
