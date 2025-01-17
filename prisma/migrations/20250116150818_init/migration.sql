/*
  Warnings:

  - A unique constraint covering the columns `[objId]` on the table `Prtgdata` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Prtgdata_objId_key" ON "Prtgdata"("objId");
