/*
  Warnings:

  - You are about to drop the column `telegramUserId` on the `Issue` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Issue" DROP CONSTRAINT "Issue_telegramUserId_fkey";

-- AlterTable
ALTER TABLE "Issue" DROP COLUMN "telegramUserId";

-- CreateTable
CREATE TABLE "Sensorlist" (
    "id" SERIAL NOT NULL,
    "objid" INTEGER NOT NULL,
    "telegramUserId" TEXT,

    CONSTRAINT "Sensorlist_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Sensorlist_objid_key" ON "Sensorlist"("objid");

-- AddForeignKey
ALTER TABLE "Sensorlist" ADD CONSTRAINT "Sensorlist_telegramUserId_fkey" FOREIGN KEY ("telegramUserId") REFERENCES "TelegramUser"("id") ON DELETE CASCADE ON UPDATE CASCADE;
