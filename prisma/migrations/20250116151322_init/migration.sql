/*
  Warnings:

  - You are about to drop the column `downSens` on the `Prtgdata` table. All the data in the column will be lost.
  - You are about to drop the column `downtimeSince` on the `Prtgdata` table. All the data in the column will be lost.
  - You are about to drop the column `downtimeTime` on the `Prtgdata` table. All the data in the column will be lost.
  - You are about to drop the column `lastCheck` on the `Prtgdata` table. All the data in the column will be lost.
  - You are about to drop the column `lastUp` on the `Prtgdata` table. All the data in the column will be lost.
  - You are about to drop the column `objId` on the `Prtgdata` table. All the data in the column will be lost.
  - You are about to drop the column `partialDownSens` on the `Prtgdata` table. All the data in the column will be lost.
  - You are about to drop the column `uptimeTime` on the `Prtgdata` table. All the data in the column will be lost.
  - You are about to drop the column `warnSens` on the `Prtgdata` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[objid]` on the table `Prtgdata` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `downsens` to the `Prtgdata` table without a default value. This is not possible if the table is not empty.
  - Added the required column `downtimetime` to the `Prtgdata` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lastcheck` to the `Prtgdata` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lastup` to the `Prtgdata` table without a default value. This is not possible if the table is not empty.
  - Added the required column `objid` to the `Prtgdata` table without a default value. This is not possible if the table is not empty.
  - Added the required column `partialdownsens` to the `Prtgdata` table without a default value. This is not possible if the table is not empty.
  - Added the required column `uptimetime` to the `Prtgdata` table without a default value. This is not possible if the table is not empty.
  - Added the required column `warnsens` to the `Prtgdata` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Prtgdata_objId_key";

-- AlterTable
ALTER TABLE "Prtgdata" DROP COLUMN "downSens",
DROP COLUMN "downtimeSince",
DROP COLUMN "downtimeTime",
DROP COLUMN "lastCheck",
DROP COLUMN "lastUp",
DROP COLUMN "objId",
DROP COLUMN "partialDownSens",
DROP COLUMN "uptimeTime",
DROP COLUMN "warnSens",
ADD COLUMN     "downsens" TEXT NOT NULL,
ADD COLUMN     "downtimesince" TEXT,
ADD COLUMN     "downtimetime" TEXT NOT NULL,
ADD COLUMN     "lastcheck" TEXT NOT NULL,
ADD COLUMN     "lastup" TEXT NOT NULL,
ADD COLUMN     "objid" INTEGER NOT NULL,
ADD COLUMN     "partialdownsens" TEXT NOT NULL,
ADD COLUMN     "uptimetime" TEXT NOT NULL,
ADD COLUMN     "warnsens" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Prtgdata_objid_key" ON "Prtgdata"("objid");
