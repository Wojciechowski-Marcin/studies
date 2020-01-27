
--------------------------------------------------------------------------------------CREATY-----------------------------------------------------------------------------------------------------------------


CREATE TABLE "client_customuser" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "first_name" varchar(30) NOT NULL, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "pesel" varchar(11) NOT NULL UNIQUE, "mothers_maiden_name" varchar(32) NOT NULL, "birth_day" datetime NOT NULL, "telephone" varchar(9) NOT NULL UNIQUE); (params None)
CREATE TABLE "client_customuser" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "first_name" varchar(30) NOT NULL, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "pesel" varchar(11) NOT NULL UNIQUE, "mothers_maiden_name" varchar(32) NOT NULL, "birth_day" datetime NOT NULL, "telephone" varchar(9) NOT NULL UNIQUE); args=None
CREATE TABLE "client_account" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "account_number" varchar(26) NOT NULL UNIQUE, "balance" decimal NOT NULL, "transaction_limit" integer NOT NULL, "currency" varchar(3) NOT NULL, "is_active" bool NOT NULL, "creation_date" datetime NOT NULL, "account_type" varchar(15) NOT NULL, "user_id" integer NOT NULL REFERENCES "client_customuser" ("id") DEFERRABLE INITIALLY DEFERRED); (params None)
CREATE TABLE "client_account" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "account_number" varchar(26) NOT NULL UNIQUE, "balance" decimal NOT NULL, "transaction_limit" integer NOT NULL, "currency" varchar(3) NOT NULL, "is_active" bool NOT NULL, "creation_date" datetime NOT NULL, "account_type" varchar(15) NOT NULL, "user_id" integer NOT NULL REFERENCES "client_customuser" ("id") DEFERRABLE INITIALLY DEFERRED); args=None
CREATE TABLE "client_address" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "street" varchar(64) NOT NULL, "house_nr" integer NOT NULL, "apartment_nr" integer NULL); (params None)
CREATE TABLE "client_address" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "street" varchar(64) NOT NULL, "house_nr" integer NOT NULL, "apartment_nr" integer NULL); args=None
CREATE TABLE "client_card" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "card_number" varchar(16) NOT NULL, "cvv" varchar(3) NOT NULL, "is_nfc" bool NOT NULL, "is_active" bool NOT NULL, "transaction_limit" integer NOT NULL, "account_number_id" integer NOT NULL REFERENCES "client_account" ("id") DEFERRABLE INITIALLY DEFERRED); (params None)
CREATE TABLE "client_card" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "card_number" varchar(16) NOT NULL, "cvv" varchar(3) NOT NULL, "is_nfc" bool NOT NULL, "is_active" bool NOT NULL, "transaction_limit" integer NOT NULL, "account_number_id" integer NOT NULL REFERENCES "client_account" ("id") DEFERRABLE INITIALLY DEFERRED); args=None
CREATE TABLE "client_city" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "postal_code" varchar(6) NOT NULL, "city" varchar(32) NOT NULL); (params None)
CREATE TABLE "client_city" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "postal_code" varchar(6) NOT NULL, "city" varchar(32) NOT NULL); args=None
CREATE TABLE "client_creditaccount" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "interest" decimal NOT NULL, "credit_limit" varchar(7) NOT NULL, "account_number_id" integer NOT NULL REFERENCES "client_account" ("id") DEFERRABLE INITIALLY DEFERRED); (params None)
CREATE TABLE "client_creditaccount" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "interest" decimal NOT NULL, "credit_limit" varchar(7) NOT NULL, "account_number_id" integer NOT NULL REFERENCES "client_account" ("id") DEFERRABLE INITIALLY DEFERRED); args=None
CREATE TABLE "client_creditworthiness" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "earnings_per_month" integer NULL, "contract_type" varchar(35) NULL, "working_time" integer NULL); (params None)
CREATE TABLE "client_creditworthiness" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "earnings_per_month" integer NULL, "contract_type" varchar(35) NULL, "working_time" integer NULL); args=None
CREATE TABLE "client_request" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "request_title" varchar(40) NULL, "request_text" text NOT NULL, "credit_amount" decimal NOT NULL, "send_date" datetime NOT NULL, "is_verified" bool NOT NULL, "is_accepted" bool NULL, "request_type" varchar(20) NOT NULL, "client_data_id" integer NOT NULL REFERENCES "client_customuser" ("id") DEFERRABLE INITIALLY DEFERRED, "credit_account_number_id" integer NULL REFERENCES "client_account" ("id") DEFERRABLE INITIALLY DEFERRED, "worker_data_id" integer NULL REFERENCES "client_customuser" ("id") DEFERRABLE INITIALLY DEFERRED); (params None)
CREATE TABLE "client_request" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "request_title" varchar(40) NULL, "request_text" text NOT NULL, "credit_amount" decimal NOT NULL, "send_date" datetime NOT NULL, "is_verified" bool NOT NULL, "is_accepted" bool NULL, "request_type" varchar(20) NOT NULL, "client_data_id" integer NOT NULL REFERENCES "client_customuser" ("id") DEFERRABLE INITIALLY DEFERRED, "credit_account_number_id" integer NULL REFERENCES "client_account" ("id") DEFERRABLE INITIALLY DEFERRED, "worker_data_id" integer NULL REFERENCES "client_customuser" ("id") DEFERRABLE INITIALLY DEFERRED); args=None
CREATE TABLE "client_savingaccount" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "interest" decimal NOT NULL, "account_number_id" integer NOT NULL REFERENCES "client_account" ("id") DEFERRABLE INITIALLY DEFERRED); (params None)
CREATE TABLE "client_savingaccount" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "interest" decimal NOT NULL, "account_number_id" integer NOT NULL REFERENCES "client_account" ("id") DEFERRABLE INITIALLY DEFERRED); args=None
CREATE TABLE "client_transactionhistory" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "destination_bank_account_number" varchar(26) NOT NULL, "amount" decimal NOT NULL, "title" varchar(20) NOT NULL, "send_date" datetime NOT NULL, "source_bank_account_id" integer NOT NULL REFERENCES "client_account" ("id") DEFERRABLE INITIALLY DEFERRED); (params None)
CREATE TABLE "client_transactionhistory" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "destination_bank_account_number" varchar(26) NOT NULL, "amount" decimal NOT NULL, "title" varchar(20) NOT NULL, "send_date" datetime NOT NULL, "source_bank_account_id" integer NOT NULL REFERENCES "client_account" ("id") DEFERRABLE INITIALLY DEFERRED); args=None
ALTER TABLE "client_address" RENAME TO "client_address__old"; (params ())
ALTER TABLE "client_address" RENAME TO "client_address__old"; args=()
CREATE TABLE "client_address" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "street" varchar(64) NOT NULL, "house_nr" integer NOT NULL, "apartment_nr" integer NULL, "city_id" integer NOT NULL REFERENCES "client_city" ("id") DEFERRABLE INITIALLY DEFERRED); (params None)
CREATE TABLE "client_address" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "street" varchar(64) NOT NULL, "house_nr" integer NOT NULL, "apartment_nr" integer NULL, "city_id" integer NOT NULL REFERENCES "client_city" ("id") DEFERRABLE INITIALLY DEFERRED); args=None
INSERT INTO "client_address" ("id", "street", "house_nr", "apartment_nr", "city_id") SELECT "id", "street", "house_nr", "apartment_nr", NULL FROM "client_address__old"; (params ())
INSERT INTO "client_address" ("id", "street", "house_nr", "apartment_nr", "city_id") SELECT "id", "street", "house_nr", "apartment_nr", NULL FROM "client_address__old"; args=()


