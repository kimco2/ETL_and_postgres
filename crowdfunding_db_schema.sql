-- Creating tables
CREATE TABLE "contacts" (
    "contact_id" integer   NOT NULL,
    "first_name" varchar(20)   NOT NULL,
    "last_name" varchar(20)   NOT NULL,
    "email" varchar(50)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "category" (
    "category_id" varchar(4)   NOT NULL,
    "category" varchar(20)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_id" varchar(8)   NOT NULL,
    "subcategory" varchar(20)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "campaign" (
    "cf_id" integer   NOT NULL,
    "contact_id" integer   NOT NULL,
    "company_name" varchar(50)   NOT NULL,
    "description" varchar(60)   NOT NULL,
    "goal" float   NOT NULL,
    "pledged" float   NOT NULL,
    "outcome" varchar(10)   NOT NULL,
    "backers_count" integer   NOT NULL,
    "country" varchar(2)   NOT NULL,
    "currency" varchar(3)   NOT NULL,
    "launch_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar(4)   NOT NULL,
    "subcategory_id" varchar(8)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

-- Verifying tables were created
select * from contacts;
select * from category;
select * from subcategory;
select * from campaign;

-- Importing data into the tables from the relevant csv file
COPY contacts FROM 'C:\Users\kymco\Desktop\UWA_data_analytics\homework\Crowdfunding_ETL\Resources\contacts.csv'DELIMITER ',' CSV HEADER;
COPY category FROM 'C:\Users\kymco\Desktop\UWA_data_analytics\homework\Crowdfunding_ETL\Resources\category.csv'DELIMITER ',' CSV HEADER;
COPY subcategory FROM 'C:\Users\kymco\Desktop\UWA_data_analytics\homework\Crowdfunding_ETL\Resources\subcategory.csv'DELIMITER ',' CSV HEADER;
COPY campaign FROM 'C:\Users\kymco\Desktop\UWA_data_analytics\homework\Crowdfunding_ETL\Resources\campaign.csv'DELIMITER ',' CSV HEADER;

-- Checking the data imported
select * from contacts;
select * from category;
select * from subcategory;
select * from campaign;
