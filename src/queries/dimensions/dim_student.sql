
-- Creating table students 
CREATE OR REPLACE TABLE rivadata_platform.dataproduct.dim_student(
    student_key	    BIGINT NOT NULL,
    student_id	    STRING NOT NULL,
    student_name	STRING NOT NULL,
    email	        STRING NOT NULL,
    city	        STRING,
    country	        STRING,
    phone_no	    STRING,
    linkedin_link	STRING,
    github_link	    STRING,
    created_at	    TIMESTAMP NOT NULL,

    CONSTRAINT pk_dim_student 
      PRIMARY KEY (student_key)
);

---Inserting Data into students
INSERT INTO rivadata_platform.dataproduct.dim_student (
    student_key,
    student_id,
    student_name,
    email,
    city,
    country,
    phone_no,
    linkedin_link,
    github_link,
    created_at
)

-- Query on table as per requirement 
SELECT
    ROW_NUMBER() OVER (
        ORDER BY CAST(student_id AS BIGINT)
    ) AS student_key,
    student_id,
    name,
    email,
    city,
    country,
    phone_no,
    linkedin_link,
    github_link,
    CAST(created_at AS TIMESTAMP)
FROM rivadata_platform.landing.students;

 