--------------------------------------------------------------------------------------INSERTY-----------------------------------------------------------------------------------------------------------------


INSERT INTO "client_city" ("postal_code", "city") VALUES ('50-370', 'Wrocław'); args=['50-370', 'Wrocław']
BEGIN; args=None
INSERT INTO "client_address" ("street", "house_nr", "apartment_nr", "city_id") VALUES ('wybrzeże Stanisława Wyspiańskiego', 27, NULL, 1); args=['wybrzeże Stanisława Wyspiańskiego', 27, None, 1]
BEGIN; args=None
INSERT INTO "client_customuser" ("password", "last_login", "is_superuser", "username", "first_name", "last_name", "email", "is_staff", "is_active", "date_joined", "address_id", "pesel", "mothers_maiden_name", "birth_day", "telephone", "creditworthiness_id") VALUES ('pbkdf2_sha256$120000$F9pZk72peFzI$eTyeoLAjiZuGdAqACirwEgI7q1AraHyah8BwVe25YyI=', NULL, 1, 'Wojciechowski-Marcin', 'Marcin', 'Wojciechowski', 'wojc.marcin@gmail.com', 1, 1, '2019-01-15 21:09:37.724685', 1, '1234567891', '', '2000-11-11 11:11:00', '123456789', NULL); args=['pbkdf2_sha256$120000$F9pZk72peFzI$eTyeoLAjiZuGdAqACirwEgI7q1AraHyah8BwVe25YyI=', None, True, 'Wojciechowski-Marcin', 'Marcin', 'Wojciechowski', 'wojc.marcin@gmail.com', True, True, '2019-01-15 21:09:37.724685', 1, '1234567891', '', '2000-11-11 11:11:00', '123456789', None]
BEGIN; args=None
INSERT INTO "client_account" ("account_number", "user_id", "balance", "transaction_limit", "currency", "is_active", "creation_date", "account_type") VALUES ('62982135895251146536533044', 1, '100.40', 10, 'PLN', 1, '2019-01-15 21:09:38.118413', 'Saving account'); args=['62982135895251146536533044', 1, '100.40', 10, 'PLN', True, '2019-01-15 21:09:38.118413', 'Saving account']
BEGIN; args=None
INSERT INTO "client_account" ("account_number", "user_id", "balance", "transaction_limit", "currency", "is_active", "creation_date", "account_type") VALUES ('13763108424934040620867506', 1, '0.40', 10, 'JPY', 1, '2019-01-15 21:09:38.268094', 'Normal account'); args=['13763108424934040620867506', 1, '0.40', 10, 'JPY', True, '2019-01-15 21:09:38.268094', 'Normal account']
BEGIN; args=None
INSERT INTO "client_card" ("account_number_id", "card_number", "cvv", "is_nfc", "is_active", "transaction_limit") VALUES (1, '6896215583856566', '652', 0, 1, 50); args=[1, '6896215583856566', '652', False, True, 50]





