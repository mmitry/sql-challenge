-- Titles Table
CREATE TABLE "Titles" (
    "title_id" varchar(10) NOT NULL,
    "title" varchar(50) NOT NULL,
    "last_updates" timestamp DEFAULT localtimestamp NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY ("title_id")
);

-- Departments Table
CREATE TABLE "departments" (
    "dep_no" varchar(10) NOT NULL,
    "dept_name" varchar(50) NOT NULL,
    "last_updated" timestamp DEFAULT localtimestamp NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY ("dep_no")
);

-- Employees Table
CREATE TABLE "employees" (
    "emp_no" int NOT NULL,
    "emp_title_id" varchar(10) NOT NULL,
    "birth_date" date NOT NULL,
    "first_name" varchar(50) NOT NULL,
    "last_name" varchar(50) NOT NULL,
    "sex" varchar(5) NOT NULL,
    "hire_date" date NOT NULL,
    "last_updated" timestamp DEFAULT localtimestamp NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no"),
    CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY ("emp_title_id") REFERENCES "Titles" ("title_id")
);

-- Salaries Table
CREATE TABLE "salaries" (
    "salary_id" serial NOT NULL,
    "emp_no" int NOT NULL,
    "salary" int NOT NULL,
    "last_updated" timestamp DEFAULT localtimestamp NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY ("salary_id"),
    CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);

-- Dept_Emp Table
CREATE TABLE "dept_emp" (
    "dept_emp_id" serial NOT NULL,
    "emp_no" int NOT NULL,
    "dept_no" varchar(10) NOT NULL,
    "last_updated" timestamp DEFAULT localtimestamp NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY ("dept_emp_id"),
    CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no"),
    CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dep_no")
);

-- Dept_Manager Table
CREATE TABLE "dept_manager" (
    "dept_manager_id" serial NOT NULL,
    "dept_no" varchar(10) NOT NULL,
    "emp_no" int NOT NULL,
    "last_updated" timestamp DEFAULT localtimestamp NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY ("dept_manager_id"),
    CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dep_no"),
    CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);

