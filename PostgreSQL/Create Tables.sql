-- Adminer 4.7.6 PostgreSQL dump

CREATE SEQUENCE customers_custmerid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."customers" (
    "customerid" integer DEFAULT nextval('customers_custmerid_seq') NOT NULL,
    "first_name" character varying(50) NOT NULL,
    "last_name" character varying(50) NOT NULL,
    "gender" character varying NOT NULL,
    "address" character varying(200) NOT NULL,
    "phone" integer NOT NULL,
    "email" character varying(100) NOT NULL,
    "city" character varying(20) NOT NULL,
    "country" character varying(50) NOT NULL,
    CONSTRAINT "customers_pkey" PRIMARY KEY ("customerid")
) WITH (oids = false);

INSERT INTO "customers" ("customerid", "first_name", "last_name", "gender", "address", "phone", "email", "city", "country") VALUES
(3,	'Leon',	'Glen',	'Male',	'81 Everton Rd, Gillits',	820832830,	'Leon@gmail.com',	'Durban',	'South Africa'),
(4,	'Charl',	'Muller',	'Male',	'290A Dorset Ecke',	856872553,	'Charl.muller@yahoo.com',	'Berlin',	'Germany'),
(5,	'Julia',	'Stein',	'Female',	'2 Wernerring',	672445058,	'Js234@yahoo.com',	'Frankfurt',	'Germany'),
(1,	'Lerato',	'Mabitso',	'Male',	'284 chaucer st',	84789657,	'john@gmail.com',	'Johannesburg',	'SouthAfrica');

CREATE SEQUENCE employees_employeeid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."employees" (
    "employeeid" integer DEFAULT nextval('employees_employeeid_seq') NOT NULL,
    "firstname" character varying(50) NOT NULL,
    "lastname" character varying(50) NOT NULL,
    "email" character varying(100) NOT NULL,
    "jobtitle" character varying(20) NOT NULL,
    CONSTRAINT "employees_pkey" PRIMARY KEY ("employeeid")
) WITH (oids = false);

INSERT INTO "employees" ("employeeid", "firstname", "lastname", "email", "jobtitle") VALUES
(1,	'Kani',	'Matthew',	'mat@gmail.com',	'Manager'),
(2,	'Lesly',	'Cronje',	'LesC@gmail.com',	'Clerk'),
(3,	'Gideon',	'Maduku',	'm@gmail.com',	'Accountant');

CREATE SEQUENCE orders_orderid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."orders" (
    "orderid" integer DEFAULT nextval('orders_orderid_seq') NOT NULL,
    "productid" integer NOT NULL,
    "paymentid" integer NOT NULL,
    "fulfilledbyemployeeid" integer NOT NULL,
    "daterequired" date NOT NULL,
    "dateshipped" date,
    "status" character varying(20) NOT NULL,
    CONSTRAINT "orders_pkey" PRIMARY KEY ("orderid"),
    CONSTRAINT "orders_fulfilledbyemployeeid_fkey" FOREIGN KEY (fulfilledbyemployeeid) REFERENCES employees(employeeid) NOT DEFERRABLE,
    CONSTRAINT "orders_paymentid_fkey" FOREIGN KEY (paymentid) REFERENCES payments(paymentid) NOT DEFERRABLE,
    CONSTRAINT "orders_productid_fkey" FOREIGN KEY (productid) REFERENCES products(productid) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "orders" ("orderid", "productid", "paymentid", "fulfilledbyemployeeid", "daterequired", "dateshipped", "status") VALUES
(1,	1,	1,	2,	'2018-05-09',	NULL,	'Not shipped'),
(2,	1,	2,	2,	'2018-04-09',	'2018-03-09',	'Shipped'),
(3,	3,	3,	3,	'2018-06-09',	NULL,	'Not shipped');

CREATE SEQUENCE payments_paymentid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."payments" (
    "paymentid" integer DEFAULT nextval('payments_paymentid_seq') NOT NULL,
    "customerid" integer,
    "paymentdate" date NOT NULL,
    "amount" numeric(7,2) NOT NULL,
    CONSTRAINT "payments_pkey" PRIMARY KEY ("paymentid"),
    CONSTRAINT "payments_customerid_fkey" FOREIGN KEY (customerid) REFERENCES customers(customerid) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "payments" ("paymentid", "customerid", "paymentdate", "amount") VALUES
(1,	1,	'2018-01-09',	150.75),
(2,	5,	'2018-03-09',	150.75),
(3,	4,	'2018-03-09',	700.60);

CREATE SEQUENCE products_productid_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."products" (
    "productid" integer DEFAULT nextval('products_productid_seq') NOT NULL,
    "productname" character varying(100) NOT NULL,
    "description" character varying(300) NOT NULL,
    "buyprice" numeric(7,2) NOT NULL,
    CONSTRAINT "products_pkey" PRIMARY KEY ("productid")
) WITH (oids = false);

INSERT INTO "products" ("productid", "productname", "description", "buyprice") VALUES
(1,	'Harley Davidson Chopper',	'This replica features working kickstand, front suspension, gear-shift lever',	150.75),
(2,	'Classic Car',	'Turnable front wheels, steering function',	550.75),
(3,	'Sports car',	'Turnable front wheels, steering function',	700.60);

-- 2020-04-22 17:28:34.136435+00
