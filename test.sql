-- TABLE
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "user_id" integer);
CREATE TABLE "categories_contacts" ("contact_id" integer NOT NULL, "category_id" integer NOT NULL, "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL);
CREATE TABLE "categories_email_templates" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email_template_id" integer, "category_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "contacts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "surname" varchar, "name" varchar, "email" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "contacts_emails" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email_id" integer, "contact_id" integer, "sended" boolean, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "user_id" integer, "error" boolean);
CREATE TABLE "email_templates" (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`subject`	varchar,
	`text`	text,
	`sender`	varchar,
	`user_id`	integer,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
CREATE TABLE "emails" (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`subject`	varchar,
	`text`	varchar,
	`plain_text`	varchar,
	`sender`	varchar,
	`user_id`	integer,
	`created_at`	datetime NOT NULL,
	`updated_at`	datetime NOT NULL
);
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE "user_smtps" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar, "smtp" varchar, "port" integer, "protocol" varchar(10), "password" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "user_id" integer, "email" varchar);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar DEFAULT NULL, "firstname" varchar DEFAULT NULL, "surname" varchar DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "password_digest" varchar DEFAULT NULL, "user_smtp_id" integer);
 
-- INDEX
CREATE INDEX "index_categories_contacts_on_category_id_and_contact_id" ON "categories_contacts" ("category_id", "contact_id");
CREATE INDEX "index_categories_contacts_on_contact_id_and_category_id" ON "categories_contacts" ("contact_id", "category_id");
CREATE INDEX "index_categories_on_user_id" ON "categories" ("user_id");
CREATE INDEX "index_user_smtps_on_user_id" ON "user_smtps" ("user_id");
CREATE INDEX "index_users_on_user_smtp_id" ON "users" ("user_smtp_id");
CREATE UNIQUE INDEX "index_users_on_username" ON "users" ("username");
 
-- TRIGGER
 
-- VIEW
 
