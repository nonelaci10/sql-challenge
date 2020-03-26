DROP TABLE ;

CREATE TABLE departments(
    dept_no VARCHAR (20) PRIMARY KEY NOT NULL ,
    dept_name VARCHAR(40) NOT NULL
);
CREATE TABLE dept_emp(
    emp_no INT NOT NULL ,
    dept_no VARCHAR(20) NOT NULL,
    from_date DATE,
    to_date DATE,
 
);
CREATE TABLE dept_manager(
    dept_no VARCHAR(20) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE,
    to_date DATE,
    
);
CREATE TABLE employees(
    emp_no INT PRIMARY KEY NOT NULL,
    birth_date DATE,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    gender VARCHAR(10),
    hire_date DATE
);
CREATE TABLE salaries(
    emp_no INT PRIMARY KEY NOT NULL,
    salary INT ,
    from_date DATE,
    to_date DATE
);
CREATE TABLE titles(
    emp_no INT NOT NULL,
    title VARCHAR(30) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE,
    
);

CREATE TABLE "dept_emp" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "from_dates" DATES   NOT NULL,
    "to_dates" DATES   NOT NULL
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INTEGER   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_Name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "emp_no" INTEGER   NOT NULL,
    "title" VARHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "dept_managers" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_dept_managers" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "departments" ADD CONSTRAINT "fk_departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_managers" ("dept_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

