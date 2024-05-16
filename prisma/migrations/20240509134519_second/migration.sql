/*
  Warnings:

  - The primary key for the `quotations` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `actual_total_hours` on the `quotations` table. All the data in the column will be lost.
  - You are about to drop the column `completion_date` on the `quotations` table. All the data in the column will be lost.
  - You are about to drop the column `estimated_deadline` on the `quotations` table. All the data in the column will be lost.
  - You are about to drop the column `estimated_total_hours` on the `quotations` table. All the data in the column will be lost.
  - You are about to drop the column `id_quotations` on the `quotations` table. All the data in the column will be lost.
  - You are about to drop the column `start_date` on the `quotations` table. All the data in the column will be lost.
  - The primary key for the `pendingProject` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id_project` on the `pendingProject` table. All the data in the column will be lost.
  - You are about to drop the column `start_date` on the `pendingProject` table. All the data in the column will be lost.
  - The primary key for the `reminder` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id_reminder` on the `reminder` table. All the data in the column will be lost.
  - You are about to drop the column `task_description` on the `reminder` table. All the data in the column will be lost.
  - Added the required column `actualTotalHours` to the `quotations` table without a default value. This is not possible if the table is not empty.
  - Added the required column `estimatedDeadline` to the `quotations` table without a default value. This is not possible if the table is not empty.
  - Added the required column `estimatedTotalHours` to the `quotations` table without a default value. This is not possible if the table is not empty.
  - Added the required column `quotationsId` to the `quotations` table without a default value. This is not possible if the table is not empty.
  - Added the required column `startDate` to the `quotations` table without a default value. This is not possible if the table is not empty.
  - Added the required column `projectId` to the `pendingProject` table without a default value. This is not possible if the table is not empty.
  - Added the required column `startSate` to the `pendingProject` table without a default value. This is not possible if the table is not empty.
  - Added the required column `reminderId` to the `reminder` table without a default value. This is not possible if the table is not empty.
  - Added the required column `taskDescription` to the `reminder` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "clients" (
    "clientsID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_quotations" (
    "quotationsId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "status" TEXT NOT NULL,
    "startDate" DATETIME NOT NULL,
    "estimatedDeadline" DATETIME NOT NULL,
    "completionDate" DATETIME,
    "estimatedTotalHours" INTEGER NOT NULL,
    "actualTotalHours" INTEGER NOT NULL
);
INSERT INTO "new_quotations" ("status") SELECT "status" FROM "quotations";
DROP TABLE "quotations";
ALTER TABLE "new_quotations" RENAME TO "quotations";
CREATE TABLE "new_pendingProject" (
    "projectId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "startSate" DATETIME NOT NULL,
    "deadline" DATETIME NOT NULL,
    "status" TEXT NOT NULL
);
INSERT INTO "new_pendingProject" ("deadline", "status") SELECT "deadline", "status" FROM "pendingProject";
DROP TABLE "pendingProject";
ALTER TABLE "new_pendingProject" RENAME TO "pendingProject";
CREATE TABLE "new_reminder" (
    "reminderId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "taskDescription" TEXT NOT NULL,
    "deadline" DATETIME NOT NULL
);
INSERT INTO "new_reminder" ("deadline") SELECT "deadline" FROM "reminder";
DROP TABLE "reminder";
ALTER TABLE "new_reminder" RENAME TO "reminder";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "clients_clientsID_key" ON "clients"("clientsID");
