/*
  Warnings:

  - You are about to drop the column `createdAt` on the `Issue` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Issue` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Issue` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Status` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Status` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[TelegramUserId]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `telegramUserId` to the `Issue` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Issue` table without a default value. This is not possible if the table is not empty.
  - Added the required column `telegramUserId` to the `Status` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Status` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Issue" DROP CONSTRAINT "Issue_userId_fkey";

-- DropForeignKey
ALTER TABLE "Status" DROP CONSTRAINT "Status_userId_fkey";

-- AlterTable
ALTER TABLE "Issue" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
DROP COLUMN "userId",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "telegramUserId" TEXT NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Status" DROP COLUMN "createdAt",
DROP COLUMN "userId",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "telegramUserId" TEXT NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "TelegramUserId" TEXT;

-- CreateTable
CREATE TABLE "TelegramUser" (
    "id" TEXT NOT NULL,
    "chatId" TEXT NOT NULL,
    "username" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TelegramUser_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Prtgdata" (
    "id" SERIAL NOT NULL,
    "objId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "tags" TEXT NOT NULL,
    "device" TEXT NOT NULL,
    "downtime" DOUBLE PRECISION NOT NULL,
    "downtimeTime" TEXT NOT NULL,
    "downtimeSince" TEXT,
    "uptime" DOUBLE PRECISION NOT NULL,
    "uptimeTime" TEXT NOT NULL,
    "warnSens" TEXT NOT NULL,
    "partialDownSens" TEXT NOT NULL,
    "downSens" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "lastUp" TEXT NOT NULL,
    "lastCheck" TEXT NOT NULL,
    "comments" TEXT,
    "minigraph" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Prtgdata_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "TelegramUser_chatId_key" ON "TelegramUser"("chatId");

-- CreateIndex
CREATE UNIQUE INDEX "User_TelegramUserId_key" ON "User"("TelegramUserId");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_TelegramUserId_fkey" FOREIGN KEY ("TelegramUserId") REFERENCES "TelegramUser"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Issue" ADD CONSTRAINT "Issue_telegramUserId_fkey" FOREIGN KEY ("telegramUserId") REFERENCES "TelegramUser"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Status" ADD CONSTRAINT "Status_telegramUserId_fkey" FOREIGN KEY ("telegramUserId") REFERENCES "TelegramUser"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
