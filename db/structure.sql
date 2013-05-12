CREATE TABLE "address_types" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255));
CREATE TABLE "addresses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "street" text, "city" varchar(255), "state" varchar(2), "zip" integer, "entry_id" integer, "address_type_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text, "entry_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "entries" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(255), "last_name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "title" varchar(255), "avatar" varchar(255));
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "urls" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "type" varchar(255), "entry_id" integer, "address_type_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_addresses_on_entry_id" ON "addresses" ("entry_id");
CREATE INDEX "index_comments_on_entry_id" ON "comments" ("entry_id");
CREATE INDEX "index_urls_on_entry_id" ON "urls" ("entry_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20130219001741');

INSERT INTO schema_migrations (version) VALUES ('20130219030524');

INSERT INTO schema_migrations (version) VALUES ('20130226055251');

INSERT INTO schema_migrations (version) VALUES ('20130415054434');

INSERT INTO schema_migrations (version) VALUES ('20130418154700');

INSERT INTO schema_migrations (version) VALUES ('20130425154452');

INSERT INTO schema_migrations (version) VALUES ('20130508043525');