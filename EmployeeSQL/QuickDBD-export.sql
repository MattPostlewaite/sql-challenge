-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/3xD7Wq
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "Dept_No" VARCHAR   NOT NULL,
    "Dept_Name" VARCHAR   NOT NULL
);

CREATE TABLE "EmployeeDepartments" (
    "Employee_No" INTEGER   NOT NULL,
    "Dept_No" VARCHAR   NOT NULL
);

CREATE TABLE "DepartmentManager" (
    "Dept_No" VARCHAR   NOT NULL,
    "Employee_No" INTEGER   NOT NULL
);

CREATE TABLE "Employees" (
    "Employee_No" INTEGER   NOT NULL,
    "Employee_Title_ID" VARCHAR   NOT NULL,
    "Birth_Date" INTEGER   NOT NULL,
    "First_Name" VARCHAR   NOT NULL,
    "Last_Name" VARCHAR   NOT NULL,
    "Sex" VARCHAR   NOT NULL,
    "Hire_Date" INTEGER   NOT NULL
);

CREATE TABLE "Titles" (
    "Title_ID" VARCHAR   NOT NULL,
    "Title" VARCHAR   NOT NULL
);

CREATE TABLE "Salaries" (
    "Employee_No" INTEGER   NOT NULL,
    "Salary" INTEGER   NOT NULL
);

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "DepartmentManager" ("Dept_No");

ALTER TABLE "EmployeeDepartments" ADD CONSTRAINT "fk_EmployeeDepartments_Employee_No" FOREIGN KEY("Employee_No")
REFERENCES "Salaries" ("Employee_No");

ALTER TABLE "EmployeeDepartments" ADD CONSTRAINT "fk_EmployeeDepartments_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "DepartmentManager" ("Dept_No");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_Employee_No" FOREIGN KEY("Employee_No")
REFERENCES "EmployeeDepartments" ("Employee_No");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Employee_No" FOREIGN KEY("Employee_No")
REFERENCES "EmployeeDepartments" ("Employee_No");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_Title_ID" FOREIGN KEY("Title_ID")
REFERENCES "Employees" ("Employee_Title_ID");

