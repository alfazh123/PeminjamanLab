/*
  Warnings:

  - You are about to drop the `AssistantLabolatory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Borrow` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Labolatory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "AssistantLabolatory" DROP CONSTRAINT "AssistantLabolatory_labolatoryId_fkey";

-- DropForeignKey
ALTER TABLE "AssistantLabolatory" DROP CONSTRAINT "AssistantLabolatory_userId_fkey";

-- DropForeignKey
ALTER TABLE "Borrow" DROP CONSTRAINT "Borrow_labolatoryId_fkey";

-- DropForeignKey
ALTER TABLE "Borrow" DROP CONSTRAINT "Borrow_userId_fkey";

-- DropTable
DROP TABLE "AssistantLabolatory";

-- DropTable
DROP TABLE "Borrow";

-- DropTable
DROP TABLE "Labolatory";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "Lecturers" (
    "NIP" SERIAL NOT NULL,
    "Email" TEXT NOT NULL,
    "Name" TEXT NOT NULL,

    CONSTRAINT "Lecturers_pkey" PRIMARY KEY ("NIP")
);

-- CreateTable
CREATE TABLE "Students" (
    "NIM" SERIAL NOT NULL,
    "Email" TEXT NOT NULL,
    "Name" TEXT NOT NULL,
    "Batch" INTEGER NOT NULL,

    CONSTRAINT "Students_pkey" PRIMARY KEY ("NIM")
);

-- CreateTable
CREATE TABLE "LabAdmins" (
    "NIM" INTEGER NOT NULL,
    "DateOfStart" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LabAdmins_pkey" PRIMARY KEY ("NIM")
);

-- CreateTable
CREATE TABLE "LabHeads" (
    "NIP" INTEGER NOT NULL,
    "DateOfStart" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LabHeads_pkey" PRIMARY KEY ("NIP")
);

-- CreateTable
CREATE TABLE "Courses" (
    "CourseCODE" SERIAL NOT NULL,
    "CourseName" TEXT NOT NULL,
    "LectureNIP" INTEGER NOT NULL,

    CONSTRAINT "Courses_pkey" PRIMARY KEY ("CourseCODE")
);

-- CreateTable
CREATE TABLE "Enrollments" (
    "EnrollmentID" SERIAL NOT NULL,
    "StudentNIM" INTEGER NOT NULL,
    "CourseCODE" INTEGER NOT NULL,

    CONSTRAINT "Enrollments_pkey" PRIMARY KEY ("EnrollmentID")
);

-- CreateTable
CREATE TABLE "EquipmentDetails" (
    "EquipmentID" SERIAL NOT NULL,
    "EquipmentName" TEXT NOT NULL,
    "EquipmentCondition" TEXT NOT NULL,
    "EquipmentType" TEXT NOT NULL,
    "LastMaintenance" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EquipmentDetails_pkey" PRIMARY KEY ("EquipmentID")
);

-- CreateTable
CREATE TABLE "Equipments" (
    "EquipmentID" SERIAL NOT NULL,
    "EquipmentQuantity" INTEGER NOT NULL,
    "DateOfPurchase" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Equipments_pkey" PRIMARY KEY ("EquipmentID")
);

-- CreateTable
CREATE TABLE "LabUsages" (
    "LabUsageID" SERIAL NOT NULL,
    "LabUsageDate" TIMESTAMP(3) NOT NULL,
    "LabUsageDuration" INTEGER NOT NULL,
    "LAbUsageType" TEXT NOT NULL,

    CONSTRAINT "LabUsages_pkey" PRIMARY KEY ("LabUsageID")
);

-- CreateTable
CREATE TABLE "LabEquipmentUsages" (
    "BorroowID" SERIAL NOT NULL,
    "LabUsageID" INTEGER NOT NULL,
    "EquipmentID" INTEGER NOT NULL,
    "BorrowQuantity" INTEGER NOT NULL,
    "equipmentDetailsEquipmentID" INTEGER,

    CONSTRAINT "LabEquipmentUsages_pkey" PRIMARY KEY ("BorroowID")
);

-- CreateTable
CREATE TABLE "ThesisLabUsage" (
    "BorroowID" SERIAL NOT NULL,
    "StudentNIM" INTEGER NOT NULL,
    "LabUsageID" INTEGER NOT NULL,
    "ThesisSupervisorNIP" INTEGER NOT NULL,
    "ThesisTopic" TEXT NOT NULL,

    CONSTRAINT "ThesisLabUsage_pkey" PRIMARY KEY ("BorroowID")
);

-- CreateTable
CREATE TABLE "PracticalLabUsage" (
    "LabUsageID" SERIAL NOT NULL,
    "CourseCODE" INTEGER NOT NULL,
    "AdminNIM" INTEGER NOT NULL,

    CONSTRAINT "PracticalLabUsage_pkey" PRIMARY KEY ("LabUsageID")
);

-- CreateTable
CREATE TABLE "TaskUsages" (
    "LabUsageID" SERIAL NOT NULL,
    "TaskTopic" TEXT NOT NULL,
    "AdminNIM" INTEGER NOT NULL,
    "StudentNIM" INTEGER NOT NULL,

    CONSTRAINT "TaskUsages_pkey" PRIMARY KEY ("LabUsageID")
);

-- CreateTable
CREATE TABLE "IncidentalLabUsages" (
    "LabUsageID" SERIAL NOT NULL,
    "LabUsageDescription" TEXT NOT NULL,
    "LabUsageRequestName" TEXT NOT NULL,
    "LabUsageRequestEmail" TEXT NOT NULL,
    "LabUsageRequestPhone" TEXT NOT NULL,
    "PermissionStatus" TEXT NOT NULL,
    "PermissionNIP" INTEGER NOT NULL,
    "BorroowID" INTEGER NOT NULL,

    CONSTRAINT "IncidentalLabUsages_pkey" PRIMARY KEY ("LabUsageID")
);

-- CreateIndex
CREATE UNIQUE INDEX "Lecturers_Email_key" ON "Lecturers"("Email");

-- CreateIndex
CREATE UNIQUE INDEX "Students_Email_key" ON "Students"("Email");

-- AddForeignKey
ALTER TABLE "LabAdmins" ADD CONSTRAINT "LabAdmins_NIM_fkey" FOREIGN KEY ("NIM") REFERENCES "Students"("NIM") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabHeads" ADD CONSTRAINT "LabHeads_NIP_fkey" FOREIGN KEY ("NIP") REFERENCES "Lecturers"("NIP") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Courses" ADD CONSTRAINT "Courses_LectureNIP_fkey" FOREIGN KEY ("LectureNIP") REFERENCES "Lecturers"("NIP") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Enrollments" ADD CONSTRAINT "Enrollments_StudentNIM_fkey" FOREIGN KEY ("StudentNIM") REFERENCES "Students"("NIM") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Enrollments" ADD CONSTRAINT "Enrollments_CourseCODE_fkey" FOREIGN KEY ("CourseCODE") REFERENCES "Courses"("CourseCODE") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipments" ADD CONSTRAINT "Equipments_EquipmentID_fkey" FOREIGN KEY ("EquipmentID") REFERENCES "EquipmentDetails"("EquipmentID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabEquipmentUsages" ADD CONSTRAINT "LabEquipmentUsages_LabUsageID_fkey" FOREIGN KEY ("LabUsageID") REFERENCES "LabUsages"("LabUsageID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabEquipmentUsages" ADD CONSTRAINT "LabEquipmentUsages_EquipmentID_fkey" FOREIGN KEY ("EquipmentID") REFERENCES "Equipments"("EquipmentID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LabEquipmentUsages" ADD CONSTRAINT "LabEquipmentUsages_equipmentDetailsEquipmentID_fkey" FOREIGN KEY ("equipmentDetailsEquipmentID") REFERENCES "EquipmentDetails"("EquipmentID") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ThesisLabUsage" ADD CONSTRAINT "ThesisLabUsage_BorroowID_fkey" FOREIGN KEY ("BorroowID") REFERENCES "LabEquipmentUsages"("BorroowID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ThesisLabUsage" ADD CONSTRAINT "ThesisLabUsage_StudentNIM_fkey" FOREIGN KEY ("StudentNIM") REFERENCES "Students"("NIM") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ThesisLabUsage" ADD CONSTRAINT "ThesisLabUsage_LabUsageID_fkey" FOREIGN KEY ("LabUsageID") REFERENCES "LabUsages"("LabUsageID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ThesisLabUsage" ADD CONSTRAINT "ThesisLabUsage_ThesisSupervisorNIP_fkey" FOREIGN KEY ("ThesisSupervisorNIP") REFERENCES "Lecturers"("NIP") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PracticalLabUsage" ADD CONSTRAINT "PracticalLabUsage_LabUsageID_fkey" FOREIGN KEY ("LabUsageID") REFERENCES "LabUsages"("LabUsageID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PracticalLabUsage" ADD CONSTRAINT "PracticalLabUsage_CourseCODE_fkey" FOREIGN KEY ("CourseCODE") REFERENCES "Courses"("CourseCODE") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PracticalLabUsage" ADD CONSTRAINT "PracticalLabUsage_AdminNIM_fkey" FOREIGN KEY ("AdminNIM") REFERENCES "LabAdmins"("NIM") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskUsages" ADD CONSTRAINT "TaskUsages_LabUsageID_fkey" FOREIGN KEY ("LabUsageID") REFERENCES "LabUsages"("LabUsageID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskUsages" ADD CONSTRAINT "TaskUsages_AdminNIM_fkey" FOREIGN KEY ("AdminNIM") REFERENCES "LabAdmins"("NIM") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskUsages" ADD CONSTRAINT "TaskUsages_StudentNIM_fkey" FOREIGN KEY ("StudentNIM") REFERENCES "Students"("NIM") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IncidentalLabUsages" ADD CONSTRAINT "IncidentalLabUsages_LabUsageID_fkey" FOREIGN KEY ("LabUsageID") REFERENCES "LabUsages"("LabUsageID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IncidentalLabUsages" ADD CONSTRAINT "IncidentalLabUsages_PermissionNIP_fkey" FOREIGN KEY ("PermissionNIP") REFERENCES "LabHeads"("NIP") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IncidentalLabUsages" ADD CONSTRAINT "IncidentalLabUsages_BorroowID_fkey" FOREIGN KEY ("BorroowID") REFERENCES "LabEquipmentUsages"("BorroowID") ON DELETE RESTRICT ON UPDATE CASCADE;
