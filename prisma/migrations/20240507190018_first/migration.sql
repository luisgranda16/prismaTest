-- CreateTable
CREATE TABLE "quotations" (
    "id_quotations" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "status" TEXT NOT NULL,
    "start_date" DATETIME NOT NULL,
    "estimated_deadline" DATETIME NOT NULL,
    "completion_date" DATETIME,
    "estimated_total_hours" INTEGER NOT NULL,
    "actual_total_hours" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "pendingProject" (
    "id_project" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "start_date" DATETIME NOT NULL,
    "deadline" DATETIME NOT NULL,
    "status" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "notification" (
    "id_notification" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "type" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "date" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "reminder" (
    "id_reminder" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "task_description" TEXT NOT NULL,
    "deadline" DATETIME NOT NULL
);
