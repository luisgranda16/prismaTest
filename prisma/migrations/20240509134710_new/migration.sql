/*
  Warnings:

  - You are about to drop the `clients` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "clients";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "client" (
    "clientId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "contactDetails" TEXT NOT NULL,
    "companyDetails" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "project" (
    "projectId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "clientId" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "objectives" TEXT NOT NULL,
    "technicalRequirements" TEXT NOT NULL,
    "platformsAndTechnologies" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "quotationTemplate" (
    "templateId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "templateName" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "content" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "quotationDetail" (
    "quotationId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "projectId" INTEGER NOT NULL,
    "templateId" INTEGER NOT NULL,
    "dateCreated" DATETIME NOT NULL,
    "status" TEXT NOT NULL,
    "previewDetails" TEXT NOT NULL,
    "adjustmentDetails" TEXT NOT NULL,
    "submissionDetails" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "projectDatabase" (
    "projectId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "projectDetails" TEXT NOT NULL,
    "clientInformation" TEXT NOT NULL,
    "quotationHistory" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "documentIntegration" (
    "documentId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "projectId" INTEGER NOT NULL,
    "documentName" TEXT NOT NULL,
    "fileLocation" TEXT NOT NULL,
    "accessDetails" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "trackingPanel" (
    "trackingId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "projectStatus" TEXT NOT NULL,
    "progressDetails" TEXT NOT NULL,
    "taskDetails" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "automatedNotification" (
    "notificationId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "projectId" INTEGER NOT NULL,
    "notificationType" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "date" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "feedbackForm" (
    "feedbackId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "projectId" INTEGER NOT NULL,
    "feedbackContent" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    "date" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "satisfactionSurvey" (
    "surveyId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "projectId" INTEGER NOT NULL,
    "surveyContent" TEXT NOT NULL,
    "resultsAnalysis" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "userAdministration" (
    "userId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "permissions" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "profileManagement" (
    "profileId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "userId" INTEGER NOT NULL,
    "profileDetails" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "securityAndAuthentication" (
    "securityId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "userId" INTEGER NOT NULL,
    "passwordConfiguration" TEXT NOT NULL,
    "twoFactorAuthentication" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "templateCustomization" (
    "customizationId" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "templateId" INTEGER NOT NULL,
    "customSettings" TEXT NOT NULL
);
