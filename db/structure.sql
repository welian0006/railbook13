CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "books" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "isbn" varchar(255), "title" varchar(255), "price" integer, "publish" varchar(255), "published" date, "cd" boolean, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "authors_books" ("author_id" integer, "book_id" integer);
CREATE INDEX "index_authors_books_on_author_id" ON "authors_books" ("author_id");
CREATE INDEX "index_authors_books_on_book_id" ON "authors_books" ("book_id");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar(255), "password" varchar(255), "email" varchar(255), "dm" boolean, "roles" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "authors" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "name" varchar(255), "birth" date, "address" text, "ctype" varchar(255), "photo" blob, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_authors_on_user_id" ON "authors" ("user_id");
CREATE TABLE "reviews" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "book_id" integer, "user_id" integer, "body" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_reviews_on_book_id" ON "reviews" ("book_id");
CREATE INDEX "index_reviews_on_user_id" ON "reviews" ("user_id");
CREATE TABLE "fun_comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "author_no" integer, "name" varchar(255), "body" text, "deleted" boolean, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "sessions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "session_id" varchar(255) NOT NULL, "data" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_sessions_on_session_id" ON "sessions" ("session_id");
CREATE INDEX "index_sessions_on_updated_at" ON "sessions" ("updated_at");
CREATE TABLE "configs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "fruits" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "color" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "sports" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "clonets" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO schema_migrations (version) VALUES ('20161104121849');

INSERT INTO schema_migrations (version) VALUES ('20161104122325');

INSERT INTO schema_migrations (version) VALUES ('20161104122351');

INSERT INTO schema_migrations (version) VALUES ('20161104122531');

INSERT INTO schema_migrations (version) VALUES ('20161104122659');

INSERT INTO schema_migrations (version) VALUES ('20161104122752');

INSERT INTO schema_migrations (version) VALUES ('20161105220023');

INSERT INTO schema_migrations (version) VALUES ('20161108180428');

INSERT INTO schema_migrations (version) VALUES ('20161110165745');

INSERT INTO schema_migrations (version) VALUES ('20161110170508');

INSERT INTO schema_migrations (version) VALUES ('20161110171440');