--------------------------------------------------------------------------------------INDEXY-----------------------------------------------------------------------------------------------------------------

CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model"); (params ())
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model"); args=()
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model"); (params ())
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model"); args=()

CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model"); (params ())
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model"); args=()

CREATE INDEX "client_account_user_id_9c0b6d77" ON "client_account" ("user_id"); (params ())
CREATE INDEX "client_account_user_id_9c0b6d77" ON "client_account" ("user_id"); args=()
CREATE INDEX "client_card_account_number_id_0e53588e" ON "client_card" ("account_number_id"); (params ())
CREATE INDEX "client_card_account_number_id_0e53588e" ON "client_card" ("account_number_id"); args=()
CREATE INDEX "client_creditaccount_account_number_id_bd5122d9" ON "client_creditaccount" ("account_number_id"); (params ())
CREATE INDEX "client_creditaccount_account_number_id_bd5122d9" ON "client_creditaccount" ("account_number_id"); args=()
CREATE INDEX "client_request_client_data_id_3eb9954a" ON "client_request" ("client_data_id"); (params ())
CREATE INDEX "client_request_client_data_id_3eb9954a" ON "client_request" ("client_data_id"); args=()
CREATE INDEX "client_request_credit_account_number_id_3f88953c" ON "client_request" ("credit_account_number_id"); (params ())
CREATE INDEX "client_request_credit_account_number_id_3f88953c" ON "client_request" ("credit_account_number_id"); args=()
CREATE INDEX "client_request_worker_data_id_e86eb7a3" ON "client_request" ("worker_data_id"); (params ())
CREATE INDEX "client_request_worker_data_id_e86eb7a3" ON "client_request" ("worker_data_id"); args=()
CREATE INDEX "client_savingaccount_account_number_id_1506bcfb" ON "client_savingaccount" ("account_number_id"); (params ())
CREATE INDEX "client_savingaccount_account_number_id_1506bcfb" ON "client_savingaccount" ("account_number_id"); args=()
CREATE INDEX "client_transactionhistory_source_bank_account_id_05e30074" ON "client_transactionhistory" ("source_bank_account_id"); (params ())
CREATE INDEX "client_transactionhistory_source_bank_account_id_05e30074" ON "client_transactionhistory" ("source_bank_account_id"); args=()
CREATE INDEX "client_address_city_id_61cd10c2" ON "client_address" ("city_id"); (params ())
CREATE INDEX "client_address_city_id_61cd10c2" ON "client_address" ("city_id"); args=()

CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id"); (params ())
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id"); args=()
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id"); (params ())
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id"); args=()



--------------------------------------------------------------------------------------SELECTY-----------------------------------------------------------------------------------------------------------------

