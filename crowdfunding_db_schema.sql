-- Drop table if exists
DROP TABLE IF EXISTS campaign;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS subcategory;
DROP TABLE IF EXISTS contacts;

-- Create new tables to import data
CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar(200)   NOT NULL,
    "description" varchar(200)   NOT NULL,
    "goal" float   NOT NULL,
    "pledged" float   NOT NULL,
    "outcome" varchar(200)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(200)   NOT NULL,
    "currency" varchar(200)   NOT NULL,
    "launch_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "category_id" varchar(200)   NOT NULL,
    "subcategory_id" varchar(200)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "category" (
    "category_id" varchar(200)   NOT NULL,
    "category" varchar(200)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_id" varchar(200)   NOT NULL,
    "subcategory" varchar(200)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar(200)   NOT NULL,
    "last_name" varchar(200)   NOT NULL,
    "email" varchar(200)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

-- Import data from campaign.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM campaign;

-- Import data from category.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM category;

-- Import data from subcategory.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM subcategory;

-- Import data from contacts.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM contacts;
