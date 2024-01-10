CREATE TABLE "Recruitment" (
  "recruitment_id" integer PRIMARY KEY,
  "position_id" integer NOT NULL,
  "status" varchar NOT NULL,
  "interview_date" timestamp,
  "created_at" timestamp,
  "updated_at" timestamp,
  "current_flag" boolean NOT NULL
);

CREATE TABLE "Candidate" (
  "candidate_id" integer PRIMARY KEY,
  "recruitment_id" integer NOT NULL,
  "firstname" varchar NOT NULL,
  "lastname" varchar NOT NULL,
  "email" varchar NOT NULL,
  "phone" varchar NOT NULL,
  "resume_url" varchar NOT NULL,
  "created_at" timestamp,
  "updated_at" timestamp,
  "current_flag" boolean NOT NULL
);

CREATE TABLE "Application" (
  "application_id" integer PRIMARY KEY,
  "candidate_id" integer NOT NULL,
  "job_id" integer NOT NULL,
  "application_date" timestamp NOT NULL,
  "status" varchar NOT NULL,
  "created_at" timestamp,
  "updated_at" timestamp,
  "current_flag" boolean NOT NULL
);

CREATE TABLE "Job" (
  "job_id" integer PRIMARY KEY,
  "title" varchar,
  "description" text,
  "requirement" text,
  "created_at" timestamp,
  "updated_at" timestamp,
  "current_flag" boolean NOT NULL
);

CREATE TABLE "Position" (
  "position_id" integer PRIMARY KEY,
  "title" varchar,
  "description" text,
  "created_at" timestamp,
  "updated_at" timestamp,
  "current_flag" boolean NOT NULL
);

ALTER TABLE "Candidate" ADD FOREIGN KEY ("recruitment_id") REFERENCES "Recruitment" ("recruitment_id");

ALTER TABLE "Candidate" ADD FOREIGN KEY ("candidate_id") REFERENCES "Application" ("candidate_id");

ALTER TABLE "Job" ADD FOREIGN KEY ("job_id") REFERENCES "Application" ("job_id");

ALTER TABLE "Position" ADD FOREIGN KEY ("position_id") REFERENCES "Recruitment" ("position_id");