SELECT "django_content_type"."id", "django_content_type"."app_label", "django_content_type"."model" FROM "django_content_type" WHERE ("django_content_type"."app_label" = 'client' AND "django_content_type"."model" = 'address'); args=('client', 'address')
SELECT "django_content_type"."id", "django_content_type"."app_label", "django_content_type"."model" FROM "django_content_type" WHERE ("django_content_type"."app_label" = 'client' AND "django_content_type"."model" = 'address'); args=('client', 'address')
BEGIN; args=None
INSERT INTO "django_content_type" ("app_label", "model") VALUES ('client', 'address'); args=['client', 'address']
SELECT "django_content_type"."id", "django_content_type"."app_label", "django_content_type"."model" FROM "django_content_type" WHERE ("django_content_type"."app_label" = 'client' AND "django_content_type"."model" = 'card'); args=('client', 'card')
SELECT "django_content_type"."id", "django_content_type"."app_label", "django_content_type"."model" FROM "django_content_type" WHERE ("django_content_type"."app_label" = 'client' AND "django_content_type"."model" = 'card'); args=('client', 'card')
BEGIN; args=None
INSERT INTO "django_content_type" ("app_label", "model") VALUES ('client', 'card'); args=['client', 'card']
SELECT "django_content_type"."id", "django_content_type"."app_label", "django_content_type"."model" FROM "django_content_type" WHERE ("django_content_type"."app_label" = 'client' AND "django_content_type"."model" = 'city'); args=('client', 'city')
SELECT "django_content_type"."id", "django_content_type"."app_label", "django_content_type"."model" FROM "django_content_type" WHERE ("django_content_type"."app_label" = 'client' AND "django_content_type"."model" = 'city'); args=('client', 'city')
BEGIN; args=None
INSERT INTO "django_content_type" ("app_label", "model") VALUES ('client', 'city'); args=['client', 'city']
SELECT "django_content_type"."id", "django_content_type"."app_label", "django_content_type"."model" FROM "django_content_type" WHERE ("django_content_type"."app_label" = 'client' AND "django_content_type"."model" = 'creditaccount'); args=('client', 'creditaccount')
SELECT "django_content_type"."id", "django_content_type"."app_label", "django_content_type"."model" FROM "django_content_type" WHERE ("django_content_type"."app_label" = 'client' AND "django_content_type"."model" = 'creditaccount'); args=('client', 'creditaccount')
BEGIN; args=None
INSERT INTO "django_content_type" ("app_label", "model") VALUES ('client', 'creditaccount'); args=['client', 'creditaccount']
SELECT "django_content_type"."id", "django_content_type"."app_label", "django_content_type"."model" FROM "django_content_type" WHERE ("django_content_type"."app_label" = 'client' AND "django_content_type"."model" = 'creditworthiness'); args=('client', 'creditworthiness')
SELECT "django_content_type"."id", "django_content_type"."app_label", "django_content_type"."model" FROM "django_content_type" WHERE ("django_content_type"."app_label" = 'client' AND "django_content_type"."model" = 'creditworthiness'); args=('client', 'creditworthiness')
BEGIN; args=None
INSERT INTO "django_content_type" ("app_label", "model") VALUES ('client', 'creditworthiness'); args=['client', 'creditworthiness']
SELECT "django_content_type"."id", "django_content_type"."app_label", "django_content_type"."model" FROM "django_content_type" WHERE ("django_content_type"."app_label" = 'client' AND "django_content_type"."model" = 'request'); args=('client', 'request')
SELECT "django_content_type"."id", "django_content_type"."app_label", "django_content_type"."model" FROM "django_content_type" WHERE ("django_content_type"."app_label" = 'client' AND "django_content_type"."model" = 'request'); args=('client', 'request')
BEGIN; args=None


--------------------------------------------------------------------------------------ŁADNIEJSZE_SELECTY-----------------------------------------------------------------------------------------------------------------

SELECT REFERRING.`id`, REFERRING.`city_id` FROM `client_address` as REFERRING
                LEFT JOIN `client_city` as REFERRED
                ON (REFERRING.`city_id` = REFERRED.`id`)
                WHERE REFERRING.`city_id` IS NOT NULL AND REFERRED.`id` IS NULL
                ; args=None
SELECT sql, type FROM sqlite_master WHERE tbl_name = 'client_customuser' AND type IN ('table', 'view'); args=['client_customuser']
SELECT sql FROM sqlite_master WHERE tbl_name = 'client_customuser' AND type = 'table'; args=['client_customuser', 'table']

                SELECT REFERRING.`id`, REFERRING.`address_id` FROM `client_customuser` as REFERRING
                LEFT JOIN `client_address` as REFERRED
                ON (REFERRING.`address_id` = REFERRED.`id`)
                WHERE REFERRING.`address_id` IS NOT NULL AND REFERRED.`id` IS NULL
                ; args=None

                SELECT REFERRING.`id`, REFERRING.`creditworthiness_id` FROM `client_customuser` as REFERRING
                LEFT JOIN `client_creditworthiness` as REFERRED
                ON (REFERRING.`creditworthiness_id` = REFERRED.`id`)
                WHERE REFERRING.`creditworthiness_id` IS NOT NULL AND REFERRED.`id` IS NULL
                ; args=None